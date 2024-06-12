import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'date_failure.freezed.dart';

@freezed
class DateFailure with _$DateFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory DateFailure.parseException(
      [@Default('Exception') String message,
      CaughtException? cause]) = ParseException;
}
