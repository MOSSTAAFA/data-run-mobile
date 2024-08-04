import 'package:mass_pro/form/model/Ui_render_type.dart';
import 'package:mass_pro/form/model/field_ui_model.dart';
import 'package:mass_pro/form/model/ui_event_type.dart';
import 'package:mass_pro/form/ui/event/list_view_ui_events.dart';

abstract class UiEventFactory {
  ListViewUiEvents? generateEvent(String? value, UiEventType? uiEventType,
      UiRenderType? renderingType, FieldUiModel fieldUiModel);
}
