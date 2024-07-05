import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/validation_exception.dart';

part 'integer_zero_or_positive_failure.freezed.dart';

@freezed
class IntegerZeroOrPositiveFailure
    with _$IntegerZeroOrPositiveFailure
    implements ValidationException {
  @Implements<ValidationException>()
  const factory IntegerZeroOrPositiveFailure.numberFormatException(
      [@Default('ValidationException') String message]) = NumberFormatException;

  @Implements<ValidationException>()
  const factory IntegerZeroOrPositiveFailure.integerOverflow(
      [@Default('ValidationException') String message]) = IntegerOverflow;

  @Implements<ValidationException>()
  const factory IntegerZeroOrPositiveFailure.valueIsNegative(
      [@Default('ValidationException') String message]) = ValueIsNegative;

  @Implements<ValidationException>()
  const factory IntegerZeroOrPositiveFailure.leadingZeroException(
      [@Default('ValidationException') String message]) = LeadingZeroException;
}
