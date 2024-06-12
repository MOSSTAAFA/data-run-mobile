import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'number_failure.freezed.dart';

@freezed
class NumberFailure with _$NumberFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory NumberFailure.scientificNotationException(
      [@Default('Exception') String message,
      CaughtException? cause]) = ScientificNotationException;

  @Implements<ThrowableException>()
  const factory NumberFailure.numberFormatException(
      [@Default('Exception') String message,
      CaughtException? cause]) = NumberFormatException;

  @Implements<ThrowableException>()
  const factory NumberFailure.leadingZeroException(
      [@Default('Exception') String message,
      CaughtException? cause]) = LeadingZeroException;
}
