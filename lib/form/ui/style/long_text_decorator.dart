import 'dart:ui';

import 'package:d2_remote/core/common/value_type.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:mass_pro/form/ui/style/form_ui_color_factory.dart';
import 'package:mass_pro/form/ui/style/form_ui_color_type.dart';
import 'package:mass_pro/form/ui/style/form_ui_model_style.dart';

class LongTextDecorator extends FormUiModelStyle {
  final FormUiModelStyle style;
  final FormUiColorFactory longTextFactory;

  const LongTextDecorator(this.style, this.longTextFactory);

  @override
  Map<FormUiColorType, Color> getColors() {
    // TODO: implement getColors
    throw UnimplementedError();
  }

  @override
  IconData? getDescriptionIcon() {
    // TODO: implement getDescriptionIcon
    throw UnimplementedError();
  }

  @override
  Color? textColor([String? error, String? warning]) {
    // TODO: implement textColor
    throw UnimplementedError();
  }

  @override
  Pair<List<int>, Color> backgroundColor(
      ValueType? valueType, String? error, String? warning) {
    // TODO: implement backgroundColor
    throw UnimplementedError();
  }
}
