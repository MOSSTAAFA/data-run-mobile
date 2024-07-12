import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/generated/l10n.dart';

part 'q_bottom_sheet_dialog_ui_model.freezed.dart';

@freezed
class QBottomSheetDialogUiModel with _$QBottomSheetDialogUiModel {
  const factory QBottomSheetDialogUiModel(
      {required String title,
      required String subtitle,
      required IconData iconResource,
      required QDialogButtonStyle mainButton,
      QDialogButtonStyle? secondaryButton}) = _QBottomSheetDialogUiModel;
}

@freezed
class QDialogButtonStyle with _$QDialogButtonStyle {
  // const factory QDialogButtonStyle({
  //   required String textResource,
  //   @Default(true) bool enabled,
  //   IconData? iconResource,
  //   Color? colorResource,
  //   Color? backgroundColor,
  // }) = _QDialogButtonStyle;

  const factory QDialogButtonStyle.mainButton({
    required String textResource,
    @Default(true) bool enabled,
    IconData? iconResource,
    Color? colorResource,
    Color? backgroundColor,
  }) = _MainButton;

  const factory QDialogButtonStyle.secondaryButton({
    required String textResource,
    @Default(true) bool enabled,
    IconData? iconResource,
    Color? colorResource,
    Color? backgroundColor,
  }) = _SecondaryButton;

  // Custom factory constructors
  static QDialogButtonStyle saveButton() => const QDialogButtonStyle.mainButton(
        textResource: 'Save',
        backgroundColor: Colors.blueAccent,
        iconResource: Icons.save,
      );

  static QDialogButtonStyle completeButton() =>
      QDialogButtonStyle.mainButton(
        textResource: S.current.finalData,
        backgroundColor: Colors.blueAccent,
        colorResource: Colors.white,
        iconResource: Icons.check,
      );

  static QDialogButtonStyle discardButton() =>
      QDialogButtonStyle.secondaryButton(
          textResource: S.current.discard,
          backgroundColor: Colors.orange,
          colorResource: Colors.white,
          iconResource: Icons.disabled_by_default);

  static QDialogButtonStyle neutralButton({required String textResource}) =>
      QDialogButtonStyle.secondaryButton(
          textResource: textResource,
          colorResource: Colors.white,
          backgroundColor: Colors.orangeAccent,
          iconResource: Icons.history);
}

extension QDialogButtonStyleX on QDialogButtonStyle {
  bool get isMainButton => this is _MainButton;

  bool get isSecondaryButton => this is _SecondaryButton;
}
