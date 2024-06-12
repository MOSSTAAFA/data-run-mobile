import 'package:mass_pro/sdk/core/common/value_type/failures/email_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import '../../../mp/helpers/result.dart';

class EmailValidator extends ValueTypeValidator<EmailFailure> {
  const EmailValidator();

  static const String EMAIL_PATTERN =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Result<String, EmailFailure> validate(String value) {
    if (RegExp(EMAIL_PATTERN).hasMatch(value)) {
      return Result.success(value);
    } else {
      return Result.failure(const EmailFailure.malformedEmailException());
    }
  }
}
