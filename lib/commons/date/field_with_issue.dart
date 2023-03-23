import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_with_issue.freezed.dart';

@freezed
class FieldWithIssue with _$FieldWithIssue {
  const factory FieldWithIssue(
      {required String fieldUid,
      required String fieldName,
      required IssueType issueType,
      required String message}) = _FieldWithIssue;

  const FieldWithIssue._();
}

enum IssueType {
  ERROR,
  MANDATORY,
  WARNING,
  ERROR_ON_COMPLETE,
  WARNING_ON_COMPLETE
}
