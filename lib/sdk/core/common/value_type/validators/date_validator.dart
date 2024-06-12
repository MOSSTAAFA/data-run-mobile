import 'package:mass_pro/sdk/core/common/value_type/failures/date_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import '../../../mp/helpers/result.dart';

class DateValidator extends ValueTypeValidator<DateFailure> {
  const DateValidator();

  static const String DATE_PATTERN =
      r'^\d{4}-(0?[1-9]|1[012])-(0?[1-9]|[12][0-9]|3[01])$';

  @override
  Result<String, DateFailure> validate(String value) {
    if (RegExp(DATE_PATTERN).hasMatch(value)) {
      return Result.success(value);
    } else {
      return Result.failure(const DateFailure.parseException());
    }
  }
}
