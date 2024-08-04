import 'package:mass_pro/sdk/core/common/value_type/failures/phone_number_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import 'package:mass_pro/sdk/core/mp/helpers/result.dart';

class PhoneNumberValidator extends ValueTypeValidator<PhoneNumberFailure> {
  const PhoneNumberValidator();

  static const String PHONE_PATTERN = r'^[0-9+(][0-9+\-() ]{2,18}[0-9]$';

  @override
  Result<String, PhoneNumberFailure> validate(String value) {
    if (RegExp(PHONE_PATTERN).hasMatch(value)) {
      return Result.success(value);
    } else {
      return Result.failure(
          const PhoneNumberFailure.malformedPhoneNumberException());
    }
  }
}
