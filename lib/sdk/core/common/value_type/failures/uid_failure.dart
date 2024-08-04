import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';

part 'uid_failure.freezed.dart';

@freezed
class UidFailure with _$UidFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory UidFailure.moreThanElevenCharsException(
      [@Default('ValidationException') String message]) = MoreThanElevenCharsException;

  @Implements<ValidationException>()
  const factory UidFailure.lessThanElevenCharsException(
      [@Default('ValidationException') String message]) = LessThanElevenCharsException;

  @Implements<ValidationException>()
  const factory UidFailure.malformedUidException(
      [@Default('ValidationException') String message]) = MalformedUidException;
}
