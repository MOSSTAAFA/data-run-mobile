import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:datarun/utils/navigator_key.dart';

part 'dialog_button_style.freezed.dart';

@freezed
abstract class DialogButtonStyle with _$DialogButtonStyle {
  const factory DialogButtonStyle.mainButton({
    required String text,
    IconData? iconData,
    @Default(Colors.white) Color color,
    @Default(Colors.blueAccent) Color backgroundColor,
  }) = MainButton;

  const factory DialogButtonStyle.secondaryButton({
    required String text,
    @Default(Colors.white) Color color,
    IconData? iconData,
    @Default(Colors.grey) Color backgroundColor,
  }) = SecondaryButton;

  // Custom concrete buttons
  factory DialogButtonStyle.finalizeButton() => MainButton(
        text: S.of(navigatorKey.currentContext!).finalData,
        iconData: Icons.check,
        color: Colors.white,
        backgroundColor: Colors.green,
      );

  factory DialogButtonStyle.discardButton() => SecondaryButton(
        text: 'Discard Changes',
        iconData: Icons.cancel,
        color: Colors.white,
        backgroundColor: Colors.red,
      );

  factory DialogButtonStyle.neutralButton({required String textResource}) =>
      MainButton(
        text: textResource,
        color: Colors.blueAccent,
        backgroundColor: Colors.white,
      );
}
