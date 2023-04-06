import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../ui/event/list_view_ui_events.dart';
import '../ui/event/ui_event_factory.dart';
import '../ui/intent/form_intent.dart';
import '../ui/style/form_ui_model_style.dart';
import 'Ui_render_type.dart';
import 'field_ui_model.dart';
import 'key_board_action_type.dart';
import 'option_set_configuration.dart';
import 'ui_event_type.dart';

part 'section_ui_model_impl.freezed.dart';

@unfreezed
class SectionUiModelImpl with _$SectionUiModelImpl implements FieldUiModel {

  factory SectionUiModelImpl(
      {required final String uid,
      required final int layoutId,
      final String? value,
      required final bool focused,
      final String? error,
      required final bool editable,
      final String? warning,
      required final bool mandatory,
      required final String label,
      final String? programStageSection,
      final FormUiModelStyle? style,
      final String? hint,
      final String? description,
      final ValueType? valueType,
      // LegendValue? legend,
      final String? optionSet,
      final bool? allowFutureDates,
      final UiEventFactory? uiEventFactory,
      final String? displayName,
      final UiRenderType? renderingType,
      final KeyboardActionType? keyboardActionType,
      final String? fieldMask,
      @Default(false) bool isOpen,
      @Default(0) int totalFields,
      @Default(0) int completedFields,
      @Default(0) int errors,
      @Default(0) int warnings,
      String? rendering,

      /// NMCP can't define a default value
      /// here we have to provide initial value Rx<String?>(null)
      /// whenever we create an object of SectionUiModelImpl
      /*@Default(Rx<String?>(null))*/ required Rx<String?> selectedField,
      @Default(false) final bool isLoadingData,
      OptionSetConfiguration? optionSetConfiguration,
      @Default(0) int sectionNumber,
      @Default(false) bool showBottomShadow,
      @Default(false) bool lastPositionShouldChangeHeight,
      Callback? callback}) = _SectionUiModelImpl;

  SectionUiModelImpl._();
  @override
  String get formattedLabel => label;

  static const String SINGLE_SECTION_UID = 'SINGLE_SECTION_UID';
  static const String CLOSING_SECTION_UID = 'closing_section';

  bool hasToShowDescriptionIcon(bool isTitleEllipsed) {
    return description != null && description?.isNotEmpty == true ||
        isTitleEllipsed;
  }

  bool get isClosingSection => uid == CLOSING_SECTION_UID;

  bool get hasErrorAndWarnings => errors > 0 && warnings > 0;

  bool get hasNotAnyErrorOrWarning => errors == 0 && warnings == 0;

  bool get hasOnlyErrors => errors > 0 && warnings == 0;

  String get getFormattedSectionFieldsInfo => '$completedFields/$totalFields';

  bool get areAllFieldsCompleted => completedFields == totalFields;

  void setSelected() {
    onItemClick();
    if (selectedField.value != null) {
      String sectionToOpen = uid;
      if (selectedField.value == uid) {
        sectionToOpen = '';
      }
      selectedField.value = sectionToOpen;
      callback?.intent?.call(FormIntent.onSection(sectionToOpen));
    }
  }

  bool get isSelected => selectedField.value == uid;

  void setSectionNumber(int sectionNumber) {
    this.sectionNumber = sectionNumber;
    // copyWith(sectionNumber: sectionNumber);
  }

  int getSectionNumber() {
    return sectionNumber;
  }

  void setShowBottomShadow(bool showBottomShadow) {
    this.showBottomShadow = showBottomShadow;
    // copyWith(showBottomShadow: showBottomShadow);
  }

  // bool showBottomShadow() {
  //   return showBottomShadow;
  // }

  bool showNextButton() {
    return showBottomShadow && !isClosingSection;
  }

  void setLastSectionHeight(bool lastPositionShouldChangeHeight) {
    this.lastPositionShouldChangeHeight = lastPositionShouldChangeHeight;
    // copyWith(lastPositionShouldChangeHeight: lastPositionShouldChangeHeight);
  }

  // bool lastPositionShouldChangeHeight() {
  //   return lastPositionShouldChangeHeight;
  // }

// Callback _callback;
  @override
  setCallback(Callback callback) {
    this.callback = callback;
    // copyWith(callback: callback);
  }

  @override
  onItemClick() {
    callback?.intent?.call(FormIntent.onFocus(uid, value));
  }

  @override
  bool get isNegativeChecked => false;

  @override
  onNext() {}

  @override
  onTextChange(String? value) {}

  @override
  onDescriptionClick() {
    callback?.listViewUiEvents?.call(
        ListViewUiEvents.showDescriptionLabelDialog(label, description));
  }

  @override
  onClear() {}

  @override
  onSave(String? value) {}

  @override
  onSaveBoolean(bool boolean) {}

  @override
  onSaveOption(Option option) {}

  @override
  invokeUiEvent(UiEventType uiEventType) {
    onItemClick();
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
  bool get hasImage => false;

  @override
  bool get isAffirmativeChecked => false;

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
  bool isSectionWithFields() => totalFields > 0;

  @override
  bool isSection() => valueType == null;

  /// NMC: this is @unfreezed class Freeze will not define a == and hashCode
  /// functions for @unfreezed classes, we here are just overrising the
  /// super Object == function.
  @override
  bool operator ==(dynamic other) {
    other = other as SectionUiModelImpl;
    return super == other &&
        showBottomShadow == other.showBottomShadow &&
        lastPositionShouldChangeHeight ==
            other.lastPositionShouldChangeHeight &&
        isOpen == other.isOpen &&
        totalFields == other.totalFields &&
        completedFields == other.completedFields &&
        errors == other.errors &&
        warnings == other.warnings &&
        sectionNumber == other.sectionNumber;
  }

  /// NMC: maybe we don't need to override [hashCode] function
  /// Freeze will not define a == and hashCode functions for @unfreezed
  /// classes
  @override
  int get hashCode =>
      super.hashCode +
      Object.hashAll([
        showBottomShadow,
        lastPositionShouldChangeHeight,
        isOpen,
        totalFields,
        completedFields,
        errors,
        warnings,
        sectionNumber
      ]);

  @override
  bool equals(FieldUiModel item) {
    item = item as SectionUiModelImpl;
    return super == item &&
        showBottomShadow == item.showBottomShadow &&
        lastPositionShouldChangeHeight == item.lastPositionShouldChangeHeight &&
        isOpen == item.isOpen &&
        totalFields == item.totalFields &&
        completedFields == item.completedFields &&
        errors == item.errors &&
        warnings == item.warnings &&
        sectionNumber == item.sectionNumber;
  }
}
