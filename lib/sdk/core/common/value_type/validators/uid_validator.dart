import 'package:mass_pro/sdk/core/common/value_type/failures/uid_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import '../../../mp/helpers/result.dart';

class UidValidator extends ValueTypeValidator<UidFailure> {
  const UidValidator();

  static const String UID_PATTERN = r'^[a-zA-Z0-9]{11}$';

  static const int NUMBER_OF_UID_CHARS = 11;

  @override
  Result<String, UidFailure> validate(String value) {
    if (RegExp(UID_PATTERN).hasMatch(value)) {
      return Result.success(value);
    } else if (value.length < NUMBER_OF_UID_CHARS) {
      return Result.failure(const UidFailure.lessThanElevenCharsException());
    } else if (value.length > NUMBER_OF_UID_CHARS) {
      return Result.failure(const UidFailure.moreThanElevenCharsException());
    } else {
      return Result.failure(const UidFailure.malformedUidException());
    }
  }
}
