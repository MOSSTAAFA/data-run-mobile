import 'package:flutter/material.dart';

import 'package:mass_pro/form/ui/style/form_ui_color_type.dart';

abstract class FormUiColorFactory {
  Map<FormUiColorType, Color> getBasicColors();
}
