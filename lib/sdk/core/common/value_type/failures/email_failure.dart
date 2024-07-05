import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/validation_exception.dart';

part 'email_failure.freezed.dart';

@freezed
class EmailFailure with _$EmailFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory EmailFailure.malformedEmailException(
      [@Default('ValidationException') String message]) = MalformedEmailException;
}
