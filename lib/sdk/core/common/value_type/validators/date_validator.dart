import 'package:mass_pro/sdk/core/common/value_type/failures/date_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';
import 'package:mass_pro/sdk/core/mp/helpers/result.dart';

class DateValidator extends ValueTypeValidator<DateFailure> {
  const DateValidator();

  static const String DATE_PATTERN =
      r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$';


  @override
  Result<String, DateFailure> validate(String value) {
    if (RegExp(DATE_PATTERN).hasMatch(value)) {
      return Result.success(value);
    } else {
      return Result.failure(const DateFailure.parseException());
    }
  }
}
