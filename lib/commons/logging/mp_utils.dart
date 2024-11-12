
import 'package:datarun/commons/logging/logging.dart';
import 'package:datarun/commons/logging/mp_main.dart';

// typedef PrintFunctionCallback = void Function(
//     String prefix,
//     dynamic value,
//     String info, {
//     bool? isError,
//     });
typedef PrintFunctionCallback = void Function(
    String message, // Updated to message
        {String info,
    bool isError,
    required LogLevel level});

class MpUtils {
  MpUtils._();

  static void printFunction(
      {required String message,
        String info = '',
        bool isError = false,
        required LogLevel level}) {
    Mp.log('$message $info'.trim(), isError: isError, level: level);
  }
}
//
// class MpUtils {
//   MpUtils._();
//
//   static void printFunction(
//       message,
//       String info, {
//         bool isError = false,
//         required LogLevel level
//       }) {
//     Mp.log('$info'.trim(), isError: isError, level: level);
//   }
// }