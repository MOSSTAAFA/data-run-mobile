import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:mass_pro/commons/logging/logging.dart';

extension DateFormatExtension on DateFormat {
  DateTime? parseOrNull(String value) {
    try {
      return parse(value);
    } catch (e) {
      logError(info: 'DateFormatExtension: dateTime FormatException');
      return null;
    }
  }
}
