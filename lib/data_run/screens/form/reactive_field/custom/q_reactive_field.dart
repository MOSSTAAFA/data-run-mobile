import 'dart:async';

import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_parse_extension.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviours.dart';
import 'package:mass_pro/data_run/screens/form/rule/evaluation_engine.dart';
import 'package:mass_pro/data_run/screens/form/rule/rule_evaluator.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

typedef QReactiveFormFieldBuilder<T, K> = Widget Function(
    QReactiveFormFieldState<T, K> field);

class QReactiveFormField<ModelDataType, ViewDataType>
    extends ReactiveFormField<ModelDataType, ViewDataType> {
  QReactiveFormField(
      {super.key,
      super.valueAccessor,
      super.showErrors,
      Map<String, ValidationMessageFunction>? validationMessages,
      super.focusNode,
      required this.builder,
      required this.element})
      : super(
            // validationMessages:
            //     validationMessages ?? element.elementControl.validationMessages,
            formControl: element.elementControl as FormControl<ModelDataType>,
            builder: (field) {
              field as QReactiveFormFieldState<ModelDataType, ViewDataType>;
              return Visibility(
                  visible: field.fieldElement.visible, child: builder(field));
            });

  final FormFieldElement<ModelDataType> element;
  final QReactiveFormFieldBuilder<ModelDataType, ViewDataType> builder;

  @override
  QReactiveFormFieldState<ModelDataType, ViewDataType> createState() =>
      QReactiveFormFieldState<ModelDataType, ViewDataType>();
}

