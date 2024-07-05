import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/validation_exception.dart';

part 'date_time_failure.freezed.dart';

@freezed
class DateTimeFailure with _$DateTimeFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory DateTimeFailure.parseException(
      [@Default('ValidationException') String message]) = ParseException;
}
