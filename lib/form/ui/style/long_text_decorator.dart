import 'package:d2_remote/core/common/value_type.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import 'form_ui_color_factory.dart';
import 'form_ui_color_type.dart';
import 'form_ui_model_style.dart';

class LongTextDecorator extends FormUiModelStyle {
  const LongTextDecorator(this.style, this.longTextFactory);

  final FormUiModelStyle style;
  final FormUiColorFactory longTextFactory;

  @override
  Map<FormUiColorType, Color> getColors() {
    return longTextFactory.getBasicColors();
  }

  @override
  IconData? getDescriptionIcon() {
    return null;
    // throw UnimplementedError();
  }

  @override
  Color? textColor([String? error, String? warning]) {
    FormUiColorType colorType = FormUiColorType.TEXT_PRIMARY;
    if (warning != null) colorType = FormUiColorType.WARNING;
    if (error != null) colorType = FormUiColorType.ERROR;
    return longTextFactory.getBasicColors()[colorType];
    // TODO: implement textColor
    // throw UnimplementedError();
  }

  @override
  Pair<List<int>, Color?> backgroundColor(
      ValueType? valueType, String? error, String? warning) {
    FormUiColorType? colorType;
    if (warning != null) colorType = FormUiColorType.WARNING;
    if (error != null) colorType = FormUiColorType.ERROR;
    return Pair([], longTextFactory.getBasicColors()[colorType]!);
    // TODO: implement backgroundColor
    // throw UnimplementedError();
  }
}
