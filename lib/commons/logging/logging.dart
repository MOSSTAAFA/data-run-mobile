import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

typedef PrintFunctionCallback = void Function(
    String message, // Updated to message
    {String info,
    bool isError,
    required LogLevel level});

abstract class MpInterface {
  bool isLogEnable = kDebugMode;
  LogWriterCallback log = defaultLogWriterCallback;
}

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

class _MpImpl extends MpInterface {}

// ignore: non_constant_identifier_names
final _MpImpl Mp = _MpImpl();

///VoidCallback from logs
typedef LogWriterCallback = void Function(String text,
    {bool isError, required LogLevel level});

enum LogLevel { debug, info, error }

/// default logger from GetX
void defaultLogWriterCallback(String message,
    {bool isError = false, required LogLevel level}) {
  if (level == LogLevel.error || Mp.isLogEnable) {
    developer.log(message,
        name: '',
        level: level.index); // 0 for debug, 1000 for info, 2000 for error
  }
  //
  // if (isError || Mp.isLogEnable) {
  //   developer.log(message, name: '', error: isError ? 'Error' : null);
  // }
}

void logError(
    {String info = '',
    Function logFunction = MpUtils.printFunction,
    Type? runtimeType}) {
  logFunction(
      message: 'Error: ${runtimeType ?? ''} $info',
      isError: true,
      level: LogLevel.error);
}

void logDebug(
    {String info = '',
    Function printFunction = MpUtils.printFunction,
    Type? runtimeType}) {
  assert(() {
    printFunction(
        message: 'Debug: ${runtimeType ?? ''} $info', level: LogLevel.debug);
    return true;
  }());
}

void logInfo(
    {String info = '',
    Function printFunction = MpUtils.printFunction,
    Type? runtimeType}) {
  printFunction(
      message: 'Info: ${runtimeType ?? ''} $info', level: LogLevel.info);
}
