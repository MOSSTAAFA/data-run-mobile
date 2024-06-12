import 'package:mass_pro/sdk/core/common/value_type/failures/date_time_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import '../../../mp/helpers/result.dart';

class DateTimeValidator extends ValueTypeValidator<DateTimeFailure> {
  const DateTimeValidator();

  static const String DATE_TIME_PATTERN =
      r'^(\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01]))T(([0-1]?[0-9]|2[0-3]):[0-5][0-9])$';

  @override
  Result<String, DateTimeFailure> validate(String value) {
    if (RegExp(DATE_TIME_PATTERN).hasMatch(value)) {
      return Result.success(value);
    } else {
      return Result.failure(const DateTimeFailure.parseException());
    }
  }
}
