import 'package:flutter/material.dart';

Widget getErrorWidget(Object error, StackTrace? stackTrace) {
  debugPrint('error: $error');
  debugPrintStack(stackTrace: stackTrace, label: error.toString());
  return ErrorWidget(error);
}
