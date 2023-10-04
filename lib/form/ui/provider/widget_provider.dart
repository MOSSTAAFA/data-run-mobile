import 'package:flutter/material.dart';

import '../../model/field_ui_model.dart';

abstract class WidgetProvider {
  Widget getWidgetByModel(Type modelClass);

  Widget getWidgetByType(FieldUiModel item);

  Widget getWidgetForSection();
}
