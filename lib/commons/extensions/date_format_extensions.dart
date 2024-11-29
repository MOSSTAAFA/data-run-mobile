import 'package:datarun/commons/logging/new_app_logging.dart';
import 'package:intl/intl.dart';

extension DateFormatExtension on DateFormat {
  DateTime? parseOrNull(String value) {
    try {
      return parse(value);
    } catch (e) {
      logError('DateFormatExtension: dateTime FormatException');
      return null;
    }
  }
}