// State for base reactive form Field
class QReactiveFormFieldState<ModelDataType, ViewDataType>
    extends ReactiveFormFieldState<ModelDataType, ViewDataType> {
  late final FormFieldElement<ModelDataType> fieldElement;
  late final List<StreamSubscription<ControlStatus>> _dependenciesSubscription;
  late final Map<String, FormElementInstance<dynamic>> resolvedDependencies;

  // late final Map<String, List<ActionBehaviour>> actionsBehaviours;

  bool _isEvaluating = false;

  @override
  void initState() {
    fieldElement =
        (widget as QReactiveFormField<ModelDataType, ViewDataType>).element;
    resolvedDependencies = _resolveDependencies(fieldElement);

    _dependenciesSubscription = _subscribeToDependencies();

    _evaluateFieldInitialState(resolvedDependencies);

    /// evaluate this field initial state based on the state of others

    super.initState();
  }

  @protected
  @mustCallSuper
  void subscribeControl() {
    super.subscribeControl();
  }

  Future<void> _cancelDependenciesSubscription() async {
    logDebug('_cancelDependenciesSubscription: ${fieldElement.name}');
    for (final sub in _dependenciesSubscription) {
      await sub.cancel();
    }
    _dependenciesSubscription.clear();
    resolvedDependencies.clear();
  }

  @protected
  @mustCallSuper
  void unsubscribeControl() {
    _cancelDependenciesSubscription();
    super.unsubscribeControl();
  }

  Map<String, FormElementInstance<dynamic>> _resolveDependencies(
      FormFieldElement<ModelDataType> element) {
    logDebug(
        'resolving: ${element.name}\'s dependencies: [${element.dependenciesNames}]');
    final Map<String, FormElementInstance<dynamic>> resolved = {};
    for (final dependencyName in element.dependenciesNames) {
      final dependency = element.findElementInParentSection(dependencyName);
      if (dependency != null) {
        resolved[dependencyName] = dependency;
      } else {}
    }

    return resolved;
  }

  List<String> getUnresolvedDependencies() {
    return fieldElement.dependenciesNames
        .where((name) => !resolvedDependencies.keys.contains(name))
        .toList();
  }

  Map<String, List<ActionBehaviour>> _dependenciesActionsBehaviours(
      Map<String, FormElementInstance<dynamic>> dependencies) {
    return dependencies.map((k, v) {
      return MapEntry(
          k,
          fieldElement.rulesToEvaluate(k).map((rule) {
            return ActionBehaviourFactory.createAction(rule);
          }).toList());
    });
  }

  List<ActionBehaviour> _dependencyActionsBehaviours(String dependency) {
    return fieldElement.rulesToEvaluate(dependency).map((rule) {
      return ActionBehaviourFactory.createAction(rule);
    }).toList();
  }

  Map<String, dynamic> getEvaluationContext() {
    return {
      for (final dependency in resolvedDependencies.values)
        dependency.name: dependency.value
    };
  }

  @override
  void onControlValueChanged(dynamic value) {
    super.onControlValueChanged(value);
  }

  List<StreamSubscription<ControlStatus>> _subscribeToDependencies() {
    final List<StreamSubscription<ControlStatus>> subs =
        resolvedDependencies.values.map((dependency) {
      return dependency.elementControl!.statusChanged.listen((onData) {
        logDebug(
            'elementCallback.. Notifier: ${dependency.name}, notifying: ${fieldElement.name}');
        _onDependencyChanged(dependency.name, dependency.value);
      });
    }).toList();
    return subs;
  }

  void _evaluateAndApply(String dependency, dynamic value) {
    final actions = _dependencyActionsBehaviours(dependency);
    final evalContext = getEvaluationContext();
    final evaluator = RuleEvaluator(actions, evalContext: evalContext);
    evaluator.evaluateAndApply(fieldElement);
    if (fieldElement.type.isSectionType &&
        fieldElement.filteringDependencies.contains(dependency)) {
      evaluateFieldFilter(dependency, value);
    }
  }

  void evaluateFieldFilter(String dependency, dynamic value) {
    final List<FormOption> updatedOptions = [];
    try {
      loggerEvaluation.d({
        'Listener: ${fieldElement.name} notified: $dependency changed to':
            '$value',
        'Evaluating Filter:':
            '${fieldElement.template.choiceFilter != null ? '\'${fieldElement.template.choiceFilter}\'' : ''}',
      });

      updatedOptions.addAll(filterOptions(dependency, value));
    } catch (e) {
      loggerEvaluation.e(
          'Error evaluating filter: ${fieldElement.name}, for filter context element: ${dependency}');
    } finally {
      fieldElement.updateOptions(updatedOptions);

      fieldElement.elementControl!.reset(
          value: updatedOptions
              .where((option) => option.name == value)
              .firstOrNull,
          emitEvent: true,
          updateParent: true);
    }
  }

  List<FormOption> filterOptions(String dependencyChangedName, dynamic value) {
    final filteredOptions = fieldElement.template.options.where((option) {
      final optionContext = option.toContext();
      final evaluationContext = {...optionContext, ...getEvaluationContext()};
      return evaluationEngine.evaluateExpression(
          fieldElement.template.evalChoiceFilterExpression!, evaluationContext);
    }).toList();
    logDebug(
        '${fieldElement.name}\'s filteredOptions ${filteredOptions.map((o) => o.name).toList()} ');
    return filteredOptions;
  }

  /// didUpdateElement(covariant FormElement<E> oldElement)
  /// void didChange(ViewDataType value)
  /// void didChangeDependencies()
  void _onDependencyChanged(String dependency, dynamic value) {
    if (_isEvaluating) {
      return;
    }

    _isEvaluating = true;

    try {
      _evaluateAndApply(dependency, value);
    } finally {
      _isEvaluating = false;
      // fieldElement.elementControl!.markAsDirty();
      setState(() {});
      // super.onControlValueChanged(value);
    }
  }

  void _evaluateFieldInitialState(
      Map<String, FormElementInstance<dynamic>> dependencies) {
    for (final dependency in dependencies.values) {
      logDebug(
          'Evaluating initState: ${fieldElement.name} for $dependency init value: ${dependency.value}');
      _evaluateAndApply(dependency.name, dependency.value);
      // _onDependencyChanged(dependency.name, dependency.value);
      // fieldElement.elementControl!.markAsTouched();
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return (widget as QReactiveFormField<ModelDataType, ViewDataType>)
  //       .builder(this);
  // }
}
