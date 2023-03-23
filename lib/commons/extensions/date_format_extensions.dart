import 'package:intl/intl.dart';

extension DateFormatExtension on DateFormat {
  DateTime? parseOrNull(String value) {
    try {
      return parse(value);
    } catch (e) {
      print('DateFormatExtension: dateTime FormatException');
      return null;
    }
  }
}
