import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';

part 'text_failure.freezed.dart';

@freezed
class TextFailure with _$TextFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory TextFailure.tooLargeTextException(
      [@Default('ValidationException') String message]) = TooLargeTextException;
}
