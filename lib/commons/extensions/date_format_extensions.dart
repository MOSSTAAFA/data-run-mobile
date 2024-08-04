import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

extension DateFormatExtension on DateFormat {
  DateTime? parseOrNull(String value) {
    try {
      return parse(value);
    } catch (e) {
      debugPrint('DateFormatExtension: dateTime FormatException');
      return null;
    }
  }
}
