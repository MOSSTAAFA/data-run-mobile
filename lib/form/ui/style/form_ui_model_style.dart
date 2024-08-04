import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

import 'package:mass_pro/form/ui/style/form_ui_color_type.dart';

abstract class FormUiModelStyle {
  const FormUiModelStyle();

  Map<FormUiColorType, Color> getColors();

  IconData? getDescriptionIcon();

  Color? textColor([String? error, String? warning]);

  Pair<List<int>, Color?> backgroundColor(
      ValueType? valueType, String? error, String? warning);
}
