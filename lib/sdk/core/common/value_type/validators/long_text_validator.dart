import 'package:mass_pro/sdk/core/common/value_type/failures/long_text_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import 'package:mass_pro/sdk/core/mp/helpers/result.dart';

class LongTextValidator extends ValueTypeValidator<LongTextFailure> {
  const LongTextValidator();

  @override
  Result<String, LongTextFailure> validate(String value) {
    return Result.success(value);
  }
}
