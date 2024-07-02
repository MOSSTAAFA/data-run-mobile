import 'dart:io';

import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/global_functions/global_functions.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';

typedef IntentCallback = void Function(FormIntent intent);

/// This class represents a single field in the form. It encapsulates
/// properties like field type (text, dropdown, etc.), current
/// value, error state, a mandatory flag indicating if the field
/// is required, and other relevant information for formatting and behavior.
@immutable
class QFieldModel with EquatableMixin {
  const QFieldModel(
      {required this.uid,
      this.options,
      this.isVisible = true,
      this.fieldRules,
      this.value,
      required this.isFocused,
      this.error,
      required this.isEditable,
      this.warning,
      required this.isMandatory,
      required this.label,
      this.fieldMask,
      this.hint,
      this.description,
      this.valueType,
      this.allowFutureDates,
      this.fieldRendering,
      this.keyboardActionType,
      this.isLoading = false,
      this.intentCallback,
      this.focusNode});

  final String uid;
  final IList<String>? options;
  final IList<Rule>? fieldRules;
  final bool isFocused;
  final String? error;
  final bool isEditable;
  final bool isVisible;
  final String? value;
  final String? warning;
  final bool isMandatory;
  final String? fieldMask;
  final String label;
  final String? hint;
  final String? description;
  final ValueType? valueType;
  final bool? allowFutureDates;
  final ValueTypeRenderingType? fieldRendering;
  final KeyboardActionType? keyboardActionType;
  final bool isLoading;
  final IntentCallback? intentCallback;
  final FocusNode? focusNode;

  String get formattedLabel => isMandatory ? '$label *' : label;

  QFieldModel setValue(String? value) => copyWith(value: value);

  QFieldModel setIsLoadingData(bool isLoadingData) =>
      copyWith(isLoading: isLoadingData);

  QFieldModel setFocus() => copyWith(focused: true);

  QFieldModel setError(String? error) => copyWith(error: error);

  QFieldModel setEditable(bool editable) => copyWith(isEditable: editable);

  // @override
  // FieldUiModel setLegend(LegendValue? legendValue) =>
  //     copyWith(legend: legendValue);

  QFieldModel setWarning(String warning) => copyWith(warning: warning);

  QFieldModel setFieldMandatory(bool? isMandatory) =>
      copyWith(isMandatory: isMandatory);

  QFieldModel setDisplayName(String? displayName) =>
      copyWith(displayName: displayName);

  QFieldModel setKeyBoardActionDone() =>
      copyWith(keyboardActionType: KeyboardActionType.DONE);

  QFieldModel setCallback({IntentCallback? intentCallback}) {
    return copyWith(intentCallback: intentCallback);
  }

  bool _valueIsEmpty() => (value ?? '').isEmpty;

  /// invoke FormInputFieldIntent.onFocus
  void onFieldClick() {
    intentCallback?.call(FormIntent.onFocus(uid, value));
  }

  /// invoke FormInputFieldIntent.onNext
  void onNext() {
    intentCallback?.call(FormIntent.onNext(uid: uid, value: value));
  }

  /// invoke FormInputFieldIntent.onTextChange whenever the
  /// text or value of the field is changed
  void onTextChange(String? value) {
    intentCallback?.call(FormIntent.onTextChange(
        uid, (value ?? '').isEmpty == true ? null : value));
  }

  /// invoke FormInputFieldIntent.clearValue
  void onClear() {
    onFieldClick();
    intentCallback?.call(FormIntent.clearValue(uid));
  }

  /// invoke FormInputFieldIntent.onSave for with value
  void onSave(String? value) {
    onFieldClick();
    intentCallback
        ?.call(FormIntent.onSave(uid: uid, value: value, valueType: valueType));
  }

  /// invoke FormInputFieldIntent.onSave  for Boolean type field
  void onSaveBoolean(bool boolean) {
    onFieldClick();
    final result =
        _valueIsEmpty() || value != boolean ? boolean.toString() : null;
    intentCallback?.call(
        FormIntent.onSave(uid: uid, value: result, valueType: valueType));
  }

  /// invoke FormInputFieldIntent.onSave
  void onSaveOption(String option) {
    String? nextValue;
    if (value == option) {
      nextValue = null;
    } else {
      nextValue = option;
    }
    intentCallback?.call(
        FormIntent.onSave(uid: uid, value: nextValue, valueType: valueType));
  }

  void invokeIntent(FormIntent intent) {
    intentCallback?.call(intent);
  }

  /// if the field is of type image of file
  bool get hasImage {
    return !_valueIsEmpty() && File(value ?? '').existsSync();
  }

  bool isSectionWithFields() => false;

  QFieldModel copyWith(
          {String? key,
          bool? clearValue,
          List<Rule>? fieldRules,
          List<String>? options,
          bool? isVisible,
          dynamic value,
          int? layoutId,
          bool? focused,
          String? error,
          bool? isEditable,
          String? warning,
          bool? isMandatory,
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
          bool? isLoading,
          int? sectionNumber,
          bool? showBottomShadow,
          bool? lastPositionShouldChangeHeight,
          IntentCallback? intentCallback,
          FocusNode? focusNode}) =>
      QFieldModel(
        uid: key ?? this.uid,
        options: IList.orNull(options) ?? this.options,
        isVisible: isVisible ?? this.isVisible,
        fieldRules: IList.orNull(fieldRules) ?? this.fieldRules,
        value: value ?? (clearValue == true ? null : this.value),
        isFocused: focused ?? isFocused,
        error: error ?? this.error,
        isEditable: isEditable ?? this.isEditable,
        warning: warning ?? this.warning,
        isMandatory: isMandatory ?? this.isMandatory,
        label: label ?? this.label,
        fieldMask: fieldMask ?? this.fieldMask,
        hint: hint ?? this.hint,
        description: description ?? this.description,
        valueType: valueType ?? this.valueType,
        allowFutureDates: allowFutureDates ?? this.allowFutureDates,
        keyboardActionType: keyboardActionType ?? this.keyboardActionType,
        isLoading: isLoading ?? this.isLoading,
        intentCallback: intentCallback ?? this.intentCallback,
        focusNode: focusNode ?? this.focusNode,
      );

  @override
  String toString() {
    return mapPropsToString(runtimeType, [
      'uid: $uid',
      'value: $value',
      'isVisible: $isVisible',
      'isLoading:  $isLoading',
      'isFocused:  $isFocused',
      'dataIntegrityResult: $isMandatory',
      'error:  $error',
      'warning:  $warning',
      'options:  $options',
    ]);
  }

  @override
  List<Object?> get props => [
        uid,
        options,
        isVisible,
        value,
        // isFocused,
        error,
        // fieldMask,
        isEditable,
        warning,
        // isMandatory,
        // allowFutureDates,
        // isLoading,
        // intentCallback
      ];
}
