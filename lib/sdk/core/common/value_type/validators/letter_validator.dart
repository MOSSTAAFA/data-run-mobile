import 'package:mass_pro/sdk/core/common/value_type/failures/letter_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import 'package:mass_pro/sdk/core/mp/helpers/result.dart';

class LetterValidator extends ValueTypeValidator<LetterFailure> {
  const LetterValidator();

  static const String LETTER_PATTERN = r'[a-zA-Z]';

  @override
  Result<String, LetterFailure> validate(String value) {
    if (value.isEmpty) {
      return Result.failure(const LetterFailure.emptyStringException());
    } else if (value.length > 1) {
      return Result.failure(const LetterFailure.moreThanOneLetterException());
    } else if (RegExp(LETTER_PATTERN).hasMatch(value)) {
      return Result.success(value);
    } else {
      return Result.failure(const LetterFailure.stringIsNotALetterException());
    }
  }
}
