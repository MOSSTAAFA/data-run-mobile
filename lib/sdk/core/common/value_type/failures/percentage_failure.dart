import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'percentage_failure.freezed.dart';

@freezed
class PercentageFailure with _$PercentageFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory PercentageFailure.numberFormatException(
      [@Default('Exception') String message,
      CaughtException? cause]) = NumberFormatException;

  @Implements<ThrowableException>()
  const factory PercentageFailure.valueGreaterThan100(
      [@Default('Exception') String message,
      CaughtException? cause]) = ValueGreaterThan100;

  @Implements<ThrowableException>()
  const factory PercentageFailure.valueIsNegative(
      [@Default('Exception') String message,
      CaughtException? cause]) = ValueIsNegative;
}
