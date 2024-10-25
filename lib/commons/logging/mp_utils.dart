
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/commons/logging/mp_main.dart';

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
        required LogLevel level
      }) {
    Mp.log('$prefix $value $info'.trim(), isError: isError, level: level);
  }
}