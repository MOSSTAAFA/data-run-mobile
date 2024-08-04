import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';

part 'number_failure.freezed.dart';

@freezed
class NumberFailure with _$NumberFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory NumberFailure.scientificNotationException(
      [@Default('ValidationException') String message]) = ScientificNotationException;

  @Implements<ValidationException>()
  const factory NumberFailure.numberFormatException(
      [@Default('ValidationException') String message]) = NumberFormatException;

  @Implements<ValidationException>()
  const factory NumberFailure.leadingZeroException(
      [@Default('ValidationException') String message]) = LeadingZeroException;
}
