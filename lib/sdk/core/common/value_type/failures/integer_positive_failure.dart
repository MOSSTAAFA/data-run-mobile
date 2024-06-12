import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'integer_positive_failure.freezed.dart';

@freezed
class IntegerPositiveFailure
    with _$IntegerPositiveFailure
    implements ThrowableException {
  @Implements<ThrowableException>()
  const factory IntegerPositiveFailure.numberFormatException(
      [@Default('Exception') String message,
      CaughtException? cause]) = NumberFormatException;

  @Implements<ThrowableException>()
  const factory IntegerPositiveFailure.integerOverflow(
      [@Default('Exception') String message,
      CaughtException? cause]) = IntegerOverflow;

  @Implements<ThrowableException>()
  const factory IntegerPositiveFailure.valueIsZero(
      [@Default('Exception') String message,
      CaughtException? cause]) = ValueIsZero;

  @Implements<ThrowableException>()
  const factory IntegerPositiveFailure.valueIsNegative(
      [@Default('Exception') String message,
      CaughtException? cause]) = ValueIsNegative;

  @Implements<ThrowableException>()
  const factory IntegerPositiveFailure.leadingZeroException(
      [@Default('Exception') String message,
      CaughtException? cause]) = LeadingZeroException;
}
