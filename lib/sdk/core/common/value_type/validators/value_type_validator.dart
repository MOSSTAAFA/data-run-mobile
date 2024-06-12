import '../../../mp/helpers/result.dart';
import '../../exception/exception.dart';

abstract class ValueTypeValidator<T extends ThrowableException> {
  const ValueTypeValidator();

  // Right is Failure and right is the Success
  Result<String, T> validate(String value);
// // left is Failure and right is the Success
// Result<T, String> validate(String value);
}
