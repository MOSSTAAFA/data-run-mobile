import 'package:mass_pro/sdk/core/common/value_type/failures/number_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/number_validator_base.dart';

import '../../../mp/helpers/result.dart';

class NumberValidator extends NumberValidatorBase<NumberFailure> {
  const NumberValidator();

  static const String STARTS_WITH_DOT = r'^\.\d*';

  static const String SCIENTIFIC_NOTATION_PATTERN =
      r'[+\-]?(?:0|[1-9]\d*)(?:\.\d*)?(?:[eE][+\-]?\d+)';

  @override
  NumberFailure get formatFailure =>
      const NumberFailure.numberFormatException();

  @override
  NumberFailure get leadingZeroException =>
      const NumberFailure.leadingZeroException();

  @override
  Result<String, NumberFailure> internalValidate(String value) {
    double.parse(value);
    if (RegExp(SCIENTIFIC_NOTATION_PATTERN).hasMatch(value)) {
      // Failure
      return Result.failure(const NumberFailure.scientificNotationException());
    } else if (RegExp(STARTS_WITH_DOT).hasMatch(value)) {
      return Result.failure(formatFailure);
    } else {
      // Success
      return Result.success(value);
    }
  }
}
