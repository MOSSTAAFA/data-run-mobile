import 'package:intl/intl.dart';
import 'package:datarun/commons/logging/logging.dart';

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
