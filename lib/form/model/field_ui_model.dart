import 'package:d2_remote/core/common/value_type.dart';
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

abstract class FieldUiModel {
  String get uid;

  int get layoutId;

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

  Pair<List<int>, Color>? get backGroundColor;

  UiRenderType? get renderingType;

  OptionSetConfiguration? get optionSetConfiguration;

  bool get hasImage;

  KeyboardActionType? get keyboardActionType;

  String? get fieldMask;

  bool get isAffirmativeChecked;

  bool get isNegativeChecked;

  bool get isLoadingData;

  // Callback? get callback;

  FieldUiModel setCallback(Callback callback);

  bool equals(FieldUiModel item);

  onItemClick();

  onNext();

  // onTextChange(value: CharSequence?);
  onTextChange(String? value);

  onDescriptionClick();

  onClear();

  onSave(String? value);

  onSaveBoolean(bool boolean);

  onSaveOption(Option option);

  invokeUiEvent(UiEventType uiEventType);

  invokeIntent(FormIntent intent);

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
}

class Callback {
  const Callback({this.intent, this.listViewUiEvents});
  final void Function(FormIntent intent)? intent;
  final void Function(ListViewUiEvents uiEvent)? listViewUiEvents;

  // intent(FormIntent intent);
  //
  // listViewUiEvents(ListViewUiEvents uiEvent);
}
