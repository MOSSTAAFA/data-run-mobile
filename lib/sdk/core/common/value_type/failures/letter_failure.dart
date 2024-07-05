import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/validation_exception.dart';

part 'letter_failure.freezed.dart';

@freezed
class LetterFailure with _$LetterFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory LetterFailure.stringIsNotALetterException(
      [@Default('ValidationException') String message]) = StringIsNotALetterException;

  @Implements<ValidationException>()
  const factory LetterFailure.moreThanOneLetterException(
      [@Default('ValidationException') String message]) = MoreThanOneLetterException;

  @Implements<ValidationException>()
  const factory LetterFailure.emptyStringException(
      [@Default('ValidationException') String message]) = EmptyStringException;
}
