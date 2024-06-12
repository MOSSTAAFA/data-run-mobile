import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'url_failure.freezed.dart';

@freezed
class UrlFailure with _$UrlFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory UrlFailure.malformedUrlException(
      [@Default('Exception') String message,
      CaughtException? cause]) = MalformedUrlException;
}
