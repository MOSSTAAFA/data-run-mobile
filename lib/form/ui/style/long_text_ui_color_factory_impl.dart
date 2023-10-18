import 'dart:collection';

import 'package:flutter/material.dart';

import '../../../commons/resources/color_utils.dart';
import '../../../main.dart';
import 'form_ui_color_factory.dart';
import 'form_ui_color_type.dart';

class LongTextUiColorFactoryImpl implements FormUiColorFactory {
  LongTextUiColorFactoryImpl({this.isBackgroundTransparent = false});

  bool isBackgroundTransparent;

  // TODO NMC, same as FormUiModelColorFactoryImpl, change to it's Colors
  @override
  Map<FormUiColorType, Color> getBasicColors() {
    if (isBackgroundTransparent) {
      return UnmodifiableMapView({
        FormUiColorType.PRIMARY: ColorUtils.getPrimaryColor(
            navigatorKey.currentContext!, ColorType.PRIMARY),
        FormUiColorType.TEXT_PRIMARY:
            Theme.of(navigatorKey.currentContext!).textTheme.bodyLarge?.color ??
                Colors.black87,
        FormUiColorType.FIELD_LABEL_TEXT: Theme.of(navigatorKey.currentContext!)
                .textTheme
                .labelMedium
                ?.color ??
            Colors.black87,
        FormUiColorType.WARNING:
            Theme.of(navigatorKey.currentContext!).highlightColor,
        FormUiColorType.ERROR:
            Theme.of(navigatorKey.currentContext!).errorColor,
        FormUiColorType.ACTION_ICON:
            Theme.of(navigatorKey.currentContext!).iconTheme.color ??
                Theme.of(navigatorKey.currentContext!).primaryColorDark,
      });
    }
    return UnmodifiableMapView({
      FormUiColorType.PRIMARY: ColorUtils.getPrimaryColor(
          navigatorKey.currentContext!, ColorType.ACCENT),
      FormUiColorType.TEXT_PRIMARY: ColorUtils.getPrimaryColor(
          navigatorKey.currentContext!, ColorType.ACCENT),
      FormUiColorType.FIELD_LABEL_TEXT: ColorUtils.getPrimaryColor(
          navigatorKey.currentContext!, ColorType.ACCENT),
      FormUiColorType.WARNING:
          Theme.of(navigatorKey.currentContext!).highlightColor,
      FormUiColorType.ERROR: Theme.of(navigatorKey.currentContext!).errorColor,
      FormUiColorType.ACTION_ICON:
          Theme.of(navigatorKey.currentContext!).iconTheme.color ??
              Theme.of(navigatorKey.currentContext!).primaryColorDark,
    });
  }
}
