import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/validation_exception.dart';

part 'time_failure.freezed.dart';

@freezed
class TimeFailure with _$TimeFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory TimeFailure.parseException(
      [@Default('ValidationException') String message]) = ParseException;
}
