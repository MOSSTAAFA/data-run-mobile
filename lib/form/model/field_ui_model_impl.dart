import 'dart:io';

import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../commons/extensions/string_extension.dart';
import '../ui/event/list_view_ui_events.dart';
import '../ui/event/ui_event_factory.dart';
import '../ui/intent/form_intent.dart';
import '../ui/style/form_ui_model_style.dart';
import 'Ui_render_type.dart';
import 'field_ui_model.dart';
import 'key_board_action_type.dart';
import 'option_set_configuration.dart';
import 'ui_event_type.dart';

part 'field_ui_model_impl.freezed.dart';

@freezed
class FieldUiModelImpl with _$FieldUiModelImpl implements FieldUiModel {
  @override
  String get formattedLabel => mandatory ? '$label *' : label;

  const factory FieldUiModelImpl(
      {required String uid,
      required int layoutId,
      String? value,
      required bool focused,
      String? error,
      required bool editable,
      String? warning,
      required bool mandatory,
      required String label,
      String? programStageSection,
      FormUiModelStyle? style,
      String? hint,
      String? description,
      // LegendValue? legend,
      ValueType? valueType,
      String? optionSet,
      bool? allowFutureDates,
      UiEventFactory? uiEventFactory,
      String? displayName,
      UiRenderType? renderingType,
      OptionSetConfiguration? optionSetConfiguration,
      KeyboardActionType? keyboardActionType,
      String? fieldMask,
      @Default(false) bool isLoadingData,
      Callback? callback}) = _FieldUiModelImpl;

  const FieldUiModelImpl._();

  // Callback _callback;
  @override
  setCallback(Callback callback) {
    // this._callback = _callback;
    copyWith(callback: callback);
  }

  @override
  onItemClick() {
    callback?.intent?.call(FormIntent.onFocus(uid, value));
  }

  @override
  onNext() {
    callback?.intent?.call(FormIntent.onNext(uid: uid, value: value));
  }

  @override
  onTextChange(String? value) {
    callback?.intent?.call(FormIntent.onTextChange(
        uid, (value ?? '').isEmpty == true ? null : value));
  }

  @override
  onDescriptionClick() {
    callback?.listViewUiEvents
        ?.call(ListViewUiEvents.showDescriptionLabelDialog(label, description));
  }

  @override
  onClear() {
    onItemClick();
    callback?.intent?.call(FormIntent.clearValue(uid));
  }

  @override
  onSave(String? value) {
    onItemClick();
    callback?.intent
        ?.call(FormIntent.onSave(uid: uid, value: value, valueType: valueType));
  }

  @override
  onSaveBoolean(bool boolean) {
    onItemClick();
    var result = value == null || value != boolean.toString()
        ? boolean.toString()
        : null;
    callback?.intent?.call(
        FormIntent.onSave(uid: uid, value: result, valueType: valueType));
  }

  @override
  onSaveOption(Option option) {
    String? nextValue;
    if (displayName == option.displayName) {
      nextValue = null;
    } else {
      nextValue = option.code;
    }
    callback?.intent?.call(
        FormIntent.onSave(uid: uid, value: nextValue, valueType: valueType));
  }

  @override
  invokeUiEvent(UiEventType uiEventType) {
    callback?.intent?.call(FormIntent.onRequestCoordinates(uid));
    if (uiEventType != UiEventType.QR_CODE && !focused) {
      onItemClick();
    }

    final ListViewUiEvents? listViewUiEvents =
        uiEventFactory?.generateEvent(value, uiEventType, renderingType, this);

    if (listViewUiEvents != null) {
      callback?.listViewUiEvents?.call(listViewUiEvents);
    }
  }

  @override
  invokeIntent(FormIntent intent) {
    callback?.intent?.call(intent);
  }

  @override
  Color? get textColor => style?.textColor(error, warning);

  @override
  Pair<List<int>, Color>? get backGroundColor =>
      style?.backgroundColor(valueType, error, warning);

  @override
  bool get hasImage {
    return value != null ? File(value ?? '').existsSync() : false;
  }

  @override
  bool get isAffirmativeChecked => value.toBoolean() == true;

  @override
  bool get isNegativeChecked => value.toBoolean() == false;

  @override
  FieldUiModel setValue(String? value) => copyWith(value: value);

  @override
  FieldUiModel setIsLoadingData(bool isLoadingData) =>
      copyWith(isLoadingData: isLoadingData);

  @override
  FieldUiModel setFocus() => copyWith(focused: true);

  @override
  FieldUiModel setError(String? error) => copyWith(error: error);

  @override
  FieldUiModel setEditable(bool editable) => copyWith(editable: editable);

  // @override
  // FieldUiModel setLegend(LegendValue? legendValue) =>
  //     copyWith(legend: legendValue);

  @override
  FieldUiModel setWarning(String warning) => copyWith(warning: warning);

  @override
  FieldUiModel setFieldMandatory() => copyWith(mandatory: true);

  @override
  FieldUiModel setDisplayName(String? displayName) =>
      copyWith(displayName: displayName);

  @override
  FieldUiModel setKeyBoardActionDone() =>
      copyWith(keyboardActionType: KeyboardActionType.DONE);

  @override
  bool isSectionWithFields() => false;

  @override
  bool isSection() => valueType == null;

  @override
  bool operator ==(dynamic other) {
    // if (this === other) return true;
    if (identical(this, other)) return true;

    // if (javaClass != item.javaClass) return false
    if (runtimeType != other.runtimeType) return false;

    // NMCP
    // if (other !is FieldUiModelImpl) return false;

    other = other as FieldUiModelImpl;

    if (uid != other.uid) return false;
    // if (layoutId != other.layoutId) return false;
    if (value != other.value) return false;
    if (focused != other.focused) return false;
    if (error != other.error) return false;
    if (editable != other.editable) return false;
    if (warning != other.warning) return false;
    if (mandatory != other.mandatory) return false;
    if (label != other.label) return false;
    if (programStageSection != other.programStageSection) return false;
    if (style != other.style) return false;
    if (hint != other.hint) return false;
    if (description != other.description) return false;
    if (valueType != other.valueType) return false;
    // if (legend != item.legend) return false;
    if (optionSet != other.optionSet) return false;
    if (allowFutureDates != other.allowFutureDates) return false;
    if (callback != other.callback) return false;

    return true;
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        uid,
        // layoutId,
        value,
        focused,
        error,
        editable,
        warning,
        mandatory,
        label,
        programStageSection,
        style,
        hint,
        description,
        valueType,
        // legend,
        optionSet,
        allowFutureDates,
        callback
      ]);

  @override
  bool equals(FieldUiModel item) {
    // if (this === item) return true;
    if (identical(this, item)) return true;
    // if (javaClass != item.javaClass) return false
    if (runtimeType != item.runtimeType) return false;

    item = item as FieldUiModelImpl;

    if (uid != item.uid) return false;
    // if (layoutId != item.layoutId) return false;
    if (value != item.value) return false;
    if (focused != item.focused) return false;
    if (error != item.error) return false;
    if (editable != item.editable) return false;
    if (warning != item.warning) return false;
    if (mandatory != item.mandatory) return false;
    if (label != item.label) return false;
    if (programStageSection != item.programStageSection) return false;
    if (style != item.style) return false;
    if (hint != item.hint) return false;
    if (description != item.description) return false;
    if (valueType != item.valueType) return false;
    // if (legend != item.legend) return false;
    if (optionSet != item.optionSet) return false;
    if (allowFutureDates != item.allowFutureDates) return false;
    if (callback != item.callback) return false;

    return true;
  }
}
