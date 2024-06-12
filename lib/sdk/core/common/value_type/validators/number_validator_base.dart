import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import '../../../mp/helpers/result.dart';
import '../../exception/exception.dart';

abstract class NumberValidatorBase<T extends ThrowableException>
    extends ValueTypeValidator<T> {
  const NumberValidatorBase();

  static const String HAS_LEADING_ZERO_REGEX = r'^[+\\-]?(0+[0-9]).*$';

  @override
  Result<String, T> validate(String value) {
    try {
      if (RegExp(HAS_LEADING_ZERO_REGEX).hasMatch(value)) {
        // Failure
        return Result.failure(leadingZeroException);
      } else {
        return internalValidate(value);
      }
    } on FormatException {
      // Failure
      return Result.failure(formatFailure);
    }
  }

  T get leadingZeroException;

  T get formatFailure;

  Result<String, T> internalValidate(String value);
}
