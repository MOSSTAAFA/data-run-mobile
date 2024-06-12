import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'integer_zero_or_positive_failure.freezed.dart';

@freezed
class IntegerZeroOrPositiveFailure
    with _$IntegerZeroOrPositiveFailure
    implements ThrowableException {
  @Implements<ThrowableException>()
  const factory IntegerZeroOrPositiveFailure.numberFormatException(
      [@Default('Exception') String message,
      CaughtException? cause]) = NumberFormatException;

  @Implements<ThrowableException>()
  const factory IntegerZeroOrPositiveFailure.integerOverflow(
      [@Default('Exception') String message,
      CaughtException? cause]) = IntegerOverflow;

  @Implements<ThrowableException>()
  const factory IntegerZeroOrPositiveFailure.valueIsNegative(
      [@Default('Exception') String message,
      CaughtException? cause]) = ValueIsNegative;

  @Implements<ThrowableException>()
  const factory IntegerZeroOrPositiveFailure.leadingZeroException(
      [@Default('Exception') String message,
      CaughtException? cause]) = LeadingZeroException;
}
