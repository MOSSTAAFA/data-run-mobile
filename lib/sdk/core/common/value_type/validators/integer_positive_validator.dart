import 'package:mass_pro/sdk/core/common/value_type/failures/integer_positive_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/integer_validator_base.dart';

import 'package:mass_pro/sdk/core/mp/helpers/result.dart';

class IntegerPositiveValidator
    extends IntegerValidatorBase<IntegerPositiveFailure> {
  const IntegerPositiveValidator();

  @override
  IntegerPositiveFailure get formatFailure =>
      const IntegerPositiveFailure.numberFormatException();

  @override
  IntegerPositiveFailure get leadingZeroException =>
      const IntegerPositiveFailure.leadingZeroException();

  @override
  IntegerPositiveFailure get overflowFailure =>
      const IntegerPositiveFailure.integerOverflow();

  @override
  Result<String, IntegerPositiveFailure> validateInteger(String value) {
    final int convertedValue = int.parse(value);
    if (convertedValue == 0) {
      // Failure
      return Result.failure(const IntegerPositiveFailure.valueIsZero());
    } else if (convertedValue < 0) {
      return Result.failure(const IntegerPositiveFailure.valueIsNegative());
    } else {
      // Success
      return Result.success(value);
    }
  }
}
