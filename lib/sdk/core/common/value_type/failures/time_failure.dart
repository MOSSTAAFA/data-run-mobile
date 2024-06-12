import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'time_failure.freezed.dart';

@freezed
class TimeFailure with _$TimeFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory TimeFailure.parseException(
      [@Default('Exception') String message,
      CaughtException? cause]) = ParseException;
}
