import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'letter_failure.freezed.dart';

@freezed
class LetterFailure with _$LetterFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory LetterFailure.stringIsNotALetterException(
      [@Default('Exception') String message,
      CaughtException? cause]) = StringIsNotALetterException;

  @Implements<ThrowableException>()
  const factory LetterFailure.moreThanOneLetterException(
      [@Default('Exception') String message,
      CaughtException? cause]) = MoreThanOneLetterException;

  @Implements<ThrowableException>()
  const factory LetterFailure.emptyStringException(
      [@Default('Exception') String message,
      CaughtException? cause]) = EmptyStringException;
}
