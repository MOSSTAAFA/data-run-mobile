import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/common/value_type_rendering_type.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:dartx/dartx_io.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../ui/event/list_view_ui_events.dart';
import '../ui/event/ui_event_factory.dart';
import '../ui/intent/form_intent.dart';
import '../ui/style/form_ui_model_style.dart';
import 'Ui_render_type.dart';
import 'field_ui_model.dart';
import 'key_board_action_type.dart';
import 'option_set_configuration.dart';
import 'ui_event_type.dart';

// part 'section_ui_model_impl.freezed.dart';
//
// @freezed
@immutable
class SectionUiModelImpl
    with
        EquatableMixin /*with _$SectionUiModelImpl,*/
    implements
        FieldUiModel {
  const SectionUiModelImpl(
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
      this.valueType,
      // LegendValue? legend,
      this.optionSet,
      this.allowFutureDates,
      this.uiEventFactory,
      this.displayName,
      this.renderingType,
      this.keyboardActionType,
      this.fieldMask,
      this.isOpen = false,
      this.totalFields = 0,
      this.completedFields = 0,
      this.errors = 0,
      this.warnings = 0,
      this.rendering,
      this.sectionRenderingType,
      this.fieldRendering,

      /// NMCP can't define a default value
      /// here we have to provide initial value Rx<String?>(null)
      /// whenever we create an object of SectionUiModelImpl
      //   /*@Default(Rx<String?>(null))*/ required Rx<String?> selectedField,
      /*@Default(Rx<String?>(null))*/ this.selectedField,
      this.isLoadingData = false,
      this.optionSetConfiguration,
      this.sectionNumber = 0,
      this.showBottomShadow = false,
      this.lastPositionShouldChangeHeight = false,
      // this.callback,
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
  final ValueType? valueType;

  // final LegendValue? legend;
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

  final KeyboardActionType? keyboardActionType;
  final String? fieldMask;
  final bool isOpen;
  final int totalFields;
  final int completedFields;
  final int errors;
  final int warnings;
  final String? rendering;

  final String? selectedField;
  final bool isLoadingData;
  final OptionSetConfiguration? optionSetConfiguration;
  final int sectionNumber;
  final bool showBottomShadow;
  final bool lastPositionShouldChangeHeight;

  // final Callback? callback;
  final IntentCallback? intentCallback;
  final ListViewUiEventsCallback? listViewUiEventsCallback;

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

  FieldUiModel setSelected() {
    onItemClick();
    if (selectedField != null) {
      String sectionToOpen = uid;
      if (selectedField == uid) {
        sectionToOpen = '';
      }
      // selectedField = sectionToOpen;
      intentCallback?.call(FormIntent.onSection(sectionToOpen));
      return copyWith(selectedField: sectionToOpen);
    }

    return this;
  }

  bool get isSelected => selectedField == uid;

  FieldUiModel setSectionNumber(int sectionNumber) {
    // this.sectionNumber = sectionNumber;
    return copyWith(sectionNumber: sectionNumber);
  }

  int getSectionNumber() {
    return sectionNumber;
  }

  FieldUiModel setShowBottomShadow(bool showBottomShadow) {
    // this.showBottomShadow = showBottomShadow;
    return copyWith(showBottomShadow: showBottomShadow);
  }

  // bool showBottomShadow() {
  //   return showBottomShadow;
  // }

  bool showNextButton() {
    return showBottomShadow && !isClosingSection;
  }

  FieldUiModel setLastSectionHeight(bool lastPositionShouldChangeHeight) {
    // this.lastPositionShouldChangeHeight = lastPositionShouldChangeHeight;
    return copyWith(
        lastPositionShouldChangeHeight: lastPositionShouldChangeHeight);
  }

  // bool lastPositionShouldChangeHeight() {
  //   return lastPositionShouldChangeHeight;
  // }

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
  bool get isNegativeChecked => false;

  @override
  void onNext() {}

  @override
  void onTextChange(String? value) {}

  @override
  void onDescriptionClick() {
    listViewUiEventsCallback
        ?.call(ListViewUiEvents.showDescriptionLabelDialog(label, description));
  }

  @override
  void onClear() {}

  @override
  void onSave(String? value) {}

  @override
  void onSaveBoolean(bool boolean) {}

  @override
  void onSaveOption(Option option) {}

  @override
  void invokeUiEvent(UiEventType uiEventType) {
    onItemClick();
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
  }) {
    return SectionUiModelImpl(
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
      isOpen: isOpen ?? this.isOpen,
      totalFields: totalFields ?? this.totalFields,
      completedFields: completedFields ?? this.completedFields,
      errors: errors ?? this.errors,
      warnings: warnings ?? this.warnings,
      rendering: rendering ?? this.rendering,
      selectedField: selectedField ?? this.selectedField,
      isLoadingData: isLoadingData ?? this.isLoadingData,
      optionSetConfiguration:
          optionSetConfiguration ?? this.optionSetConfiguration,
      sectionNumber: sectionNumber ?? this.sectionNumber,
      showBottomShadow: showBottomShadow ?? this.showBottomShadow,
      lastPositionShouldChangeHeight:
          lastPositionShouldChangeHeight ?? this.lastPositionShouldChangeHeight,
      // callback: callback ?? this.callback,
      intentCallback: intentCallback ?? this.intentCallback,
      listViewUiEventsCallback:
          listViewUiEventsCallback ?? this.listViewUiEventsCallback,
    );
  }

  /// NMC: this is @unfreezed class Freeze will not define a == and hashCode
  /// functions for @unfreezed classes, we here are just overrising the
  /// super Object == function.
  // @override
  // bool operator ==(dynamic other) {
  //   other = other as SectionUiModelImpl;
  //   return super == other &&
  //       showBottomShadow == other.showBottomShadow &&
  //       lastPositionShouldChangeHeight ==
  //           other.lastPositionShouldChangeHeight &&
  //       isOpen == other.isOpen &&
  //       totalFields == other.totalFields &&
  //       completedFields == other.completedFields &&
  //       errors == other.errors &&
  //       warnings == other.warnings &&
  //       sectionNumber == other.sectionNumber;
  // }

  // /// NMC: maybe we don't need to override [hashCode] function
  // /// Freeze will not define a == and hashCode functions for @unfreezed
  // /// classes
  // @override
  // int get hashCode =>
  //     super.hashCode +
  //     Object.hashAll([
  //       showBottomShadow,
  //       lastPositionShouldChangeHeight,
  //       isOpen,
  //       totalFields,
  //       completedFields,
  //       errors,
  //       warnings,
  //       sectionNumber
  //     ]);

  // @override
  // bool equals(FieldUiModel item) {
  //   item = item as SectionUiModelImpl;
  //   return super == item &&
  //       showBottomShadow == item.showBottomShadow &&
  //       lastPositionShouldChangeHeight == item.lastPositionShouldChangeHeight &&
  //       isOpen == item.isOpen &&
  //       totalFields == item.totalFields &&
  //       completedFields == item.completedFields &&
  //       errors == item.errors &&
  //       warnings == item.warnings &&
  //       sectionNumber == item.sectionNumber;
  // }

  @override
  bool isSection() => true;

  @override
  List<Object?> get props => [
        showBottomShadow,
        lastPositionShouldChangeHeight,
        isOpen,
        totalFields,
        completedFields,
        errors,
        warnings,
        sectionNumber
      ];
}
