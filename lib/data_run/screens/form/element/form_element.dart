import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/action.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/choice_filter.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_parse_extension.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:mass_pro/data_run/screens/form/element/extension/rule.extension.dart';
import 'package:mass_pro/data_run/screens/form/element/members/form_element_state.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:rxdart/rxdart.dart';

part 'extension/element.extension.dart';

part 'extension/element_dependency.extension.dart';

part 'field_instance.dart';

part 'repeat_instance.dart';

part 'repeat_item_instance.dart';

part 'section_element.dart';

part 'section_instance.dart';

sealed class FormElementInstance<T> /*with EquatableMixin*/ {
  FormElementInstance(
      {required this.form,
      required this.template,
      required FormElementState elementState})
      : _elementState = elementState;

  // @override
  // List<Object> get props => [_elementState, elementPath, template];

  /// serialized from the field json configuration
  final FieldTemplate template;

  final FormGroup form;

  bool _isEvaluating = false;

  Iterable<RuleAction> get elementRuleActions => template.ruleActions();

  List<RuleAction> get inEffectRuleActions => elementRuleActions
      .where((ruleAction) => ruleAction.evaluate(evalContext))
      .toList();

  final Set<FormElementInstance<dynamic>> _dependents = Set();
  final Set<FormElementInstance<dynamic>> _dependencies = Set();

  Set<FormElementInstance<dynamic>> get dependents =>
      Set.unmodifiable(_dependents);

  Set<FormElementInstance<dynamic>> get dependencies =>
      Set.unmodifiable(_dependencies);

  String get name => template.name;

  String get label => getItemLocalString(template.label, defaultString: name);

  ValueType get type => template.type;

  FormElementInstance<Object>? _parentSection;

  FormElementInstance<Object>? get parentSection => _parentSection;

  set parentSection(FormElementInstance<Object>? parent) {
    _parentSection = parent;
  }

  FormElementState _elementState;

  FormElementState get elementState => _elementState;

  bool get hidden => elementState.hidden;

  bool get visible => !hidden;

  bool get mandatory => elementState.mandatory;

  String get elementPath => pathRecursive;

  T? get value => reduceValue();

  T? reduceValue();

  AbstractControl<dynamic>? get elementControl =>
      controlExist ? form.control(elementPath) : null;

  void get focus => elementControl?.focus();

  String get pathRecursive {
    return parentSection != null && parentSection!.name.isNotEmpty
        ? '${parentSection!.pathRecursive}.${name}'
        : name;
  }

  // String pathBuilder(String? pathItem) =>
  //     [parentSection?.pathRecursive, pathItem].whereType<String>().join('.');

  // String pathBuilder(String? pathItem) {
  //   final parentPath = (parentSection?.elementPath).isNullOrEmpty
  //       ? null
  //       : parentSection?.elementPath;
  //   return [parentPath, pathItem].whereType<String>().join('.');
  // }

  bool get controlExist {
    try {
      form.control(elementPath);
      return true;
    } catch (e) {
      return false;
    }
  }

  void updateValue(T? value, {bool updateParent = true, bool emitEvent = true});

  @protected
  bool allElementsHidden() => hidden;

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

  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    logDebug(info: '${name}, mark as Hidden');
    updateStatus(elementState.copyWith(hidden: true));
    elementControl!.reset(disabled: true);
  }

  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    logDebug(info: '${name}, mark as visible');
    updateStatus(elementState.copyWith(hidden: false));
    elementControl!.markAsEnabled();
  }

  void markAsMandatory({bool updateParent = true, bool emitEvent = true}) {
    logDebug(info: '${name}, markAsMandatory');
    updateStatus(elementState.copyWith(mandatory: true));

    final elementValidators = [
      ...elementControl!.validators,
      Validators.required
    ];
    elementControl!.setValidators(elementValidators, autoValidate: true);
  }

  void markAsUnMandatory({bool updateParent = true, bool emitEvent = true}) {
    updateStatus(elementState.copyWith(mandatory: false));
    final elementValidators = [
      ...elementControl!.validators,
    ]..remove(Validators.required);

    elementControl!.setValidators(elementValidators, autoValidate: true);
  }

  void setErrors(Map<String, dynamic> errors) {
    updateStatus(elementState.copyWith(errors: errors));
    elementControl?.setErrors(errors);
  }

  void removeError(String key) {
    updateStatus(elementState.copyWith(
        errors: Map.from(elementState.errors)
          ..removeWhere((errorKey, dynamic value) => errorKey == key)));
    elementControl?.removeError(key);
  }

  void reset({T? value});

  void toggleVisibility() {
    if (visible) {
      markAsHidden();
    } else {
      markAsVisible();
    }
  }

  Stream<FormElementState> get propertiesChanged =>
      (propertiesChangedSubject ??=
              BehaviorSubject<FormElementState>.seeded(elementState))
          as Stream<FormElementState>;

  @protected
  BehaviorSubject<FormElementState?>? propertiesChangedSubject;

  @mustCallSuper
  void evaluate([String? changedDependency]) {
    logDebug(
        info:
            '$name, dependencyChanged ${changedDependency != null ? ': $changedDependency' : ''} Changed to: ${evalContext[changedDependency]}, _isEvaluating: $_isEvaluating, Evaluating State...');
    if (_isEvaluating) {
      return;
    }

    _isEvaluating = true;

    try {
      elementRuleActions.forEach((ruleAction) {
        logDebug(
            info:
                '$name\'s Evaluating: ${ruleAction.expression}, action: ${ruleAction.action}');
        ruleAction.evaluate(evalContext)
            ? ruleAction.apply(this)
            : ruleAction.reset(this);
      });
    } catch (e) {
      logError(info: 'Error Evaluating: ');
    } finally {
      _isEvaluating = false;
    }
  }

  void markAsDisabled({bool updateParent = true, bool emitEvent = true}) {
    elementControl?.markAsDisabled(
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void markAsEnabled({bool updateParent = true, bool emitEvent = true}) {
    elementControl?.markAsEnabled(
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void dispose() {
    // elementControl?.dispose();
    logDebug(info: 'element: $name, disposeMethod');
    propertiesChangedSubject?.close();
    _dependencies.forEach((FormElementInstance<dynamic> d) {
      logDebug(info: '$name, unsubscribing from: ${d.name}');
      d._dependents.remove(this);
    });
    _dependencies.clear();
  }
}
