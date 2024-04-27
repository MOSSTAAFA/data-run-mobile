// ignore_for_file: always_specify_types

import 'dart:io';

import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/common/value_type_rendering_type.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:dartx/dartx_io.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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

// part 'field_ui_model_impl.freezed.dart';
//
// @freezed
@immutable
class FieldUiModelImpl
    with EquatableMixin
    implements FieldUiModel /*with _$FieldUiModelImpl*/ {
  const FieldUiModelImpl(
      {required this.uid,
      // required this.layoutId,
      this.value,
      required this.focused,
      this.error,
      required this.editable,
      this.warning,
      required this.mandatory,
      required this.label,
      this.programStageSection,
      this.style,
      this.hint,
      this.description,
      // LegendValue? legend,
      this.valueType,
      this.optionSet,
      this.allowFutureDates,
      this.uiEventFactory,
      this.displayName,
      this.renderingType,
      this.sectionRenderingType,
      this.fieldRendering,
      this.optionSetConfiguration,
      this.keyboardActionType,
      this.fieldMask,
      this.isLoadingData = false,
      // this.callback
      this.intentCallback,
      this.listViewUiEventsCallback});

  final String uid;

  // final int layoutId;
  final String? value;
  final bool focused;
  final String? error;
  final bool editable;
  final String? warning;
  final bool mandatory;
  final String label;
  final String? programStageSection;
  final FormUiModelStyle? style;
  final String? hint;
  final String? description;

  //final  LegendValue? legend;
  final ValueType? valueType;
  final String? optionSet;
  final bool? allowFutureDates;
  final UiEventFactory? uiEventFactory;
  final String? displayName;
  final UiRenderType? renderingType;

  /// NMC added provided here instead to providing it
  /// to the FieldViewModelFactoryImpl
  /// from ProgramSection of the item
  final SectionRenderingType? sectionRenderingType;

  /// NMC added provided here instead to providing it
  /// to the FieldViewModelFactoryImpl
  /// from ProgramStageDataElement of the item
  final ValueTypeRenderingType? fieldRendering;

  final OptionSetConfiguration? optionSetConfiguration;
  final KeyboardActionType? keyboardActionType;
  final String? fieldMask;
  final bool isLoadingData;

  // final Callback? callback;
  final IntentCallback? intentCallback;
  final ListViewUiEventsCallback? listViewUiEventsCallback;

  @override
  String get formattedLabel => mandatory ? '$label *' : label;

  // Callback _callback;
  @override
  FieldUiModel setCallback(
      {IntentCallback? intentCallback,
      ListViewUiEventsCallback? listViewUiEventsCallback}) {
    // this._callback = _callback;
    return copyWith(
        intentCallback: intentCallback,
        listViewUiEventsCallback: listViewUiEventsCallback);
  }

  @override
  void onItemClick() {
    intentCallback?.call(FormIntent.onFocus(uid, value));
  }

  @override
  void onNext() {
    intentCallback?.call(FormIntent.onNext(uid: uid, value: value));
  }

  @override
  void onTextChange(String? value) {
    intentCallback?.call(FormIntent.onTextChange(
        uid, (value ?? '').isEmpty == true ? null : value));
  }

  @override
  void onDescriptionClick() {
    listViewUiEventsCallback
        ?.call(ListViewUiEvents.showDescriptionLabelDialog(label, description));
  }

  @override
  void onClear() {
    onItemClick();
    intentCallback?.call(FormIntent.clearValue(uid));
  }

  @override
  void onSave(String? value) {
    onItemClick();
    intentCallback
        ?.call(FormIntent.onSave(uid: uid, value: value, valueType: valueType));
  }

  @override
  void onSaveBoolean(bool boolean) {
    onItemClick();
    final result = value == null || value != boolean.toString()
        ? boolean.toString()
        : null;
    intentCallback?.call(
        FormIntent.onSave(uid: uid, value: result, valueType: valueType));
  }

  @override
  void onSaveOption(Option option) {
    String? nextValue;
    if (displayName == option.displayName) {
      nextValue = null;
    } else {
      nextValue = option.code;
    }
    intentCallback?.call(
        FormIntent.onSave(uid: uid, value: nextValue, valueType: valueType));
  }

  @override
  void invokeUiEvent(UiEventType uiEventType) {
    intentCallback?.call(FormIntent.onRequestCoordinates(uid));
    if (uiEventType != UiEventType.QR_CODE && !focused) {
      onItemClick();
    }

    final ListViewUiEvents? listViewUiEvents =
        uiEventFactory?.generateEvent(value, uiEventType, renderingType, this);

    if (listViewUiEvents != null) {
      listViewUiEventsCallback?.call(listViewUiEvents);
    }
  }

  @override
  void invokeIntent(FormIntent intent) {
    intentCallback?.call(intent);
  }

  @override
  Color? get textColor => style?.textColor(error, warning);

  @override
  Pair<List<int>, Color?>? get backGroundColor =>
      style?.backgroundColor(valueType, error, warning);

  @override
  bool get hasImage {
    return value != null && File(value ?? '').existsSync();
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
  FieldUiModel copyWith({
    String? uid,
    int? layoutId,
    String? value,
    bool? focused,
    String? error,
    bool? editable,
    String? warning,
    bool? mandatory,
    String? label,
    String? programStageSection,
    FormUiModelStyle? style,
    String? hint,
    String? description,
    ValueType? valueType,
    // LegendValue? legend,
    String? optionSet,
    bool? allowFutureDates,
    UiEventFactory? uiEventFactory,
    String? displayName,
    UiRenderType? renderingType,
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
    OptionSetConfiguration? optionSetConfiguration,
    int? sectionNumber,
    bool? showBottomShadow,
    bool? lastPositionShouldChangeHeight,
    // Callback? callback,
    IntentCallback? intentCallback,
    ListViewUiEventsCallback? listViewUiEventsCallback,
  }) =>
      FieldUiModelImpl(
        uid: uid ?? this.uid,
        // layoutId: layoutId ?? this.layoutId,
        value: value ?? this.value,
        focused: focused ?? this.focused,
        error: error ?? this.error,
        editable: editable ?? this.editable,
        warning: warning ?? this.warning,
        mandatory: mandatory ?? this.mandatory,
        label: label ?? this.label,
        programStageSection: programStageSection ?? this.programStageSection,
        style: style ?? this.style,
        hint: hint ?? this.hint,
        description: description ?? this.description,
        valueType: valueType ?? this.valueType,
        // LegendValue? legend: legend ?? this.legend,
        optionSet: optionSet ?? this.optionSet,
        allowFutureDates: allowFutureDates ?? this.allowFutureDates,
        uiEventFactory: uiEventFactory ?? this.uiEventFactory,
        displayName: displayName ?? this.displayName,
        renderingType: renderingType ?? this.renderingType,
        keyboardActionType: keyboardActionType ?? this.keyboardActionType,
        fieldMask: fieldMask ?? this.fieldMask,
        isLoadingData: isLoadingData ?? this.isLoadingData,
        optionSetConfiguration:
            optionSetConfiguration ?? this.optionSetConfiguration,
        // callback: callback ?? this.callback,
        intentCallback: intentCallback ?? this.intentCallback,
        listViewUiEventsCallback:
            listViewUiEventsCallback ?? this.listViewUiEventsCallback,
      );

  @override
  bool isSection() => false;

  // @override
  // bool operator ==(dynamic other) {
  //   // if (this === other) return true;
  //   if (identical(this, other)) return true;
  //
  //   // if (javaClass != item.javaClass) return false
  //   if (runtimeType != other.runtimeType) return false;
  //
  //   // NMCP
  //   // if (other !is FieldUiModelImpl) return false;
  //
  //   other = other as FieldUiModelImpl;
  //
  //   if (uid != other.uid) return false;
  //   // if (layoutId != other.layoutId) return false;
  //   if (value != other.value) return false;
  //   if (focused != other.focused) return false;
  //   if (error != other.error) return false;
  //   if (editable != other.editable) return false;
  //   if (warning != other.warning) return false;
  //   if (mandatory != other.mandatory) return false;
  //   if (label != other.label) return false;
  //   if (programStageSection != other.programStageSection) return false;
  //   if (style != other.style) return false;
  //   if (hint != other.hint) return false;
  //   if (description != other.description) return false;
  //   if (valueType != other.valueType) return false;
  //   // if (legend != item.legend) return false;
  //   if (optionSet != other.optionSet) return false;
  //   if (allowFutureDates != other.allowFutureDates) return false;
  //   // if (callback != other.callback) return false;
  //
  //   return true;
  // }

  // @override
  // int get hashCode => Object.hashAll([
  //       runtimeType,
  //       uid,
  //       // layoutId,
  //       value,
  //       focused,
  //       error,
  //       editable,
  //       warning,
  //       mandatory,
  //       label,
  //       programStageSection,
  //       style,
  //       hint,
  //       description,
  //       valueType,
  //       // legend,
  //       optionSet,
  //       allowFutureDates,
  //       // callback
  //       intentCallback,
  //       listViewUiEventsCallback,
  //     ]);

  // @override
  // bool equals(FieldUiModel item) {
  //   // if (this === item) return true;
  //   if (identical(this, item)) return true;
  //   // if (javaClass != item.javaClass) return false
  //   if (runtimeType != item.runtimeType) return false;
  //
  //   item = item as FieldUiModelImpl;
  //
  //   if (uid != item.uid) return false;
  //   // if (layoutId != item.layoutId) return false;
  //   if (value != item.value) return false;
  //   if (focused != item.focused) return false;
  //   if (error != item.error) return false;
  //   if (editable != item.editable) return false;
  //   if (warning != item.warning) return false;
  //   if (mandatory != item.mandatory) return false;
  //   if (label != item.label) return false;
  //   if (programStageSection != item.programStageSection) return false;
  //   if (style != item.style) return false;
  //   if (hint != item.hint) return false;
  //   if (description != item.description) return false;
  //   if (valueType != item.valueType) return false;
  //   // if (legend != item.legend) return false;
  //   if (optionSet != item.optionSet) return false;
  //   if (allowFutureDates != item.allowFutureDates) return false;
  //   // if (callback != item.callback) return false;
  //   if (intentCallback != item.intentCallback) return false;
  //   if (listViewUiEventsCallback != item.listViewUiEventsCallback) return false;
  //
  //   return true;
  // }

  @override
  List<Object?> get props => [
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
        // callback
        intentCallback,
        listViewUiEventsCallback,
      ];
}
