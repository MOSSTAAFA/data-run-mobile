
import '../logging/mp_utils.dart';

extension IsNullDynamicExtension on dynamic {
  void isNull<T>(T? value, String message) {
    if (value == null) {
      throw Exception(message);
    }
  }

  void logError(
          {String info = '', Function logFunction = MpUtils.printFunction,
            Type? runtimeType}) =>
      // ignore: unnecessary_this
      logFunction('Error: ${runtimeType ?? ''}', this, info, isError: true);

  void logInfo(
          {String info = '', Function printFunction = MpUtils.printFunction,
            Type? runtimeType}) =>
      // ignore: unnecessary_this
      printFunction('Info: ${runtimeType ?? ''}', this, info);
}
