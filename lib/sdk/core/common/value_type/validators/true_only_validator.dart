import 'package:mass_pro/sdk/core/common/value_type/failures/true_only_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import '../../../mp/helpers/result.dart';

class TrueOnlyValidator extends ValueTypeValidator<TrueOnlyFailure> {
  const TrueOnlyValidator();

  @override
  Result<String, TrueOnlyFailure> validate(String value) {
    if (value == 'false') {
      return Result.failure(
          const TrueOnlyFailure.falseIsNotAValidValueException());
    } else if (value == '1') {
      return Result.failure(const TrueOnlyFailure.oneIsNotTrueException());
    } else if (value == 'true') {
      return Result.success(value);
    } else {
      return Result.failure(const TrueOnlyFailure.booleanMalformedException());
    }
  }
}
