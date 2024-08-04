import 'package:mass_pro/sdk/core/common/value_type/failures/text_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import 'package:mass_pro/sdk/core/mp/helpers/result.dart';

class TextValidator extends ValueTypeValidator<TextFailure> {
  const TextValidator();

  static const int MAX_CHARS = 50000;

  @override
  Result<String, TextFailure> validate(String value) {
    if (value.length > MAX_CHARS) {
      return Result.failure(const TextFailure.tooLargeTextException());
    } else {
      return Result.success(value);
    }
  }
}
