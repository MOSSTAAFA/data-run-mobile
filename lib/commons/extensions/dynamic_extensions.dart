
import '../logging/mp_utils.dart';

extension IsNullDynamicExtension on dynamic {
  void isNull<T>(T? value, String message) {
    if (value == null) {
      throw Exception(message);
    }
  }

  void logError(
          {String info = '', Function logFunction = MpUtils.printFunction}) =>
      // ignore: unnecessary_this
      logFunction('Error: ${this.runtimeType}', this, info, isError: true);

  void logInfo(
          {String info = '', Function printFunction = MpUtils.printFunction}) =>
      // ignore: unnecessary_this
      printFunction('Info: ${this.runtimeType}', this, info);
}
