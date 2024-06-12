import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'phone_number_failure.freezed.dart';

@freezed
class PhoneNumberFailure
    with _$PhoneNumberFailure
    implements ThrowableException {
  @Implements<ThrowableException>()
  const factory PhoneNumberFailure.malformedPhoneNumberException(
      [@Default('Exception') String message,
      CaughtException? cause]) = MalformedPhoneNumberException;
}
