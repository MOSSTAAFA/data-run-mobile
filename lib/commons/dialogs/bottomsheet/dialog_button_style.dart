import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dialog_button_style.freezed.dart';

@freezed
abstract class DialogButtonStyle with _$DialogButtonStyle {
  const factory DialogButtonStyle(
      {required String textResource,
      Color? colorResource,
      IconData? iconResource,
      Color? backgroundColor}) = _DialogButtonStyle;
  const DialogButtonStyle._();

  const factory DialogButtonStyle.mainButton(
      {required String textResource,
      @Default(Colors.white) Color? colorResource}) = MainButton;

  const factory DialogButtonStyle.secondaryButton(
      {required String textResource,
      @Default(Colors.white) Color? colorResource}) = SecondaryButton;

  /// class
  factory DialogButtonStyle.completeButton() => const DialogButtonStyle(
      textResource: 'string.complete',
      colorResource: Colors.white,
      iconResource: Icons.check);

  /// class
  factory DialogButtonStyle.discardButton() => const DialogButtonStyle(
      textResource: 'string.discard_changes', colorResource: Colors.orange);

  /// class
  factory DialogButtonStyle.neutralButton({required String textResource}) =>
      DialogButtonStyle(
          textResource: textResource,
          colorResource: Colors.blueAccent,
          backgroundColor: Colors.white);
}
