import 'package:d2_remote/core/common/exception/exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_mask_failure.freezed.dart';

@freezed
class FieldMaskFailure with _$FieldMaskFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory FieldMaskFailure.wrongPatternException(
      [@Default('Exception') String message,
      CaughtException? cause]) = WrongPatternException;

  @Implements<ThrowableException>()
  const factory FieldMaskFailure.invalidPatternException(
      [@Default('Exception') String message,
      CaughtException? cause]) = InvalidPatternException;

  const FieldMaskFailure._();
}
