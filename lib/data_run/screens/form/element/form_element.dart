import 'package:d2_remote/modules/datarun/form/shared/field_template.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/action.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/choice_filter.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter/material.dart';
import 'package:datarun/commons/logging/logging.dart';
import 'package:datarun/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:datarun/data_run/screens/form/element/extension/rule.extension.dart';
import 'package:datarun/data_run/screens/form/element/members/form_element_state.dart';
import 'package:datarun/core/utils/get_item_local_string.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:rxdart/rxdart.dart';

part 'extension/element_dependency.extension.dart';

part 'field_instance.dart';

part 'repeat_instance.dart';

part 'repeat_item_instance.dart';

part 'section_element.dart';

part 'section_instance.dart';

typedef ElementControl<T> = AbstractControl<T>? Function(String path);

sealed class FormElementInstance<T> {
  FormElementInstance(
      {required this.form,
      required this.template,
      required FormElementState elementState})
      : _elementState = elementState;

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

  String get name => template.name!;

  String get label =>
      '${getItemLocalString(template.label, defaultString: name)}${mandatory ? ' *' : ''}';

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

  bool get mandatory => elementState.mandatory && visible;

  String get elementPath => pathRecursive;

  T? get value => reduceValue();

  T? reduceValue();

  AbstractControl<dynamic>? get elementControl =>
      controlExist ? form.control(elementPath) : null;

  String get pathRecursive {
    return parentSection != null && parentSection!.name.isNotEmpty
        ? '${parentSection!.pathRecursive}.${name}'
        : name;
  }

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

  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    logDebug(info: '${name}, mark as Hidden');
    updateStatus(elementState.copyWith(hidden: true, errors: {}));
    elementControl!.reset(disabled: true);
    elementControl!.updateValueAndValidity(
        updateParent: updateParent, emitEvent: emitEvent);
    updateValueAndValidity(updateParent: true, emitEvent: emitEvent);
    _updateAncestors(updateParent);
    // elementControl!.markAsDisabled();
  }

  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    logDebug(info: '${name}, mark as visible');
    updateStatus(elementState.copyWith(hidden: false));
    elementControl!.markAsEnabled();
    updateValueAndValidity(updateParent: true, emitEvent: emitEvent);
    _updateAncestors(updateParent);
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
    if (visible) {
      elementControl?.setErrors(errors);
    }
  }

  void removeError(String key) {
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
            '$name, dependencyChanged ${changedDependency != null ?': $changedDependency' : ''} Changed to: ${evalContext[changedDependency]}, _isEvaluating: $_isEvaluating, Evaluating State...');
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

  TFormElement?
      getFirstParentOfType<TFormElement extends FormElementInstance<Object>>() {
    var currentParent = parentSection;
    while (currentParent != null) {
      if (currentParent is TFormElement) {
        return currentParent;
      }
      currentParent = currentParent.parentSection;
    }
    return null;
  }

  void _updateAncestors(bool updateParent) {
    if (updateParent) {
      _parentSection?.updateValueAndValidity(updateParent: updateParent);
    }
  }

  FormElementState _calculateStatus() {
    if (allElementsHidden()) {
      elementControl?.markAsDisabled();
      return _elementState.copyWith(hidden: true, errors: {});
    } else if (elementControl?.hasErrors == true) {
      return _elementState.copyWith(errors: elementControl!.errors);
    }

    return _elementState.copyWith(hidden: false, errors: {});
  }

  void updateValueAndValidity({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (visible) {
      _elementState = _calculateStatus();
    }

    if (emitEvent) {
      updateStatus(_elementState);
    }

    _updateAncestors(updateParent);
  }

  void dispose() {
    // elementControl?.dispose();
    logDebug(info: 'element: $name, disposeMethod');
    if (_dependencies.isNotEmpty)
      // propertiesChangedSubject?.close();
      _dependencies.forEach((FormElementInstance<dynamic> d) {
        logDebug(info: '$name, unsubscribing from: ${d.name}');
        d._dependents.remove(this);
      });
    _dependencies.clear();
  }
}
