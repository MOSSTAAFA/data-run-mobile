import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/exception.dart';

part 'integer_failure.freezed.dart';

@freezed
class IntegerFailure with _$IntegerFailure implements ThrowableException {
  @Implements<ThrowableException>()
  const factory IntegerFailure.numberFormatException(
      [@Default('Exception') String message,
      CaughtException? cause]) = NumberFormatException;

  @Implements<ThrowableException>()
  const factory IntegerFailure.integerOverflow(
      [@Default('Exception') String message,
      CaughtException? cause]) = IntegerOverflow;

  @Implements<ThrowableException>()
  const factory IntegerFailure.leadingZeroException(
      [@Default('Exception') String message,
      CaughtException? cause]) = LeadingZeroException;
}
