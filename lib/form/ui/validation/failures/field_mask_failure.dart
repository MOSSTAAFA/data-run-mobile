import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/data_run/errors_management/error_management.dart';
import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';

part 'field_mask_failure.freezed.dart';

@freezed
class FieldMaskFailure with _$FieldMaskFailure implements ValidationException {
  @Implements<DException>()
  const factory FieldMaskFailure.wrongPatternException(
      [@Default('dException') String message,
      Object? source]) = WrongPatternException;

  @Implements<DException>()
  const factory FieldMaskFailure.invalidPatternException(
      [@Default('dException') String message,
      Object? source]) = InvalidPatternException;

  const FieldMaskFailure._();
}
