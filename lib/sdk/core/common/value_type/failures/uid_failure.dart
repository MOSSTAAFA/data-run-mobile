import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'uid_failure.freezed.dart';

@freezed
class UidFailure with _$UidFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory UidFailure.moreThanElevenCharsException(
      [@Default('Exception') String message,
      CaughtException? cause]) = MoreThanElevenCharsException;

  @Implements<ThrowableException>()
  const factory UidFailure.lessThanElevenCharsException(
      [@Default('Exception') String message,
      CaughtException? cause]) = LessThanElevenCharsException;

  @Implements<ThrowableException>()
  const factory UidFailure.malformedUidException(
      [@Default('Exception') String message,
      CaughtException? cause]) = MalformedUidException;
}
