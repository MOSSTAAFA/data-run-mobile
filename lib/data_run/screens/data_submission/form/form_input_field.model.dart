// ignore_for_file: always_specify_types

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/form_input_field_intent.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';

typedef IntentCallback = void Function(FormInputFieldIntent intent);

/// This class represents a single field in the form. It encapsulates
/// properties like field type (text, dropdown, etc.), current
/// value, error state, a mandatory flag indicating if the field
/// is required, and other relevant information for formatting and behavior.
@immutable
class FieldInputModel with EquatableMixin {
  const FieldInputModel(
      {required this.key,
      this.options,
      this.isVisible = true,
      this.dependentFieldId,
      this.dependentFieldValues,
      this.value,
      required this.focused,
      this.error,
      required this.editable,
      this.warning,
      required this.mandatory,
      required this.label,
      this.hint,
      this.description,
      this.valueType,
      this.allowFutureDates,
      this.fieldRendering,
      this.keyboardActionType,
      this.isLoadingData = false,
      this.intentCallback});

  /// unique name of the field
  final String key;

  /// if the field is of type select such as
  /// dropDown checkbox values, or radio Options
  final List<String>? options;

  final String? dependentFieldId;
  final List<String>? dependentFieldValues;

  /// the current value of the field
  final dynamic value;

  final bool focused;

  /// the error message if it has and error
  final String? error;

  /// is it editable
  final bool editable;

  /// is it visible
  final bool isVisible;

  /// the warning message if it has and warning
  final String? warning;

  /// is it required
  final bool mandatory;

  /// the field label
  final String label;

  /// the field's hint if it has any
  final String? hint;

  /// the field's description if it has any
  final String? description;

  /// the value type such as:
  /// [SelectOne, Text, Number, Date, Email, SelectMulti, SelectOne ...]
  final ValueType? valueType;
  final bool? allowFutureDates;

  /// if the field value type SelectMulti, SelectOne how to render the choices
  /// is with options and of type VERTICAL, HORIZONTAL...
  final ValueTypeRenderingType? fieldRendering;

  /// keyboard action: { NEXT, DONE, ENTER }
  final KeyboardActionType? keyboardActionType;
  final bool isLoadingData;

  /// intentCallback is a callback defined like: `typedef IntentCallback = void Function(FormInputFieldIntent intent);`
  /// called with every action happening on the field passing `FormInputFieldIntent` which is a Data class
  /// represent different events happening whether text changed, value selected, cleared, saved..
  final IntentCallback? intentCallback;

  String get formattedLabel => mandatory ? '$label *' : label;

  FieldInputModel setCallback({IntentCallback? intentCallback}) {
    return copyWith(intentCallback: intentCallback);
  }

  /// invoke FormInputFieldIntent.onFocus
  void onFieldClick() {
    intentCallback?.call(FormInputFieldIntent.onFocus(key: key, value: value));
  }

  /// invoke FormInputFieldIntent.onNext
  void onNext() {
    intentCallback?.call(FormInputFieldIntent.onNext(key: key, value: value));
  }

  /// invoke FormInputFieldIntent.onTextChange whenever the
  /// text or value of the field is changed
  void onTextChange(String? value) {
    intentCallback?.call(FormInputFieldIntent.onTextChange(
        key: key, value: (value ?? '').isEmpty == true ? null : value));
  }

  /// invoke FormInputFieldIntent.clearValue
  void onClear() {
    onFieldClick();
    intentCallback?.call(FormInputFieldIntent.clearValue(key: key));
  }

  /// invoke FormInputFieldIntent.onSave for with value
  void onSave(String? value) {
    onFieldClick();
    intentCallback?.call(FormInputFieldIntent.onSave(
        key: key, value: value, valueType: valueType));
  }

  /// invoke FormInputFieldIntent.onSave  for Boolean type field
  void onSaveBoolean(bool boolean) {
    onFieldClick();
    final result = value == null || value != boolean.toString()
        ? boolean.toString()
        : null;
    intentCallback?.call(FormInputFieldIntent.onSave(
        key: key, value: result, valueType: valueType));
  }

