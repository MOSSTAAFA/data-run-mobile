import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/validation_exception.dart';

part 'integer_positive_failure.freezed.dart';

@freezed
class IntegerPositiveFailure
    with _$IntegerPositiveFailure
    implements ValidationException {
  @Implements<ValidationException>()
  const factory IntegerPositiveFailure.numberFormatException(
      [@Default('ValidationException') String message]) = NumberFormatException;

  @Implements<ValidationException>()
  const factory IntegerPositiveFailure.integerOverflow(
      [@Default('ValidationException') String message]) = IntegerOverflow;

  @Implements<ValidationException>()
  const factory IntegerPositiveFailure.valueIsZero(
      [@Default('ValidationException') String message]) = ValueIsZero;

  @Implements<ValidationException>()
  const factory IntegerPositiveFailure.valueIsNegative(
      [@Default('ValidationException') String message]) = ValueIsNegative;

  @Implements<ValidationException>()
  const factory IntegerPositiveFailure.leadingZeroException(
      [@Default('ValidationException') String message]) = LeadingZeroException;
}
