import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';

part 'url_failure.freezed.dart';

@freezed
class UrlFailure with _$UrlFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory UrlFailure.malformedUrlException(
      [@Default('ValidationException') String message]) = MalformedUrlException;
}
