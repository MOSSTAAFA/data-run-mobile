import 'package:mass_pro/sdk/core/common/value_type/failures/percentage_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import '../../../mp/helpers/result.dart';

class PercentageValidator extends ValueTypeValidator<PercentageFailure> {
  const PercentageValidator();

  static const int ONE_HUNDRED_PERCENT = 100;
  static const int ZERO_PERCENT = 0;

  @override
  Result<String, PercentageFailure> validate(String value) {
    try {
      final int convertedValue = int.parse(value);
      if (convertedValue > ONE_HUNDRED_PERCENT) {
        // Failure
        return Result.failure(const PercentageFailure.valueGreaterThan100());
      } else if (convertedValue < ZERO_PERCENT) {
        // Failure
        return Result.failure(const PercentageFailure.valueIsNegative());
      } else {
        // Success
        return Result.success(value);
      }
    } on FormatException {
      // Failure
      return Result.failure(const PercentageFailure.numberFormatException());
    }
  }
}