  /// invoke FormInputFieldIntent.onSave
  void onSaveOption(String option) {
    String? nextValue;
    if (value == option) {
      nextValue = null;
    } else {
      nextValue = option;
    }
    intentCallback?.call(FormInputFieldIntent.onSave(
        key: key, value: nextValue, valueType: valueType));
  }

  void invokeIntent(FormInputFieldIntent intent) {
    intentCallback?.call(intent);
  }

  /// if the field is of type image of file
  bool get hasImage {
    return value != null && File(value ?? '').existsSync();
  }

  bool get isAffirmativeChecked => value == true;

  bool get isNegativeChecked => value == false;

  FieldInputModel setValue(dynamic value) => copyWith(value: value);

  FieldInputModel setIsLoadingData(bool isLoadingData) =>
      copyWith(isLoadingData: isLoadingData);

  FieldInputModel setFocus() => copyWith(focused: true);

  FieldInputModel setError(String? error) => copyWith(error: error);

  FieldInputModel setEditable(bool editable) => copyWith(editable: editable);

  FieldInputModel setIsVisible(bool isVisible) =>
      copyWith(isVisible: isVisible);

  FieldInputModel setDependentFieldId(String? dependentFieldId) =>
      copyWith(dependentFieldId: dependentFieldId);

  FieldInputModel setDependentFieldValue(List<String>? dependentFieldValues) =>
      copyWith(dependentFieldValues: dependentFieldValues);

  FieldInputModel setWarning(String warning) => copyWith(warning: warning);

  FieldInputModel setFieldMandatory() => copyWith(mandatory: true);

  FieldInputModel setKeyBoardActionDone() =>
      copyWith(keyboardActionType: KeyboardActionType.DONE);

  bool isSectionWithFields() => false;

  FieldInputModel copyWith(
          {String? key,
          String? dependentFieldId,
          List<String>? dependentFieldValues,
          List<String>? options,
          bool? isVisible,
          dynamic value,
          int? layoutId,
          bool? focused,
          String? error,
          bool? editable,
          String? warning,
          bool? mandatory,
          String? label,
          String? programStageSection,
          String? hint,
          String? description,
          ValueType? valueType,
          String? optionSet,
          bool? allowFutureDates,
          String? displayName,
          KeyboardActionType? keyboardActionType,
          String? fieldMask,
          bool? isOpen,
          int? totalFields,
          int? completedFields,
          int? errors,
          int? warnings,
          String? rendering,
          String? selectedField,
          bool? isLoadingData,
          int? sectionNumber,
          bool? showBottomShadow,
          bool? lastPositionShouldChangeHeight,
          IntentCallback? intentCallback}) =>
      FieldInputModel(
        key: key ?? this.key,
        options: options ?? this.options,
        isVisible: isVisible ?? this.isVisible,
        dependentFieldId: dependentFieldId ?? this.dependentFieldId,
        dependentFieldValues: dependentFieldValues ?? this.dependentFieldValues,
        value: value ?? this.value,
        focused: focused ?? this.focused,
        error: error ?? this.error,
        editable: editable ?? this.editable,
        warning: warning ?? this.warning,
        mandatory: mandatory ?? this.mandatory,
        label: label ?? this.label,
        hint: hint ?? this.hint,
        description: description ?? this.description,
        valueType: valueType ?? this.valueType,
        allowFutureDates: allowFutureDates ?? this.allowFutureDates,
        keyboardActionType: keyboardActionType ?? this.keyboardActionType,
        isLoadingData: isLoadingData ?? this.isLoadingData,
        intentCallback: intentCallback ?? this.intentCallback,
      );

  @override
  List<Object?> get props => [
        key,
        options,
        isVisible,
        dependentFieldId,
        dependentFieldValues,
        // layoutId,
        value,
        focused,
        error,
        editable,
        warning,
        mandatory,
        label,
        hint,
        description,
        valueType,
        // legend,
        allowFutureDates,
        // callback
        intentCallback,
      ];
}
