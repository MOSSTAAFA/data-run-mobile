import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/validation_exception.dart';

part 'true_only_failure.freezed.dart';

@freezed
class TrueOnlyFailure with _$TrueOnlyFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory TrueOnlyFailure.oneIsNotTrueException(
      [@Default('ValidationException') String message]) = OneIsNotTrueException;

  @Implements<ValidationException>()
  const factory TrueOnlyFailure.falseIsNotAValidValueException(
      [@Default('ValidationException') String message]) = FalseIsNotAValidValueException;

  @Implements<ValidationException>()
  const factory TrueOnlyFailure.booleanMalformedException(
      [@Default('ValidationException') String message]) = BooleanMalformedException;
}
