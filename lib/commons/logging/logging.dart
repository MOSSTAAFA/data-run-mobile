import 'dart:developer' as developer;

import 'package:mass_pro/commons/logging/mp_main.dart';
import 'package:mass_pro/commons/logging/mp_utils.dart';

///VoidCallback from logs
typedef LogWriterCallback = void Function(String text, {bool isError});

enum LogLevel { info, warning, error, debug }

void defaultLogWriterCallback(String value, {bool isError = false}) {
  if (isError || Mp.isLogEnable) {
    developer.log(value, name: 'D.RUN');
  }
}

void logError(
        {String error = '',
        Function logFunction = MpUtils.printFunction,
        Type? runtimeType}) =>
    // ignore: unnecessary_this
    logFunction('Error: ${runtimeType ?? ''}', '', error, isError: true);

// void log(String message, {LogLevel level = LogLevel.info}) {
//   if (Mp.isLogEnable || level == LogLevel.error) {
//     final prefix = level.toString().toUpperCase();
//     developer.log('$prefix: $message', name: 'D.RUN');
//   }
// }

void logDebug(
        {String info = '',
        Function printFunction = MpUtils.printFunction,
        Type? runtimeType}) =>
    // ignore: unnecessary_this
    printFunction('Info: ${runtimeType ?? ''}', '', info);

void logInfo(
    {String info = '',
      Function printFunction = MpUtils.printFunction,
      Type? runtimeType}) =>
    // ignore: unnecessary_this
printFunction('Info: ${runtimeType ?? ''}', '', info);

void logWarning(
    {String warning = '',
      Function printFunction = MpUtils.printFunction,
      Type? runtimeType}) =>
    // ignore: unnecessary_this
printFunction('Warning: ${runtimeType ?? ''}', '', warning);
