import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'integer_negative_failure.freezed.dart';

@freezed
class IntegerNegativeFailure
    with _$IntegerNegativeFailure
    implements ThrowableException {
  @Implements<ThrowableException>()
  const factory IntegerNegativeFailure.numberFormatException(
      [@Default('Exception') String message,
      CaughtException? cause]) = NumberFormatException;

  @Implements<ThrowableException>()
  const factory IntegerNegativeFailure.integerOverflow(
      [@Default('Exception') String message,
      CaughtException? cause]) = IntegerOverflow;

  @Implements<ThrowableException>()
  const factory IntegerNegativeFailure.valueIsZero(
      [@Default('Exception') String message,
      CaughtException? cause]) = ValueIsZero;

  @Implements<ThrowableException>()
  const factory IntegerNegativeFailure.valueIsPositive(
      [@Default('Exception') String message,
      CaughtException? cause]) = ValueIsPositive;

  @Implements<ThrowableException>()
  const factory IntegerNegativeFailure.leadingZeroException(
      [@Default('Exception') String message,
      CaughtException? cause]) = LeadingZeroException;
}
