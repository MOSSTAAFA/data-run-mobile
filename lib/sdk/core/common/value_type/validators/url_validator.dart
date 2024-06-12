import 'package:mass_pro/sdk/core/common/value_type/failures/url_failure.dart';
import 'package:mass_pro/sdk/core/common/value_type/validators/value_type_validator.dart';

import '../../../mp/helpers/result.dart';

class UrlValidator extends ValueTypeValidator<UrlFailure> {
  const UrlValidator();

  static const String URL_PATTERN =
      r'^(http|https):\/\/[a-z0-9]+([-.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?$';

  @override
  Result<String, UrlFailure> validate(String value) {
    if (RegExp(URL_PATTERN).hasMatch(value)) {
      return Result.success(value);
    } else {
      return Result.failure(const UrlFailure.malformedUrlException());
    }
  }
}
