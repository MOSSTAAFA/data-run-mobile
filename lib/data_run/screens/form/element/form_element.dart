import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule_parse_extension.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_control_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/members/form_element_members.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'field_instance.dart';

part 'section_element.dart';

part 'section_instance.dart';

part 'repeat_instance.dart';

part 'repeat_item_instance.dart';

part 'extension/element.extension.dart';

part 'extension/element_dependency.extension.dart';

part 'extension/element_rule.extension.dart';

sealed class FormElementInstance<T> {
  FormElementInstance(
      {required this.form,
      required this.template,
      ElementProperties? properties})
      : _properties = properties ??
            ElementProperties(
                mandatory: template.mandatory,
                order: template.order,
                label: getItemLocalString(template.label,
                    defaultString: template.name));

  final FieldTemplate template;

  final FormGroup form;

  String get name => template.name;

  //<editor-fold desc="Rules eval and dependencies management">
  final List<FormElementInstance<dynamic>> _dependents = [];
  final List<FormElementInstance<dynamic>> _dependencies = [];

  // final List<String> _requiredDependencies = [];
  final List<String> _unresolvedDependencies = [];

  bool _isEvaluating = false;

  //</editor-fold>

  ValueType get type => template.type;

  FormElementInstance<Object>? _parentSection;

  FormElementInstance<Object>? get parentSection => _parentSection;

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

  bool get mandatory => properties.mandatory;

  String get elementPath => pathBuilder(name);

  T? get value => elementControl?.value;

  void updateValue(T? value, {bool updateParent = true, bool emitEvent = true});

  void patchValue(T? value, {bool updateParent = true, bool emitEvent = true});

  AbstractControl<dynamic>? get elementControl =>
      controlExist ? form.control(elementPath) : null;

  void get focus => elementControl?.focus();

  String get pathRecursive {
    return parentSection != null
        ? '${parentSection!.pathRecursive}.${name}'
        : name;
  }

  String pathBuilder(String? pathItem) => [
        parentSection?.pathRecursive,
        pathItem
      ].whereType<String>().join('.');

  bool get controlExist {
    try {
      form.control(pathRecursive);
      return true;
    } catch (e) {
      return false;
    }
  }

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

  void dispose() {
    elementControl?.dispose();
  }

// void _updateValue() {
//   _value = reduceValue();
// }

// void _updateAncestors(bool updateParent) {
//   if (updateParent) {
//     parentSection?.updateValueAndValidity(updateParent: updateParent);
//   }
// }

// void updateValueAndValidity(
//     {bool updateParent = true, bool emitEvent = true}) {
//   notifyDependents();
//   _setInitialStatus();
//   _updateValue();
//
//   _updateAncestors(updateParent);
// }

// void _setInitialStatus() {
//   _properties = _properties.copyWith(
//       disabled: allElementsDisabled(), hidden: allElementsHidden());
// }

// void reset({
//   T? value,
//   bool? disabled,
//   bool? hidden,
//   bool updateParent = true,
//   bool emitEvent = true,
// }) {
//   updateValue(value, updateParent: updateParent, emitEvent: emitEvent);
//   if (disabled != null) {
//     disabled
//         ? markAsDisabled(updateParent: true)
//         : markAsEnabled(updateParent: true);
//   }
//   if (hidden != null) {
//     hidden
//         ? markAsHidden(updateParent: true)
//         : markAsVisible(updateParent: true);
//   }
// }

  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    if (hidden) {
      return;
    }
    _properties = _properties.copyWith(hidden: true);
    if(!_properties.disabled) {
      elementControl?.markAsDisabled();
    }
    notifyDependents();
    // _updateAncestors(updateParent);
  }

  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    if (visible) {
      return;
    }
    _properties = _properties.copyWith(hidden: false);
    if(!_properties.disabled) {
      elementControl?.markAsEnabled();
    }
    notifyDependents();
    // _updateAncestors(updateParent);
  }
}
