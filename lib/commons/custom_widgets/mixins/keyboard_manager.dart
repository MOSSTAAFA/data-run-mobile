import 'package:flutter/material.dart';

mixin KeyboardManager {
  void hideTheKeyboard(BuildContext context) {
    final currectFocus = FocusScope.of(context);
    if (!currectFocus.hasPrimaryFocus) {
      currectFocus.unfocus();
    }
  }
}
