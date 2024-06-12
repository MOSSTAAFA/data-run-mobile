import '../../exception/exception.dart';

abstract class LongTextFailure implements ThrowableException {
  // Long texts do not need validation and cannot produce errors
}
