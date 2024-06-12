import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'unit_interval_failure.freezed.dart';

@freezed
class UnitIntervalFailure
    with _$UnitIntervalFailure
    implements ThrowableException {
  @Implements<ThrowableException>()
  const factory UnitIntervalFailure.scientificNotationException(
      [@Default('Exception') String message,
      CaughtException? cause]) = ScientificNotationException;

  @Implements<ThrowableException>()
  const factory UnitIntervalFailure.numberFormatException(
      [@Default('Exception') String message,
      CaughtException? cause]) = NumberFormatException;

  @Implements<ThrowableException>()
  const factory UnitIntervalFailure.greaterThanOneException(
      [@Default('Exception') String message,
      CaughtException? cause]) = GreaterThanOneException;

  @Implements<ThrowableException>()
  const factory UnitIntervalFailure.smallerThanZeroException(
      [@Default('Exception') String message,
      CaughtException? cause]) = SmallerThanZeroException;
}
