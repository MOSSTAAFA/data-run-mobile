import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';

part 'date_failure.freezed.dart';

@freezed
class DateFailure with _$DateFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory DateFailure.parseException(
      [@Default('ValidationException') String message]) = ParseException;
}
