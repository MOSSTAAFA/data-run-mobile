import 'package:mass_pro/sdk/core/common/value_type/failures/integer_zero_or_positive_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/integer_validator_base.dart';

import '../../../mp/helpers/result.dart';

class IntegerZeroOrPositiveValidator
    extends IntegerValidatorBase<IntegerZeroOrPositiveFailure> {
  const IntegerZeroOrPositiveValidator();

  @override
  IntegerZeroOrPositiveFailure get formatFailure =>
      const IntegerZeroOrPositiveFailure.numberFormatException();

  @override
  IntegerZeroOrPositiveFailure get leadingZeroException =>
      const IntegerZeroOrPositiveFailure.leadingZeroException();

  @override
  IntegerZeroOrPositiveFailure get overflowFailure =>
      const IntegerZeroOrPositiveFailure.integerOverflow();

  @override
  Result<String, IntegerZeroOrPositiveFailure> validateInteger(String value) {
    final int convertedValue = int.parse(value);
    if (convertedValue < 0) {
      // Failure
      return Result.failure(
          const IntegerZeroOrPositiveFailure.valueIsNegative());
    } else {
      // Success
      return Result.success(value);
    }
  }
}
