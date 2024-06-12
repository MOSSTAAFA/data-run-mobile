import 'package:mass_pro/sdk/core/common/exception/exception.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/number_validator_base.dart';

import '../../../mp/helpers/result.dart';

abstract class IntegerValidatorBase<T extends ThrowableException>
    extends NumberValidatorBase<T> {
  const IntegerValidatorBase();

  static const int MAX_VALUE = 2147483647;
  static const int MIN_VALUE = -2147483648;

  @override
  Result<String, T> internalValidate(String value) {
    try {
      return validateInteger(value);
    } on FormatException {
      // Failure
      try {
        int convertedValue = int.parse(value);
        if (convertedValue > MAX_VALUE || convertedValue < MIN_VALUE) {
          return Result.failure(overflowFailure);
        }
        // Failure
        return Result.failure(formatFailure);
      } on FormatException {
        // Failure
        return Result.failure(formatFailure);
      }
    }
  }

  Result<String, T> validateInteger(String value);

  T get overflowFailure;
}
