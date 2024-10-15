import 'package:d2_remote/modules/datarun/form/shared/form_element_template.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_control_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_factory.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'form_field_element.dart';

part 'form_collection_element.dart';

part 'form_section_element.dart';

part 'form_repeat_element.dart';

part 'form_repeat_item_element.dart';

sealed class FormElementInstance<T> {
  FormElementInstance(
      {required this.name,
      T? value,
      bool hidden = false,
      bool mandatory = false})
      : _value = value,
        _hidden = hidden,
        _mandatory = mandatory;

  FormElementInstance<Object>? _parentSection;

  T? _value;
  bool _hidden;
  bool _mandatory;
  final String name;

  set value(T? newValue) {
    if (_value != newValue) {
      _value = newValue;
    }
  }

  T? get value => _value;

  FormElementInstance<Object>? get parentSection => _parentSection;

  bool get mandatory => _mandatory;

  bool get hidden => _hidden;

  bool get visible => !hidden;

  String get elementPath => pathBuilder(name);

  String get pathRecursive {
    return parentSection != null
        ? '${parentSection!.pathRecursive}.${name}'
        : name;
  }

  void _updateValue() {
    _value = reduceValue();
  }

  void _updateAncestors(bool updateParent) {
    if (updateParent) {
      _parentSection?.updateValueAndValidity(updateParent: updateParent);
    }
  }

  void updateValueAndValidity(
      {bool updateParent = true, bool emitEvent = true}) {
    _setInitialStatus();
    _updateValue();
    _updateAncestors(updateParent);
  }

  @protected
  bool allElementsHidden() => _hidden;

  void _setInitialStatus() {
    _hidden = allElementsHidden();
  }

  T? reduceValue();

  void updateValue(T? value, {bool updateParent = true, bool emitEvent = true});

  void patchValue(T? value, {bool updateParent = true, bool emitEvent = true});

  void reset({
    T? value,
    bool? disabled,
    bool? hidden,
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    updateValue(value, updateParent: updateParent, emitEvent: emitEvent);
    if (hidden != null) {
      hidden
          ? markAsHidden(updateParent: true)
          : markAsVisible(updateParent: true);
    }
  }

  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    if (_hidden) {
      return;
    }
    _hidden = true;
    _updateAncestors(updateParent);
  }

  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    if (visible) {
      return;
    }
    _hidden = false;
    _updateAncestors(updateParent);
  }

  set parentSection(FormElementInstance<Object>? parent) {
    if (this is FormRepeatItemElement && !(parent is FormRepeatElement?)) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parent.runtimeType}');
    }

    _parentSection = parent;
  }

  String pathBuilder(String? pathItem) => [
        parentSection != null ? parentSection!.pathRecursive : null,
        pathItem
      ].whereType<String>().join('.');

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

  static AbstractControl<T> formElements<T>(FormElementInstance<T>? element) {
    throw UnimplementedError();
  }

  void dispose() {
    // _statusChanges.close();
    // _valueChanges.close();
    // _asyncValidationSubscription?.cancel();
  }
}
