import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'text_failure.freezed.dart';

@freezed
class TextFailure with _$TextFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory TextFailure.tooLargeTextException(
      [@Default('Exception') String message,
      CaughtException? cause]) = TooLargeTextException;
}
