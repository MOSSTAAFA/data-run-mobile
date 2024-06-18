// ignore_for_file: always_specify_types

import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/form_input_field_intent.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';

typedef IntentCallback = void Function(FormInputFieldIntent intent);

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
      this.programStageSection,
      this.hint,
      this.description,
      this.valueType,
      this.allowFutureDates,
      this.fieldRendering,
      this.keyboardActionType,
      this.isLoadingData = false,
      this.intentCallback});

  final String key;
  final List<String>? options;
  final String? dependentFieldId;
  final List<String>? dependentFieldValues;

  final dynamic value;
  final bool focused;
  final String? error;
  final bool editable;
  final bool isVisible;

  final String? warning;
  final bool mandatory;
  final String label;
  final String? programStageSection;
  final String? hint;
  final String? description;

  final ValueType? valueType;
  final bool? allowFutureDates;

  /// NMC added provided here instead to providing it
  /// to the FieldViewModelFactoryImpl
  /// from ProgramStageDataElement of the item
  /// DEFAULT, DROPDOWN, VERTICAL_RADIOBUTTONS, HORIZONTAL_RADIOBUTTONS,
  final ValueTypeRenderingType? fieldRendering;

  final KeyboardActionType? keyboardActionType;
  final bool isLoadingData;

  final IntentCallback? intentCallback;

  String get formattedLabel => mandatory ? '$label *' : label;

  FieldInputModel setCallback({IntentCallback? intentCallback}) {
    return copyWith(intentCallback: intentCallback);
  }

  void onItemClick() {
    intentCallback?.call(FormInputFieldIntent.onFocus(key: key, value: value));
  }

  void onNext() {
    intentCallback?.call(FormInputFieldIntent.onNext(key: key, value: value));
  }

  void onTextChange(String? value) {
    intentCallback?.call(FormInputFieldIntent.onTextChange(
        key: key, value: (value ?? '').isEmpty == true ? null : value));
  }

  void onClear() {
    onItemClick();
    intentCallback?.call(FormInputFieldIntent.clearValue(key: key));
  }

  void onSave(String? value) {
    onItemClick();
    intentCallback?.call(FormInputFieldIntent.onSave(
        key: key, value: value, valueType: valueType));
  }

  void onSaveBoolean(bool boolean) {
    onItemClick();
    final result = value == null || value != boolean.toString()
        ? boolean.toString()
        : null;
    intentCallback?.call(FormInputFieldIntent.onSave(
        key: key, value: result, valueType: valueType));
  }

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

  FieldInputModel setDisplayName(String? displayName) =>
      copyWith(displayName: displayName);

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
        programStageSection: programStageSection ?? this.programStageSection,
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
        programStageSection,
        hint,
        description,
        valueType,
        // legend,
        allowFutureDates,
        // callback
        intentCallback,
      ];
}
