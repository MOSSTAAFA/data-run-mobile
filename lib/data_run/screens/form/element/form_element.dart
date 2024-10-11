import 'dart:async';

import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_parse_extension.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/extensions/list_extensions.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/form_state/element_providers.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_control_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/members/form_element_members.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour_factory.dart';
import 'package:mass_pro/data_run/screens/form/rule/evaluation_engine.dart';
import 'package:mass_pro/data_run/screens/form/rule/rule_evaluator.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:logger/logger.dart';

part 'field_instance.dart';

part 'section_element.dart';

part 'section_instance.dart';

part 'repeat_instance.dart';

part 'repeat_item_instance.dart';

part 'extension/element.extension.dart';

part 'extension/element_dependency.extension.dart';

part 'extension/element_rule.extension.dart';

sealed class FormElementInstance<T> extends ElementRuleEvaluationContext<T>
    with ChangeNotifier {
  final _loggerEvaluation = Logger(
      printer: PrettyPrinter(
          colors: true,
          methodCount: 0,
          printEmojis: false,
          excludeBox: {Level.trace: true, Level.info: true}),
      level: Level.debug);

  FormElementInstance(
      {required this.form, required this.template, bool hidden = false})
      : _elementState =
            FormElementState(hidden: hidden, mandatory: template.mandatory) {
    if (hidden) {
      markAsHidden(emitEvent: false);
    }
  }

  /// serialized from the field json configuration
  final FieldTemplate template;
  final FormGroup form;

  final Map<String, FormElementInstance<dynamic>> _resolvedDependencies = {};
  final List<StreamSubscription<ControlStatus>> _dependenciesSubscription = [];

  FormElementInstance<Object>? _parentSection;
  FormElementState<T> _elementState;

  String get name => template.name;

  List<Rule> get rules => template.rules;

  List<String> get rulesDependencies => template.dependencies;

  List<String> get dependenciesNames =>
      [...template.filterDependencies, ...template.dependencies];

  List<Rule> rulesToEvaluate(String dependency) =>
      rules.where((rule) => rule.dependencies.contains(dependency)).toList();

  Map<String, dynamic> getEvaluationContext() => {
        for (final dependency in resolvedDependencies.values)
          dependency.name: dependency.value
      };

  Map<String, FormElementInstance<dynamic>> get resolvedDependencies =>
      Map.unmodifiable(_resolvedDependencies);

  List<String> get unresolvedDependencies => dependenciesNames
      .where((name) => !resolvedDependencies.keys.contains(name))
      .toList();

  Map<String, String?> get resolvedDependenciesPaths => {
        for (final dependency in resolvedDependencies.values)
          dependency.name: dependency.elementPath
      };

  //</editor-fold>

  ValueType get type => template.type;

  FormElementInstance<Object>? get parentSection => _parentSection;

  set parentSection(FormElementInstance<Object>? parent) {
    if (this is RepeatItemInstance && !(parent is RepeatInstance?)) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parent.runtimeType}');
    }

    _parentSection = parent;
  }

  FormElementState<T> get elementState => _elementState;

  bool get hidden => elementState.hidden;

  bool get visible => !hidden;

  String get label =>
      '${getItemLocalString(template.label, defaultString: template.name)}${mandatory ? '*' : ''}';

  bool get mandatory =>
      elementControl?.validators.contains(Validators.required) == true;

  String get elementPath => pathBuilder(name);

  T? get value => elementControl?.value;

  AbstractControl<dynamic>? get elementControl =>
      controlExist ? form.control(elementPath) : null;

  String get pathRecursive {
    return parentSection != null
        ? '${parentSection!.pathRecursive}.${name}'
        : name;
  }

  String pathBuilder(String? pathItem) =>
      [parentSection?.pathRecursive, pathItem].whereType<String>().join('.');

  bool get controlExist {
    try {
      form.control(pathRecursive);
      return true;
    } catch (e) {
      return false;
    }
  }

  // void updateValue(T? value, {bool updateParent = true, bool emitEvent = true});

  // void patchValue(T? value, {bool updateParent = true, bool emitEvent = true});

  // @protected
  // bool allElementsDisabled() => elementControl?.disabled == true;

  @protected
  bool allElementsHidden() => hidden;

  // @protected
  // bool anyElements(
  //     bool Function(FormElementInstance<dynamic> element) condition);

  @protected
  void forEachChild(
      void Function(FormElementInstance<dynamic> element) callback);

  @protected
  FormElementInstance<dynamic>? findElement(String path);

  Map<String, dynamic> flattenElements(
      Map<String, dynamic> formMap, String prefix) {
    final flatMap = <String, dynamic>{};
    formMap.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        flatMap.addAll(flattenElements(value, '$prefix.$key'));
      } else {
        flatMap['$key'] = value;
      }
    });
    return flatMap;
  }

  void reset({
    T? value,
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? hidden,
  }) {
    if (hidden != null) {
      hidden
          ? markAsHidden(updateParent: false, emitEvent: emitEvent)
          : markAsVisible(updateParent: false, emitEvent: emitEvent);
    }
    elementControl?.reset(
        value: value,
        updateParent: updateParent,
        emitEvent: emitEvent,
        removeFocus: removeFocus);
  }

  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    if (hidden) {
      return;
    }
    _loggerEvaluation.i(
        'mark: $name as Hidden, updateParent: $updateParent, emitEvent: $emitEvent');
    _elementState = _elementState.copyWith(hidden: true);
    // elementControl?.markAsDisabled(
    //     updateParent: updateParent, emitEvent: true);
  }

  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    if (visible) {
      return;
    }
    _loggerEvaluation.i(
        'mark: $name as Visible, updateParent: $updateParent, emitEvent: $emitEvent');
    _elementState = _elementState.copyWith(hidden: false);
    // elementControl?.markAsEnabled(
    //     updateParent: updateParent, emitEvent: emitEvent);
  }

  void toggleMandatory({bool updateParent = true, bool emitEvent = true}) {
    if (mandatory &&
        elementControl?.validators.contains(Validators.required) == true) {
      elementControl?.setValidators(
          [...?elementControl?.validators, Validators.required],
          updateParent: updateParent, emitEvent: emitEvent);
    } else {
      elementControl?.setValidators(
          [...?elementControl?.validators?..remove(Validators.required)],
          updateParent: updateParent, emitEvent: emitEvent);
    }

    // notifyDependents();
  }

  void setErrors(Map<String, dynamic> errors, {bool markAsDirty = true}) {
    elementControl?.setErrors(errors, markAsDirty: markAsDirty);
    // notifyDependents();
  }

  void removeError(String key, {bool markAsDirty = false}) {
    elementControl?.removeError(key, markAsDirty: markAsDirty);
    // notifyDependents();
  }

  void setWarning(Map<String, dynamic> errors, {bool markAsDirty = true}) {
    // implement
  }

  void removeWarning(String key, {bool markAsDirty = false}) {
    // implement
  }

  @mustCallSuper
  void evaluateAndApply(String dependency, dynamic value) {
    final oldElementState = elementState.copyWith();
    if (template.dependencies.contains(dependency)) {
      loggerEvaluation
          .d('element: $name evaluate rules with: $dependency= $value');
      try {
        final actions = dependencyActionsBehaviours(dependency);
        final evaluator =
            RuleEvaluator(actions, evalContext: getEvaluationContext());
        evaluator.evaluateAndApply(this);
      } catch (e) {
        logError(error: 'Error evaluating: ${name}, notifier: ${dependency}');
      } finally {
        if (oldElementState != _elementState) {
          logDebug('$name\': evaluation of $dependency, changed my state');
        }
        elementControl!.markAsDirty(emitEvent: true);
      }
    }
  }

  List<StreamSubscription<ControlStatus>> subscribeToDependencies(
      Map<String, FormElementInstance<dynamic>> dependencies) {
    cancelSubscriptions();
    _resolvedDependencies.clear();
    _resolvedDependencies.addAll(dependencies);

    final List<StreamSubscription<ControlStatus>> subs =
        _resolvedDependencies.values.map((dependency) {
      logDebug(
          'elementCallback.. Notifier: ${dependency.name}, notifying: ${name}');
      return dependency.elementControl!.statusChanged.listen((onData) {
        evaluateAndApply(dependency.name, dependency.value);
      });
    }).toList();


    return subs;
  }

  Future<void> cancelSubscriptions() async {
    for(final sub in _dependenciesSubscription) {
      logDebug(
          'cancel Subscriptions: ${name}\'s');
      await sub.cancel();
    }
    _dependenciesSubscription.clear();
  }

  void dispose() {
    super.dispose();
    logDebug('dispose element $name');
    loggerEvaluation.i({
      'element': '$name disposed,',
      // 'Listeners': '${_listeners.values.map((i) => i.name).toList()}',
      // 'Notifiers': '${_notifiers.values.map((i) => i.name).toList()}'
    });
    // _notifiers.values
    //     .forEach((notifyingElement) => notifyingElement.removeListener(name));
    // _listeners.values
    //     .forEach((listener) => listener.onDependencyChanged(name, value));
    // _elementChanges.close();
    // notifyListeners();
    // _notifiers
  }

  List<ActionBehaviour> dependencyActionsBehaviours(String dependency) {
    return rulesToEvaluate(dependency).map((rule) {
      return ActionBehaviourFactory.createAction(rule);
    }).toList();
  }
}
