import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/common/value_type_rendering_type.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';

import '../ui/event/list_view_ui_events.dart';
import '../ui/event/ui_event_factory.dart';
import '../ui/intent/form_intent.dart';
import '../ui/style/form_ui_model_style.dart';
import 'Ui_render_type.dart';
import 'key_board_action_type.dart';
import 'option_set_configuration.dart';
import 'ui_event_type.dart';

typedef IntentCallback = void Function(FormIntent intent);
typedef ListViewUiEventsCallback = void Function(ListViewUiEvents uiEvent);

abstract class FieldUiModel {
  IntentCallback? get intentCallback;

  ListViewUiEventsCallback? get listViewUiEventsCallback;

  String get uid;

  // int get layoutId;

  String? get value;

  bool get focused;

  String? get error;

  bool get editable;

  String? get warning;

  bool get mandatory;

  String get label;

  String get formattedLabel;

  String? get programStageSection;

  FormUiModelStyle? get style;

  String? get hint;

  String? get description;

  ValueType? get valueType => null;

  // LegendValue? get legend;

  String? get optionSet;

  bool? get allowFutureDates;

  UiEventFactory? get uiEventFactory;

  String? get displayName;

  Color? get textColor;

  Pair<List<int>, Color?>? get backGroundColor;

  /// a UiRenderType
  /// provided by UiEventTypesProviderImpl : UiEventTypesProvider
  /// UiEventTypesProviderImpl.provideUiRenderType
  /// switch(FeatureType)
  /// based on
  /// FeatureType, fieldRendering?.type() : ValueTypeRenderingType?,,
  /// and sectionRenderingType: SectionRenderingType? coming earlier into
  /// the factory of the item
  /// the item switch(FeatureType)
  UiRenderType? get renderingType;

  /// NMC added provided here instead to providing it
  /// to the FieldViewModelFactoryImpl
  /// from ProgramSection of the item
  SectionRenderingType? get sectionRenderingType;

  /// NMC added provided here instead to providing it
  /// to the FieldViewModelFactoryImpl
  /// from ProgramStageDataElement of the item
  ValueTypeRenderingType? get fieldRendering;

  OptionSetConfiguration? get optionSetConfiguration;

  bool get hasImage;

  KeyboardActionType? get keyboardActionType;

  String? get fieldMask;

  bool get isAffirmativeChecked;

  bool get isNegativeChecked;

  bool get isLoadingData;

  // Callback? get callback;

  FieldUiModel setCallback(
      {IntentCallback? intentCallback,
      ListViewUiEventsCallback? listViewUiEventsCallback});

  // bool equals(FieldUiModel item);

  void onItemClick();

  void onNext();

  // onTextChange(value: CharSequence?);
  void onTextChange(String? value);

  void onDescriptionClick();

  void onClear();

  void onSave(String? value);

  void onSaveBoolean(bool boolean);

  void onSaveOption(Option option);

  void invokeUiEvent(UiEventType uiEventType);

  void invokeIntent(FormIntent intent);

  FieldUiModel setValue(String? value);

  FieldUiModel setIsLoadingData(bool isLoadingData);

  FieldUiModel setFocus();

  FieldUiModel setError(String? error);

  FieldUiModel setEditable(bool editable);

  // FieldUiModel setLegend(LegendValue? legendValue);

  FieldUiModel setWarning(String warning);

  FieldUiModel setFieldMandatory();

  FieldUiModel setDisplayName(String? displayName);

  FieldUiModel setKeyBoardActionDone();

// interface Callback {
// fun intent(intent: FormIntent);
// fun recyclerViewUiEvents(uiEvent: RecyclerViewUiEvents);
// }

  bool isSection() => valueType == null;

  bool isSectionWithFields();

  // Callback? get callback;

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
  });
}

class Callback {
  const Callback({this.intent, this.listViewUiEvents});

  final void Function(FormIntent intent)? intent;
  final void Function(ListViewUiEvents uiEvent)? listViewUiEvents;

// intent(FormIntent intent);
//
// listViewUiEvents(ListViewUiEvents uiEvent);
}
