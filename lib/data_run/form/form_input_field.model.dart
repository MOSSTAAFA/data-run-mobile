import 'dart:io';

import 'package:d2_remote/modules/datarun_shared/utilities/field_rule.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/form/form_input_field_intent.dart';
import 'package:mass_pro/data_run/form/syncable_form_repository.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_input_field.model.g.dart';

@riverpod
class FieldInputModelNotifier extends _$FieldInputModelNotifier {
  @override
  Future<FormFieldModel> build(int index) async {
    final FormFieldModel field = await ref.watch(
        formInputFieldsListNotifierProvider.selectAsync((list) => list[index]));

    // // if it depends on another field register this as listener
    // if (field.relevantFields != null && field.relevantFields!.isNotEmpty) {
    //   final allRelevantsExists = await ref.watch(
    //       formInputFieldsListNotifierProvider
    //           .selectAsync((list) {
    //             final keys =
    //         field.relevantFields.firstWhere(test);
    //       }));
    // }
    //   final decidingFieldExist = ref.watch(formInputFieldsListNotifierProvider
    //       .selectAsync((list) => list.containsAny(index, map)));
    //   final dependsOnField = ref.watch(formInputFieldsListNotifierProvider
    //       .selectAsync((list) => list.getAndMap(index, map)));
    // }
    return field;
  }
}

/// fetchFormItems
@riverpod
class FormInputFieldsListNotifier extends _$FormInputFieldsListNotifier {
  @override
  Future<IList<FormFieldModel>> build() {
    final repository = ref.watch(syncableFormRepositoryProvider);
    ref.onDispose(() => repository.disposeControllers());
    return repository.fetchFormItems();
  }
}

typedef IntentCallback = void Function(FormInputFieldIntent intent);

/// This class represents a single field in the form. It encapsulates
/// properties like field type (text, dropdown, etc.), current
/// value, error state, a mandatory flag indicating if the field
/// is required, and other relevant information for formatting and behavior.
@immutable
class FormFieldModel with EquatableMixin {
  const FormFieldModel({
    required this.key,
    this.options,
    this.isVisible = true,
    this.relevantFields,
    required this.controller,
    required this.isFocused,
    this.error,
    required this.isEditable,
    this.warning,
    required this.isMandatory,
    required this.label,
    this.hint,
    this.description,
    this.valueType,
    this.allowFutureDates,
    this.fieldRendering,
    this.keyboardActionType,
    this.isLoading = false,
    this.intentCallback,
  });

  final String key;
  final IList<String>? options;
  final IList<FieldRule>? relevantFields;
  final TextEditingController controller;
  final bool isFocused;
  final String? error;
  final bool isEditable;
  final bool isVisible;
  final String? warning;
  final bool isMandatory;
  final String label;
  final String? hint;
  final String? description;
  final ValueType? valueType;
  final bool? allowFutureDates;
  final ValueTypeRenderingType? fieldRendering;
  final KeyboardActionType? keyboardActionType;
  final bool isLoading;
  final IntentCallback? intentCallback;

  String get formattedLabel => isMandatory ? '$label *' : label;

  FormFieldModel setCallback({IntentCallback? intentCallback}) {
    return copyWith(intentCallback: intentCallback);
  }

  /// invoke FormInputFieldIntent.onFocus
  void onFieldClick() {
    intentCallback
        ?.call(FormInputFieldIntent.onFocus(key: key, value: controller.text));
  }

  /// invoke FormInputFieldIntent.onNext
  void onNext() {
    intentCallback
        ?.call(FormInputFieldIntent.onNext(key: key, value: controller.text));
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
    final result =
        controller.text.isEmpty || controller.text != boolean.toString()
            ? boolean.toString()
            : null;
    intentCallback?.call(FormInputFieldIntent.onSave(
        key: key, value: result, valueType: valueType));
  }

  /// invoke FormInputFieldIntent.onSave
  void onSaveOption(String option) {
    String? nextValue;
    if (controller.text == option) {
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
    return controller.text.isNotEmpty &&
        File(controller.text ?? '').existsSync();
  }

  FormFieldModel setValue(String value) {
    controller.text = value;
    return this;
  }

  FormFieldModel setIsLoadingData(bool isLoading) =>
      copyWith(isLoading: isLoading);

  FormFieldModel setFocus() => copyWith(focused: true);

  FormFieldModel setError(String? error) => copyWith(error: error);

  FormFieldModel setEditable(bool editable) => copyWith(isEditable: editable);

  FormFieldModel setIsVisible(bool isVisible) => copyWith(isVisible: isVisible);

  FormFieldModel setWarning(String warning) => copyWith(warning: warning);

  FormFieldModel setFieldMandatory() => copyWith(isMandatory: true);

  FormFieldModel setKeyBoardActionDone() =>
      copyWith(keyboardActionType: KeyboardActionType.DONE);

  FormFieldModel applyRelevantEffects(IList<FieldRule>? newValue) {
    // if (newValue == null || newValue.isEmpty) {
    return copyWith(isVisible: false, isEditable: false, isMandatory: false);
    // }

    // FormFieldModel newFieldModelConfig = this;
  }

  bool isSectionWithFields() => false;

  FormFieldModel copyWith(
          {String? key,
          IList<FieldRule>? relevantFields,
          IList<String>? options,
          bool? isVisible,
          // dynamic value,
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
          IntentCallback? intentCallback}) =>
      FormFieldModel(
        key: key ?? this.key,
        options: options ?? this.options,
        isVisible: isVisible ?? this.isVisible,
        relevantFields: relevantFields ?? this.relevantFields,
        // value: value ?? this.value,
        isFocused: focused ?? this.isFocused,
        controller: controller,
        error: error ?? this.error,
        isEditable: isEditable ?? this.isEditable,
        warning: warning ?? this.warning,
        isMandatory: isMandatory ?? this.isMandatory,
        label: label ?? this.label,
        hint: hint ?? this.hint,
        description: description ?? this.description,
        valueType: valueType ?? this.valueType,
        allowFutureDates: allowFutureDates ?? this.allowFutureDates,
        keyboardActionType: keyboardActionType ?? this.keyboardActionType,
        isLoading: isLoading ?? this.isLoading,
        intentCallback: intentCallback ?? this.intentCallback,
      );

  @override
  List<Object?> get props => [
        key,
        options,
        isVisible,
        relevantFields,
        // layoutId,
        // value,
        isFocused,
        error,
        isEditable,
        warning,
        isMandatory,
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
