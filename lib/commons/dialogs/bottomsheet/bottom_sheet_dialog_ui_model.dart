import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../date/field_with_issue.dart';
import 'dialog_button_style.dart';

part 'bottom_sheet_dialog_ui_model.freezed.dart';

@freezed
class BottomSheetDialogUiModel with _$BottomSheetDialogUiModel {
  const factory BottomSheetDialogUiModel(
      {required String title,
      required String subtitle,
      required IconData iconResource,
      @Default(<FieldWithIssue>[]) List<FieldWithIssue> fieldsWithIssues,
      required DialogButtonStyle mainButton,
      DialogButtonStyle? secondaryButton}) = _BottomSheetDialogUiModel;

  const BottomSheetDialogUiModel._();
}
