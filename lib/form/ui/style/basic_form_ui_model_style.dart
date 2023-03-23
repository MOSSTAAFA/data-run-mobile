import 'package:d2_remote/core/common/value_type.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/resources/color_utils.dart';
import 'package:mass_pro/form/ui/style/form_ui_color_factory.dart';
import 'package:mass_pro/form/ui/style/form_ui_color_type.dart';
import 'package:mass_pro/form/ui/style/form_ui_model_style.dart';

class BasicFormUiModelStyle implements FormUiModelStyle {
  final FormUiColorFactory factory;
  final ValueType valueType;
  Map<FormUiColorType, Color>? _colors;

  BasicFormUiModelStyle(this.factory, this.valueType) {
    _colors = factory.getBasicColors();
  }

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
        return null;
    }
  }

  @override
  Color? textColor([String? error, String? warning]) {
    FormUiColorType colorType = FormUiColorType.TEXT_PRIMARY;
    if(warning != null) colorType = FormUiColorType.WARNING;
    if(error != null) colorType = FormUiColorType.ERROR;
    return _colors?[colorType];
  }

  @override
  Pair<List<int>, Color> backgroundColor(
      ValueType? valueType, String? error, String? warning) {
    FormUiColorType colorType = FormUiColorType.TEXT_PRIMARY;
    if(warning != null) colorType = FormUiColorType.WARNING;
    if(error != null) colorType = FormUiColorType.ERROR;
    return Pair([], _colors![colorType]!);
  }
}
