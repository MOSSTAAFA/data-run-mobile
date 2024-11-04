import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_sheet_content_model.freezed.dart';

@freezed
class DialogContentModel with _$DialogContentModel {
  const factory DialogContentModel({
    required String title,
    required String subtitle,
    required IconData icon,
    required BottomSheetBodyModel body,
  }) = _DialogContentModel;
}

@freezed
abstract class BottomSheetBodyModel with _$BottomSheetBodyModel {
  const BottomSheetBodyModel._();

  const factory BottomSheetBodyModel({
    String? message,
    required Map<String, List<FieldWithIssue<dynamic>>> fieldsWithIssues,
    required Map<String, List<FieldWithIssue<dynamic>>> allFields,
  }) = _BottomSheetBodyModel;
}

enum ParentType {
  Field,
  Section,
  RepeatingSection;

  static ParentType? fromValueType(ValueType? valueType) {
    switch (valueType) {
      case ValueType.Section:
        return ParentType.Section;
      case ValueType.RepeatableSection:
        return ParentType.RepeatingSection;
      case null:
        return null;
      default:
        return ParentType.Field;
    }
  }
}

@freezed
class FieldWithIssue<T> with _$FieldWithIssue<T> {
  const FieldWithIssue._();

  String get fieldPath =>
      parentPath != null ? parentPath! + '.' + fieldName : fieldName;

  bool get isParentRepeated => parentType == ParentType.RepeatingSection;

  const factory FieldWithIssue({
    String? parentPath,
    String? parentLabel,
    ParentType? parentType,
    required String fieldName,
    required String fieldLabel,
    T? value,
    String? message,
  }) = _FieldWithIssue<T>;
}
