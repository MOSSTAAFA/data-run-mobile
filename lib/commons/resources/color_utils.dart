// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';

enum ColorType { PRIMARY, PRIMARY_LIGHT, PRIMARY_DARK, ACCENT }

class ColorUtils {
  static const int ALPHA_20_PERCENT = 51;

  static int parseColor(String hexColor) {
    if (hexColor.length == 4) {
      //Color is formatted as #fff
      final String r = hexColor[1];
      final String g = hexColor[2];
      final String b = hexColor[3];
      hexColor = "#" + r + r + g + g + b + b; //formatted to #ffff
    }
    return Color(int.parse(hexColor, radix: 16) + 0xFF000000).value;
  }

  static Color getPrimaryColor(BuildContext context, ColorType colorType) {
    // int  id;
    switch (colorType) {
      case ColorType.ACCENT:
        // id = R.attr.colorAccent;
        return Theme.of(context).primaryColorDark;
      case ColorType.PRIMARY_DARK:
        // id = R.attr.colorPrimaryDark;
        return Theme.of(context).primaryColorDark;
      case ColorType.PRIMARY_LIGHT:
        // id = R.attr.colorPrimaryLight;
        return Theme.of(context).primaryColorLight;
      case ColorType.PRIMARY:
    }
    return Theme.of(context).primaryColor;

    // TypedValue typedValue = new TypedValue();
    // TypedArray a = context.obtainStyledAttributes(typedValue.data, new int[]{id});
    // int colorToReturn = a.getColor(0, 0);
    // a.recycle();
    // return colorToReturn;
  }
}
