import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'boolean_failure.freezed.dart';

@freezed
class BooleanFailure with _$BooleanFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory BooleanFailure.oneIsNotTrueException(
      [@Default('Exception') String message,
      CaughtException? cause]) = OneIsNotTrueException;

  @Implements<ThrowableException>()
  const factory BooleanFailure.zeroIsNotFalseException(
      [@Default('Exception') String message,
      CaughtException? cause]) = ZeroIsNotFalseException;

  @Implements<ThrowableException>()
  const factory BooleanFailure.booleanMalformedException(
      [@Default('Exception') String message,
      CaughtException? cause]) = BooleanMalformedException;
}
