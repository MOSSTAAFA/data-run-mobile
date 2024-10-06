import 'dart:async';

import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_parse_extension.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_control_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/members/form_element_members.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';
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

sealed class FormElementInstance<T> {
  final _elementChanges = StreamController<ElementProperties>.broadcast();

  // final _visibilityController = StreamController<bool>.broadcast();
  // final _mandatoryController = StreamController<bool>.broadcast();
  //
  /// A [Stream] that emits the status of element properties every time a property
  /// changes.
  Stream<ElementProperties> get elementChanged => _elementChanges.stream;

  FormElementInstance(
      {required this.form, required this.template, bool hidden = false})
      : _properties =
            ElementProperties(mandatory: template.mandatory, hidden: hidden);

  /// serialized from the field json configuration
  final FieldTemplate template;

  final FormGroup form;

  String get name => template.name;

  //<editor-fold desc="Rules eval and dependencies management">
  final Map<String, FormElementInstance<dynamic>> _listeners = {};
  final Map<String, FormElementInstance<dynamic>> _notifiers = {};

  final List<ActionBehaviour> _actionBehaviours = [];

  FormElementInstance<dynamic>? removeListener(String name) {
    return _listeners.remove(name);
  }

  Map<String, FormElementInstance<dynamic>> get dependents =>
      Map.unmodifiable(_listeners);

  Map<String, FormElementInstance<dynamic>> get dependencies =>
      Map.unmodifiable(_notifiers);
  final List<String> _unresolvedDependencies = [];

  List<ActionBehaviour> get actionBehaviours =>
      List.unmodifiable(_actionBehaviours);

  bool _isEvaluating = false;

  //</editor-fold>

  ValueType get type => template.type;

  FormElementInstance<Object>? _parentSection;

  FormElementInstance<Object>? get parentSection => _parentSection;

  final List<ActionBehaviour> _actionsBehaviours = [];

  List<ActionBehaviour> get actionsBehaviours =>
      List.unmodifiable(_actionsBehaviours);

  set parentSection(FormElementInstance<Object>? parent) {
    if (this is RepeatItemInstance && !(parent is RepeatInstance?)) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parent.runtimeType}');
    }

    _parentSection = parent;
  }

  ElementProperties _properties;

  ElementProperties get properties => _properties;

  bool get hidden => properties.hidden;

  bool get visible => !hidden;

  bool get disabled => elementControl?.disabled ?? true;

  bool get enabled => elementControl?.enabled ?? true;

  String get label =>
      '${getItemLocalString(template.label, defaultString: template.name)}${_properties.mandatory ? '*' : ''}';

  bool get mandatory => properties.mandatory;

  String get elementPath => pathBuilder(name);

  T? get value => elementControl?.value;

  AbstractControl<dynamic>? get elementControl =>
      controlExist ? form.control(elementPath) : null;

  void get focus => elementControl?.focus();

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

  void setActionBehaviour(List<ActionBehaviour> actionBehaviours) {
    _actionBehaviours.clear();
    _actionBehaviours.addAll(actionBehaviours);
  }

  void addListener(FormElementInstance<dynamic> dependent) =>
      _listeners[dependent.name] = dependent;

  void addNotifier(FormElementInstance<dynamic> dependency) =>
      _notifiers[dependency.name] = dependency;

  void updateValue(T? value, {bool updateParent = true, bool emitEvent = true});

  void patchValue(T? value, {bool updateParent = true, bool emitEvent = true});

  @protected
  bool allElementsDisabled() => disabled;

  @protected
  bool allElementsHidden() => hidden;

  @protected
  bool anyElements(
      bool Function(FormElementInstance<dynamic> element) condition);

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
          ? markAsHidden(updateParent: false, emitEvent: false)
          : markAsVisible(updateParent: false, emitEvent: false);
    }
    // elementControl?.reset(
    //     updateParent: updateParent,
    //     emitEvent: emitEvent,
    //     removeFocus: removeFocus,
    //     disabled: disabled);
  }

  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    if (hidden) {
      return;
    }
    _elementChanges.add(_properties.copyWith(hidden: true));
    // elementControl?.markAsDisabled(
    //     updateParent: updateParent, emitEvent: emitEvent);
  }

  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    if (visible) {
      return;
    }
    _elementChanges.add(_properties.copyWith(hidden: false));
    // elementControl?.markAsEnabled(
    //     updateParent: updateParent, emitEvent: emitEvent);
  }

  void toggleMandatory({bool updateParent = true, bool emitEvent = true}) {
    if (mandatory &&
        elementControl?.validators.contains(Validators.required) == true) {
      _properties == _properties.copyWith(mandatory: true);
      elementControl?.setValidators(
          [...?elementControl?.validators, Validators.required],
          updateParent: updateParent, emitEvent: emitEvent);
    } else {
      _properties == _properties.copyWith(mandatory: false);
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

  void dispose() {
    loggerEvaluation.i({
      'element': '$name disposed,',
      'Listeners': '${_listeners.values.map((i) => i.name).toList()}',
      'Notifiers': '${_notifiers.values.map((i) => i.name).toList()}'
    });
    // _notifiers.values
    //     .forEach((notifyingElement) => notifyingElement.removeListener(name));
    // _listeners.values
    //     .forEach((listener) => listener.onDependencyChanged(name, value));
    _elementChanges.close();
    // notifyListeners();
    // _notifiers
  }
}
