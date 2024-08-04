import 'package:mass_pro/sdk/core/mp/helpers/result.dart';
import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';

abstract class ValueTypeValidator<T extends ValidationException> {
  const ValueTypeValidator();

  // Right is Failure and left is the Success
  Result<String, T> validate(String value);
// // left is Failure and right is the Success
// Result<T, String> validate(String value);
}
