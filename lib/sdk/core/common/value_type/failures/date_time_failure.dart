import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'date_time_failure.freezed.dart';

@freezed
class DateTimeFailure with _$DateTimeFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory DateTimeFailure.parseException(
      [@Default('Exception') String message,
      CaughtException? cause]) = ParseException;
}
