import 'package:mass_pro/sdk/core/common/value_type/failures/unit_interval_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/number_validator.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import '../../../mp/helpers/result.dart';

class UnitIntervalValidator extends ValueTypeValidator<UnitIntervalFailure> {
  const UnitIntervalValidator();

  @override
  Result<String, UnitIntervalFailure> validate(String value) {
    double convertedValue = double.parse(value);

    if (RegExp(NumberValidator.SCIENTIFIC_NOTATION_PATTERN).hasMatch(value)) {
      return Result.failure(
          const UnitIntervalFailure.scientificNotationException());
    } else if (convertedValue > 1) {
      return Result.failure(
          const UnitIntervalFailure.greaterThanOneException());
    } else if (convertedValue < 0) {
      return Result.failure(
          const UnitIntervalFailure.smallerThanZeroException());
    } else {
      return Result.success(value);
    }
  }
}
