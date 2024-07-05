import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/validation_exception.dart';

part 'percentage_failure.freezed.dart';

@freezed
class PercentageFailure with _$PercentageFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory PercentageFailure.numberFormatException(
      [@Default('ValidationException') String message]) = NumberFormatException;

  @Implements<ValidationException>()
  const factory PercentageFailure.valueGreaterThan100(
      [@Default('ValidationException') String message]) = ValueGreaterThan100;

  @Implements<ValidationException>()
  const factory PercentageFailure.valueIsNegative(
      [@Default('ValidationException') String message]) = ValueIsNegative;
}
