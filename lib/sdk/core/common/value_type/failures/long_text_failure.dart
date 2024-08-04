import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';

abstract class LongTextFailure implements ValidationException {
  // Long texts do not need validation and cannot produce errors
}
