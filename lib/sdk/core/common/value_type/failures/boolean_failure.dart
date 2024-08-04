import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';

part 'boolean_failure.freezed.dart';

@freezed
class BooleanFailure with _$BooleanFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory BooleanFailure.oneIsNotTrueException(
      [@Default('ValidationException') String message]) = OneIsNotTrueException;

  @Implements<ValidationException>()
  const factory BooleanFailure.zeroIsNotFalseException(
      [@Default('ValidationException') String message]) = ZeroIsNotFalseException;

  @Implements<ValidationException>()
  const factory BooleanFailure.booleanMalformedException(
      [@Default('ValidationException') String message]) = BooleanMalformedException;
}
