import 'package:mass_pro/sdk/core/common/value_type/failures/coordinate_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import '../../../mp/helpers/result.dart';

class CoordinateValidator extends ValueTypeValidator<CoordinateFailure> {
  const CoordinateValidator();

  static const String COORDINATE_PATTERN =
      r'^\\[[-+]?(180(\\.0+)?|((1[0-7]\\d)|([1-9]?\\d))(\\.\\d+)?),\\s*[-+]?([1-8]?\\d(\\.\\d+)?|90(\\.0+)?)]\$';

  @override
  Result<String, CoordinateFailure> validate(String value) {
    if (RegExp(COORDINATE_PATTERN).hasMatch(value)) {
      return Result.success(value);
    } else {
      return Result.failure(
          const CoordinateFailure.coordinateMalformedException());
    }
  }
}
