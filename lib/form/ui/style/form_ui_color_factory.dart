import 'package:flutter/material.dart';

import 'form_ui_color_type.dart';

abstract class FormUiColorFactory {
  Map<FormUiColorType, Color> getBasicColors();
}
