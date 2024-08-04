import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';

part 'unit_interval_failure.freezed.dart';

@freezed
class UnitIntervalFailure
    with _$UnitIntervalFailure
    implements ValidationException {
  @Implements<ValidationException>()
  const factory UnitIntervalFailure.scientificNotationException(
      [@Default('ValidationException') String message]) = ScientificNotationException;

  @Implements<ValidationException>()
  const factory UnitIntervalFailure.numberFormatException(
      [@Default('ValidationException') String message]) = NumberFormatException;

  @Implements<ValidationException>()
  const factory UnitIntervalFailure.greaterThanOneException(
      [@Default('ValidationException') String message]) = GreaterThanOneException;

  @Implements<ValidationException>()
  const factory UnitIntervalFailure.smallerThanZeroException(
      [@Default('ValidationException') String message]) = SmallerThanZeroException;
}
