import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/commons/date/field_with_issue.dart';

part 'data_integrity_check_result.freezed.dart';

@freezed
class DataIntegrityCheckResult with _$DataIntegrityCheckResult {
  // const factory DataIntegrityCheckResult(
  //     {@Default(false) bool canComplete,
  //     String? onCompleteMessage,
  //     @Default(false) bool allowDiscard}) = _DataIntegrityCheckResult;

  const factory DataIntegrityCheckResult.missingMandatoryResult(
      {required Map<String, String> mandatoryFields,
      required List<FieldWithIssue> errorFields,
      required List<FieldWithIssue> warningFields,
      // override
      @Default(false) bool canComplete,
      String? onCompleteMessage,
      @Default(false) bool allowDiscard}) = MissingMandatoryResult;

  const factory DataIntegrityCheckResult.fieldsWithErrorResult(
      {required Map<String, String> mandatoryFields,
      required List<FieldWithIssue> fieldUidErrorList,
      required List<FieldWithIssue> warningFields,
      // override
      @Default(false) bool canComplete,
      String? onCompleteMessage,
      @Default(false) bool allowDiscard}) = FieldsWithErrorResult;

  const factory DataIntegrityCheckResult.fieldsWithWarningResult(
      {required List<FieldWithIssue> fieldUidWarningList,
      // override
      @Default(false) bool canComplete,
      String? onCompleteMessage,
      @Default(false) bool allowDiscard}) = FieldsWithWarningResult;

  const factory DataIntegrityCheckResult.successfulResult(
      {String? extraData,
      // override
      @Default(false) bool canComplete,
      String? onCompleteMessage,
      @Default(false) bool allowDiscard}) = SuccessfulResult;

  const factory DataIntegrityCheckResult.notSavedResult() = NotSavedResult;
}

// abstract class DEResult {
//   bool get canComplete => false;
//
//   String? get onCompleteMessage => null;
//
//   bool get allowDiscard => false;
// }
