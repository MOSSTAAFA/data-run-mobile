import 'package:d2_remote/core/common/value_type.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import 'form_ui_color_factory.dart';
import 'form_ui_color_type.dart';
import 'form_ui_model_style.dart';

class BasicFormUiModelStyle implements FormUiModelStyle {
  BasicFormUiModelStyle(this.factory, this.valueType) {
    _colors = factory.getBasicColors();
  }

  final FormUiColorFactory factory;
  final ValueType valueType;
  Map<FormUiColorType, Color>? _colors;

  @override
  Map<FormUiColorType, Color> getColors() {
    return factory.getBasicColors();
  }

  @override
  IconData? getDescriptionIcon() {
    switch (valueType) {
      case ValueType.DATE:
        return Icons.date_range_outlined;
      case ValueType.DATETIME:
        return Icons.data_exploration_outlined;
      case ValueType.TIME:
        return Icons.access_time;
      case ValueType.PERCENTAGE:
        return Icons.percent_outlined;
      default:
    }
    return null;
  }

  @override
  Color? textColor([String? error, String? warning]) {
    FormUiColorType colorType = FormUiColorType.TEXT_PRIMARY;
    if (warning != null) colorType = FormUiColorType.WARNING;
    if (error != null) colorType = FormUiColorType.ERROR;
    return _colors?[colorType];
  }

  @override
  Pair<List<int>, Color?> backgroundColor(
      ValueType? valueType, String? error, String? warning) {
    if (warning != null) return Pair([], _colors![FormUiColorType.WARNING]);
    if (error != null) return Pair([], _colors![FormUiColorType.ERROR]);
    return Pair([], null);
  }
}
