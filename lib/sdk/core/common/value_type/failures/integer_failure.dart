import 'package:freezed_annotation/freezed_annotation.dart';

import '../../exception/validation_exception.dart';

part 'integer_failure.freezed.dart';

@freezed
class IntegerFailure with _$IntegerFailure implements ValidationException {
  @Implements<ValidationException>()
  const factory IntegerFailure.numberFormatException(
      [@Default('ValidationException') String message]) = NumberFormatException;

  @Implements<ValidationException>()
  const factory IntegerFailure.integerOverflow(
      [@Default('ValidationException') String message]) = IntegerOverflow;

  @Implements<ValidationException>()
  const factory IntegerFailure.leadingZeroException(
      [@Default('ValidationException') String message]) = LeadingZeroException;
}
