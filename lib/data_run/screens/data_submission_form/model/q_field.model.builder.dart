import 'package:d2_remote/modules/datarun/form/shared/field_value_rendering_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

class QFieldModelBuilder {
  QFieldModelBuilder(QFieldModel model) {
    uid = model.uid;
    options = model.options;
    fieldRules = model.fieldRules;
    isFocused = model.isFocused;
    error = model.error;
    isEditable = model.isEditable;
    isVisible = model.isVisible;
    value = model.value;
    displayName = model.displayName;
    warning = model.warning;
    isMandatory = model.isMandatory;
    fieldMask = model.fieldMask;
    label = model.label;
    hint = model.hint;
    description = model.description;
    valueType = model.valueType;
    allowFutureDates = model.allowFutureDates;
    fieldRendering = model.fieldRendering;
    keyboardActionType = model.keyboardActionType;
    isLoading = model.isLoading;
    intentCallback = model.intentCallback;
    focusNode = model.focusNode;
  }

  String? uid;
  IList<FormOption>? options;
  IList<Rule>? fieldRules;
  bool? isFocused;
  String? error;
  bool? isEditable;
  bool? isVisible;
  String? value;
  String? displayName;
  String? warning;
  bool? isMandatory;
  String? fieldMask;
  String? label;
  String? hint;
  String? description;
  ValueType? valueType;
  bool? allowFutureDates;
  FieldValueRenderingType? fieldRendering;
  KeyboardActionType? keyboardActionType;
  bool? isLoading;
  IntentCallback? intentCallback;
  FocusNode? focusNode;

  QFieldModelBuilder setUid(String uid) {
    this.uid = uid;
    return this;
  }

  QFieldModelBuilder setOptions(IList<FormOption>? options) {
    this.options = options;
    return this;
  }

  QFieldModelBuilder setFieldRules(IList<Rule>? fieldRules) {
    this.fieldRules = fieldRules;
    return this;
  }

  QFieldModelBuilder setIsFocused(bool isFocused) {
    this.isFocused = isFocused;
    return this;
  }

  QFieldModelBuilder setError(String? error) {
    this.error = error;
    return this;
  }

  QFieldModelBuilder setIsEditable(bool isEditable) {
    this.isEditable = isEditable;
    return this;
  }

  QFieldModelBuilder setIsVisible(bool isVisible) {
    this.isVisible = isVisible;
    return this;
  }

  QFieldModelBuilder setValue(String? value) {
    this.value = value;
    return this;
  }

  QFieldModelBuilder setDisplayName(String? displayName) {
    this.displayName = displayName;
    return this;
  }

  QFieldModelBuilder setWarning(String? warning) {
    this.warning = warning;
    return this;
  }

  QFieldModelBuilder setIsMandatory(bool? isMandatory) {
    this.isMandatory = isMandatory;
    return this;
  }

  QFieldModelBuilder setFieldMask(String? fieldMask) {
    this.fieldMask = fieldMask;
    return this;
  }

  QFieldModelBuilder setLabel(String label) {
    this.label = label;
    return this;
  }

  QFieldModelBuilder setHint(String? hint) {
    this.hint = hint;
    return this;
  }

  QFieldModelBuilder setDescription(String? description) {
    this.description = description;
    return this;
  }

  QFieldModelBuilder setValueType(ValueType? valueType) {
    this.valueType = valueType;
    return this;
  }

  QFieldModelBuilder setAllowFutureDates(bool? allowFutureDates) {
    this.allowFutureDates = allowFutureDates;
    return this;
  }

  QFieldModelBuilder setFieldRendering(
      FieldValueRenderingType? fieldRendering) {
    this.fieldRendering = fieldRendering;
    return this;
  }

  QFieldModelBuilder setKeyboardActionType(
      KeyboardActionType? keyboardActionType) {
    this.keyboardActionType = keyboardActionType;
    return this;
  }

  QFieldModelBuilder setIsLoading(bool isLoading) {
    this.isLoading = isLoading;
    return this;
  }

  QFieldModelBuilder setIntentCallback(IntentCallback? intentCallback) {
    this.intentCallback = intentCallback;
    return this;
  }

  QFieldModelBuilder setFocusNode(FocusNode? focusNode) {
    this.focusNode = focusNode;
    return this;
  }

  QFieldModel build() {
    return QFieldModel(
      uid: uid!,
      options: options,
      fieldRules: fieldRules,
      isFocused: isFocused ?? false,
      error: error,
      isEditable: isEditable ?? true,
      isVisible: isVisible ?? true,
      value: value,
      displayName: displayName,
      warning: warning,
      isMandatory: isMandatory ?? false,
      fieldMask: fieldMask,
      label: label!,
      hint: hint,
      description: description,
      valueType: valueType,
      allowFutureDates: allowFutureDates,
      fieldRendering: fieldRendering,
      keyboardActionType: keyboardActionType,
      isLoading: isLoading ?? false,
      intentCallback: intentCallback,
      focusNode: focusNode,
    );
  }
}
