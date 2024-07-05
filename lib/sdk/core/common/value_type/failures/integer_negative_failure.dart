import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/validation_exception.dart';

part 'integer_negative_failure.freezed.dart';

@freezed
class IntegerNegativeFailure
    with _$IntegerNegativeFailure
    implements ValidationException {
  @Implements<ValidationException>()
  const factory IntegerNegativeFailure.numberFormatException(
      [@Default('ValidationException') String message]) = NumberFormatException;

  @Implements<ValidationException>()
  const factory IntegerNegativeFailure.integerOverflow(
      [@Default('ValidationException') String message]) = IntegerOverflow;

  @Implements<ValidationException>()
  const factory IntegerNegativeFailure.valueIsZero(
      [@Default('ValidationException') String message]) = ValueIsZero;

  @Implements<ValidationException>()
  const factory IntegerNegativeFailure.valueIsPositive(
      [@Default('ValidationException') String message]) = ValueIsPositive;

  @Implements<ValidationException>()
  const factory IntegerNegativeFailure.leadingZeroException(
      [@Default('ValidationException') String message]) = LeadingZeroException;
}
