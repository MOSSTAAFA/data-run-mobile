import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'true_only_failure.freezed.dart';

@freezed
class TrueOnlyFailure with _$TrueOnlyFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory TrueOnlyFailure.oneIsNotTrueException(
      [@Default('Exception') String message,
      CaughtException? cause]) = OneIsNotTrueException;

  @Implements<ThrowableException>()
  const factory TrueOnlyFailure.falseIsNotAValidValueException(
      [@Default('Exception') String message,
      CaughtException? cause]) = FalseIsNotAValidValueException;

  @Implements<ThrowableException>()
  const factory TrueOnlyFailure.booleanMalformedException(
      [@Default('Exception') String message,
      CaughtException? cause]) = BooleanMalformedException;
}
