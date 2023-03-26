import 'dart:collection';

import 'package:flutter/material.dart';
import '../../../commons/resources/color_utils.dart';
import 'form_ui_color_factory.dart';
import 'form_ui_color_type.dart';

class LongTextUiColorFactoryImpl implements FormUiColorFactory {
  LongTextUiColorFactoryImpl(
      {required this.context, this.isBackgroundTransparent = false});

  BuildContext context;
  bool isBackgroundTransparent;

  // TODO NMC, same as FormUiModelColorFactoryImpl, change to it's Colors
  @override
  Map<FormUiColorType, Color> getBasicColors() {
    if (isBackgroundTransparent) {
      return UnmodifiableMapView({
        FormUiColorType.PRIMARY:
            ColorUtils.getPrimaryColor(context, ColorType.PRIMARY),
        FormUiColorType.TEXT_PRIMARY:
            Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black87,
        FormUiColorType.FIELD_LABEL_TEXT:
            Theme.of(context).textTheme.labelMedium?.color ?? Colors.black87,
        FormUiColorType.WARNING: Theme.of(context).highlightColor,
        FormUiColorType.ERROR: Theme.of(context).errorColor,
        FormUiColorType.ACTION_ICON:
            Theme.of(context).iconTheme.color ?? Theme.of(context).accentColor,
      });
    }
    return UnmodifiableMapView({
      FormUiColorType.PRIMARY:
          ColorUtils.getPrimaryColor(context, ColorType.ACCENT),
      FormUiColorType.TEXT_PRIMARY:
          ColorUtils.getPrimaryColor(context, ColorType.ACCENT),
      FormUiColorType.FIELD_LABEL_TEXT:
          ColorUtils.getPrimaryColor(context, ColorType.ACCENT),
      FormUiColorType.WARNING: Theme.of(context).highlightColor,
      FormUiColorType.ERROR: Theme.of(context).errorColor,
      FormUiColorType.ACTION_ICON:
          Theme.of(context).iconTheme.color ?? Theme.of(context).accentColor,
    });
  }
}
