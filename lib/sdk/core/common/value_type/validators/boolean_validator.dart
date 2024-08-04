import 'package:mass_pro/sdk/core/common/value_type/failures/boolean_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

// import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import 'package:mass_pro/sdk/core/mp/helpers/result.dart';

class BooleanValidator extends ValueTypeValidator<BooleanFailure> {
  const BooleanValidator();

  @override
  Result<String, BooleanFailure> validate(String value) {
    if (value == '0') {
      return Result.failure(const BooleanFailure.zeroIsNotFalseException());
    } else if (value == '1') {
      return Result.failure(const BooleanFailure.oneIsNotTrueException());
    } else if (value == 'true' || value == 'false') {
      return Result.success(value);
    } else {
      return Result.failure(const BooleanFailure.booleanMalformedException());
    }
  }
}
