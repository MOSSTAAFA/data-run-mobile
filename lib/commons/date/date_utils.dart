import 'package:intl/intl.dart';

class DateUtils {
  static const String DATABASE_FORMAT_EXPRESSION =
      "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

  static const String DATABASE_FORMAT_EXPRESSION_No_Zone =
      "yyyy-MM-dd'T'HH:mm:ss.SSS";
  static const String DATABASE_FORMAT_EXPRESSION_NO_MILLIS =
      "yyyy-MM-dd'T'HH:mm:ss";
  static const String DATABASE_FORMAT_EXPRESSION_NO_SECONDS =
      "yyyy-MM-dd'T'HH:mm";
  static const String DATE_TIME_FORMAT_EXPRESSION = 'yyyy-MM-dd HH:mm';
  static const String DATE_FORMAT_EXPRESSION = 'yyyy-MM-dd';
  static const String WEEKLY_FORMAT_EXPRESSION = 'w yyyy';
  static const String MONTHLY_FORMAT_EXPRESSION = 'MMM yyyy';
  static const String YEARLY_FORMAT_EXPRESSION = 'yyyy';
  static const String SIMPLE_DATE_FORMAT = 'd/M/yyyy';
  static const String TIME_12H_EXPRESSION = 'hh:mm a';

  static DateFormat uiDateFormat() {
    // return DateFormat(SIMPLE_DATE_FORMAT, 'en_US');
    return DateFormat(DATE_FORMAT_EXPRESSION, 'en_US');
  }

  static DateFormat oldUiDateFormat() {
    return DateFormat(DATE_FORMAT_EXPRESSION, 'en_US');
  }

  static DateFormat timeFormat() {
    return DateFormat('HH:mm', 'en_US');
  }

  static DateFormat dateTimeFormat() {
    return DateFormat(DATE_TIME_FORMAT_EXPRESSION, 'en_US');
  }

  static DateFormat databaseDateFormat() {
    return DateFormat(DATABASE_FORMAT_EXPRESSION, 'en_US');
  }

  static DateFormat databaseDateFormatNoZone() {
    return DateFormat(DATABASE_FORMAT_EXPRESSION_No_Zone, 'en_US');
  }

  static DateFormat databaseDateFormatNoMillis() {
    return DateFormat(DATABASE_FORMAT_EXPRESSION_NO_MILLIS, 'en_US');
  }

  static DateFormat databaseDateFormatNoSeconds() {
    return DateFormat(DATABASE_FORMAT_EXPRESSION_NO_SECONDS, 'en_US');
  }

  static bool dateHasNoSeconds(String dateTime) {
    try {
      databaseDateFormatNoSeconds().parse(dateTime);
      return true;
    } catch (e) {
      return false;
    }
  }

  static DateFormat twelveHourTimeFormat() {
    return DateFormat(TIME_12H_EXPRESSION, 'en_US');
  }

  /// FORMAT REGION
  String formatDate(DateTime dateToFormat) {
    return uiDateFormat().format(dateToFormat);
  }
}
