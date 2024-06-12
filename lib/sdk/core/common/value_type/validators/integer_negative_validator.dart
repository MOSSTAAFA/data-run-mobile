import 'package:mass_pro/sdk/core/common/value_type/failures/integer_negative_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/integer_validator_base.dart';

import '../../../mp/helpers/result.dart';

class IntegerNegativeValidator
    extends IntegerValidatorBase<IntegerNegativeFailure> {
  const IntegerNegativeValidator();

  @override
  IntegerNegativeFailure get formatFailure =>
      const IntegerNegativeFailure.numberFormatException();

  @override
  IntegerNegativeFailure get leadingZeroException =>
      const IntegerNegativeFailure.leadingZeroException();

  @override
  IntegerNegativeFailure get overflowFailure =>
      const IntegerNegativeFailure.integerOverflow();

  @override
  Result<String, IntegerNegativeFailure> validateInteger(String value) {
    int convertedValue = int.parse(value);
    if (convertedValue == 0) {
      // Failure
      return Result.failure(const IntegerNegativeFailure.valueIsZero());
    } else if (convertedValue > 0) {
      return Result.failure(const IntegerNegativeFailure.valueIsPositive());
    } else {
      // Success
      return Result.success(value);
    }
  }
}
