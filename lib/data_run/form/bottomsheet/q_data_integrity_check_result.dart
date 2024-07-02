import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/commons/date/field_with_issue.dart';

part 'q_data_integrity_check_result.freezed.dart';

@freezed
class QDataIntegrityCheckResult with _$QDataIntegrityCheckResult {
  // const factory DataIntegrityCheckResult(
  //     {@Default(false) bool canComplete,
  //     String? onCompleteMessage,
  //     @Default(false) bool allowDiscard}) = _DataIntegrityCheckResult;

  const factory QDataIntegrityCheckResult.missingMandatoryResult(
      {required IMap<String, String> mandatoryFields,
      required IList<FieldWithIssue> errorFields,
      required IList<FieldWithIssue> warningFields,
      // override
      @Default(false) bool canComplete,
      String? onCompleteMessage,
      @Default(false) bool allowDiscard}) = MissingMandatoryResult;

  const factory QDataIntegrityCheckResult.fieldsWithErrorResult(
      {required IMap<String, String> mandatoryFields,
      required IList<FieldWithIssue> fieldUidErrorList,
      required IList<FieldWithIssue> warningFields,
      // override
      @Default(false) bool canComplete,
      String? onCompleteMessage,
      @Default(false) bool allowDiscard}) = FieldsWithErrorResult;

  const factory QDataIntegrityCheckResult.fieldsWithWarningResult(
      {required IList<FieldWithIssue> fieldUidWarningList,
      // override
      @Default(false) bool canComplete,
      String? onCompleteMessage,
      @Default(false) bool allowDiscard}) = FieldsWithWarningResult;

  const factory QDataIntegrityCheckResult.successfulResult(
      {String? extraData,
      // override
      @Default(false) bool canComplete,
      String? onCompleteMessage,
      @Default(false) bool allowDiscard}) = SuccessfulResult;

  const factory QDataIntegrityCheckResult.notSavedResult() = NotSavedResult;
}

// abstract class DEResult {
//   bool get canComplete => false;
//
//   String? get onCompleteMessage => null;
//
//   bool get allowDiscard => false;
// }
