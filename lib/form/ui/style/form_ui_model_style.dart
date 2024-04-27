import 'package:d2_remote/core/common/value_type.dart';
import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';

import 'form_ui_color_type.dart';

abstract class FormUiModelStyle {
  const FormUiModelStyle();

  Map<FormUiColorType, Color> getColors();

  IconData? getDescriptionIcon();

  Color? textColor([String? error, String? warning]);

  Pair<List<int>, Color?> backgroundColor(
      ValueType? valueType, String? error, String? warning);
}
