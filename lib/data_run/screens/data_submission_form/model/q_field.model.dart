import 'dart:io';

import 'package:d2_remote/modules/datarun/form/shared/field_value_rendering_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/global_functions/global_functions.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.builder.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;

typedef IntentCallback = void Function(FormIntent intent);

class NullValue {
  const NullValue();
}

const NullValue nullValue = NullValue();

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
      this.displayName,
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
  final IList<FormOption>? options;
  final IList<Rule>? fieldRules;
  final bool isFocused;
  final String? error;
  final bool isEditable;
  final bool isVisible;
  final String? value;
  final String? displayName;
  final String? warning;
  final bool isMandatory;
  final String? fieldMask;
  final String label;
  final String? hint;
  final String? description;
  final ValueType? valueType;
  final bool? allowFutureDates;
  final FieldValueRenderingType? fieldRendering;
  final KeyboardActionType? keyboardActionType;
  final bool isLoading;
  final IntentCallback? intentCallback;
  final FocusNode? focusNode;

  String get formattedLabel => isMandatory ? '$label *' : label;

  QFieldModel setValue(String? value) => builder().setValue(value).build();

  QFieldModel setIsLoadingData(bool isLoadingData) =>
      builder().setIsLoading(isLoadingData).build();

  QFieldModel setIsVisible(bool isVisible) =>
      builder().setIsVisible(isVisible).build();

  QFieldModel setFocus() => builder().setIsFocused(true).build();

  QFieldModel setError(String? error) => builder().setError(error).build();

  QFieldModel setEditable(bool editable) =>
      builder().setIsEditable(editable).build();

  // @override
  // FieldUiModel setLegend(LegendValue? legendValue) =>
  //     copyWith(legend: legendValue);

  QFieldModel setWarning(String warning) =>
      builder().setWarning(warning).build();

  QFieldModel setFieldMandatory(bool? isMandatory) =>
      builder().setIsMandatory(isMandatory).build();

  QFieldModel setDisplayName(String? displayName) =>
      builder().setDisplayName(displayName).build();

  QFieldModel setKeyBoardActionDone() =>
      builder().setKeyboardActionType(KeyboardActionType.DONE).build();

  QFieldModel setCallback({IntentCallback? intentCallback}) {
    return builder().setIntentCallback(intentCallback).build();
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
        uid: uid,
        value: (value ?? '').isEmpty == true ? null : value,
        valueType: valueType,
        fieldMask: fieldMask));
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
  void onSaveBoolean(bool? boolean) {
    // // onFieldClick();
    final result = _valueIsEmpty() || value != boolean.toString()
        ? boolean.toString()
        : null;
    intentCallback?.call(
        FormIntent.onSave(uid: uid, value: result, valueType: valueType));
  }

  FormOption? getOption() {
    return options?.where((option) => option.name == value).firstOrNull;
  }
  /// invoke FormInputFieldIntent.onSave
  void onSaveOption(FormOption? option) {
    String? nextValue;
    if (value == option?.name) {
      nextValue = null;
    } else {
      nextValue = option?.name;
    }
    intentCallback?.call(
        FormIntent.onSave(uid: uid, value: nextValue, valueType: valueType));
  }

  /// invoke FormInputFieldIntent.onSave
  void onSaveDate(DateTime? date) {
    String? nextValue;
    if (date != null) {
      nextValue = sdk.DateUtils.databaseDateFormat().format(date);
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

  // QFieldModel copyWith(
  //         {String? key,
  //         List<Rule>? fieldRules,
  //         List<String>? options,
  //         bool? isVisible,
  //         dynamic value,
  //         int? layoutId,
  //         bool? focused,
  //         String? error,
  //         bool? isEditable,
  //         String? warning,
  //         bool? isMandatory,
  //         String? label,
  //         String? programStageSection,
  //         String? hint,
  //         String? description,
  //         ValueType? valueType,
  //         String? optionSet,
  //         bool? allowFutureDates,
  //         String? displayName,
  //         KeyboardActionType? keyboardActionType,
  //         String? fieldMask,
  //         bool? isOpen,
  //         int? totalFields,
  //         int? completedFields,
  //         int? errors,
  //         int? warnings,
  //         String? rendering,
  //         String? selectedField,
  //         bool? isLoading,
  //         int? sectionNumber,
  //         bool? showBottomShadow,
  //         bool? lastPositionShouldChangeHeight,
  //         IntentCallback? intentCallback,
  //         FocusNode? focusNode}) =>
  //     QFieldModel(
  //       uid: key ?? this.uid,
  //       options: IList.orNull(options) ?? this.options,
  //       isVisible: isVisible ?? this.isVisible,
  //       fieldRules: IList.orNull(fieldRules) ?? this.fieldRules,
  //       value: value ?? this.value,
  //       displayName: displayName ?? this.displayName,
  //       isFocused: focused ?? isFocused,
  //       error: error ?? this.error,
  //       isEditable: isEditable ?? this.isEditable,
  //       warning: warning ?? this.warning,
  //       isMandatory: isMandatory ?? this.isMandatory,
  //       label: label ?? this.label,
  //       fieldMask: fieldMask ?? this.fieldMask,
  //       hint: hint ?? this.hint,
  //       description: description ?? this.description,
  //       valueType: valueType ?? this.valueType,
  //       allowFutureDates: allowFutureDates ?? this.allowFutureDates,
  //       keyboardActionType: keyboardActionType ?? this.keyboardActionType,
  //       isLoading: isLoading ?? this.isLoading,
  //       intentCallback: intentCallback ?? this.intentCallback,
  //       focusNode: focusNode ?? this.focusNode,
  //     );

  QFieldModelBuilder builder() => QFieldModelBuilder(this);

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
      'displayName:  $displayName',
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
        displayName,
        // isMandatory,
        // allowFutureDates,
        // isLoading,
        // intentCallback
      ];
}
