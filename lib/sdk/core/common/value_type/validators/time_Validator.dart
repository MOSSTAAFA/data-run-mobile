import 'package:mass_pro/sdk/core/common/value_type/failures/time_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import '../../../mp/helpers/result.dart';

class TimeValidator extends ValueTypeValidator<TimeFailure> {
  const TimeValidator();

  static const String TIME_PATTERN = r'^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$';

  @override
  Result<String, TimeFailure> validate(String value) {
    if (RegExp(TIME_PATTERN).hasMatch(value)) {
      return Result.success(value);
    } else {
      return Result.failure(const TimeFailure.parseException());
    }
  }
}
