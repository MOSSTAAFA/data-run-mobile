import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'email_failure.freezed.dart';

@freezed
class EmailFailure with _$EmailFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory EmailFailure.malformedEmailException(
      [@Default('Exception') String message,
      CaughtException? cause]) = MalformedEmailException;
}
