
import 'mp_main.dart';

typedef PrintFunctionCallback = void Function(
    String prefix,
    dynamic value,
    String info, {
    bool? isError,
    });

class MpUtils {
  MpUtils._();

  static void printFunction(
      String prefix,
      dynamic value,
      String info, {
        bool isError = false,
      }) {
    Mp.log('$prefix $value $info'.trim(), isError: isError);
  }
}