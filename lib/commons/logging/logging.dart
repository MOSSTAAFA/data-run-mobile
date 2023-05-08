import 'dart:developer' as developer;

import 'mp_main.dart';

///VoidCallback from logs
typedef LogWriterCallback = void Function(String text, {bool isError});

/// default logger from GetX
void defaultLogWriterCallback(String value, {bool isError = false}) {
  if (isError || Mp.isLogEnable) {
    developer.log(value, name: 'MASSPRO');
  }
}
