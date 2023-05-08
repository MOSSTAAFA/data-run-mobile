// Dart imports:
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

enum FormatNumberType {
  percent, // 1,000.00%
  int, // 1,000
  double, // 1,000.00
  inputAmount, // 1000
  duration,
}

double round(double? value, int precision) {
  if (value == null || value.isNaN) {
    return 0;
  }

  final int fac = pow(10, precision) as int;
  double result = value * fac;

  // Workaround for floating point issues:
  // ie. 35 * 1.107 => 38.745
  // ie. .75 * 55.3 => 41.4749999999
  if ('$result'.contains('999999')) {
    result += 0.000001;
  }

  return result.round() / fac;
}

int? parseInt(String value, {bool zeroIsNull = false}) {
  value = value.replaceAll(RegExp(r'[^0-9\.\-]'), '');

  final intValue = int.tryParse(value) ?? 0;

  return (intValue == 0 && zeroIsNull) ? null : intValue;
}

double? parseDouble(String value, {bool zeroIsNull = false}) {
  value = value.replaceAll(RegExp(r'[^0-9\.\-]'), '');

  final doubleValue = double.tryParse(value) ?? 0.0;

  return (doubleValue == 0 && zeroIsNull) ? null : doubleValue;
}

String formatSize(int size) {
  return size > 1000000
      ? '${round(size / 1000000, 1).toInt()} MB'
      : '${round(size / 1000, 0).toInt()} KB';
}

String convertDateTimeToSqlDate([DateTime? date]) {
  date = date ?? DateTime.now();
  return date.toIso8601String().split('T').first;
}

DateTime convertSqlDateToDateTime([String? date]) {
  date = date ?? convertDateTimeToSqlDate();
  final parts = date.split('-');
  return DateTime.utc(
    parseInt(parts[0])!, // ?? 2022,
    parseInt(parts[1])!, // ?? 1,
    parseInt(parts[2])!, // ?? 1,
  );
}

DateTime convertTimestampToDate(int? timestamp) =>
    // DateTime.fromMillisecondsSinceEpoch((timestamp ?? 0) * 1000, isUtc: true);
    DateTime.fromMillisecondsSinceEpoch(timestamp ?? 0, isUtc: true);

String convertTimestampToDateString(int? timestamp) =>
    convertTimestampToDate(timestamp).toIso8601String();

String formatDuration(Duration duration, {bool showSeconds = true}) {
  final time = duration.toString().split('.')[0];

  if (showSeconds) {
    return time;
  } else {
    final parts = time.split(':');
    return '${parts[0]}:${parts[1]}';
  }
}

DateTime convertTimeOfDayToDateTime(TimeOfDay? timeOfDay,
    [DateTime? dateTime]) {
  dateTime ??= DateTime.now();
  return DateTime(dateTime.year, dateTime.month, dateTime.day,
          timeOfDay?.hour ?? 0, timeOfDay?.minute ?? 0)
      .toUtc();
}

TimeOfDay convertDateTimeToTimeOfDay(DateTime? dateTime) =>
    TimeOfDay(hour: dateTime?.hour ?? 0, minute: dateTime?.minute ?? 0);

String formatDateRange(String startDate, String endDate, BuildContext context) {
  final today = DateTime.now();

  final startDateTime = DateTime.tryParse(startDate)?.toLocal();
  final startFormatter =
      DateFormat(today.year == startDateTime?.year ? 'MMM d' : 'MMM d, yyy');
  final startDateTimeString = startFormatter.format(startDateTime!);

  final endDateTime = DateTime.tryParse(endDate)?.toLocal();
  final endFormatter =
      DateFormat(today.year == endDateTime?.year ? 'MMM d' : 'MMM d, yyy');
  final endDateTimeString = endFormatter.format(endDateTime!);

  return '$startDateTimeString - $endDateTimeString';
}

String formatDate(String? value, BuildContext? context,
    {bool showDate = true, bool showTime = false, bool showSeconds = true}) {
  if (value == null || value.isEmpty) {
    return '';
  }

  // final state = StoreProvider.of<AppState>(context).state;
  // final CompanyEntity company = state.company;

  if (showTime) {
    String format;
    if (!showDate) {
      format = showSeconds ? 'h:mm:ss a' : 'h:mm a';
    } else {
      format = 'dd/MM/yyyy'; //dateFormats[dateFormatId].format;
      format += ' ' + (showSeconds ? 'h:mm:ss a' : 'h:mm a');
    }
    final formatter = DateFormat(format);
    final parsed = DateTime.tryParse(value.endsWith('Z') ? value : value + 'Z');

    return parsed == null ? '' : formatter.format(parsed.toLocal());
  } else {
    final formatter = DateFormat('dd/MM/yyyy');
    final parsed = DateTime.tryParse(value);
    return parsed == null ? '' : formatter.format(parsed);
  }
}

String parseDate(String? value, BuildContext? context) {
  if (value == null || value.isEmpty) {
    return '';
  }
  final formatter = DateFormat('dd/MM/yyyy');

  return convertDateTimeToSqlDate(formatter.parse(value));
}

String? formatNumber(
  double? value,
  BuildContext context, {
  String? clientId,
  String? currencyId,
  FormatNumberType formatNumberType = FormatNumberType.int,
  bool? showCurrencyCode,
  bool zeroIsNull = false,
  bool roundToPrecision = true,
}) {
  if ((zeroIsNull || formatNumberType == FormatNumberType.inputAmount) &&
      value == 0) {
    return null;
  } else if (value == null) {
    return '';
  }

  if (formatNumberType == FormatNumberType.duration) {
    return formatDuration(Duration(seconds: value.toInt()));
  }

  numberFormatSymbols['custom'] = const NumberSymbols(
    NAME: 'custom',
    DECIMAL_SEP: '.',
    GROUP_SEP: ' ',
    ZERO_DIGIT: '0',
    PLUS_SIGN: '+',
    MINUS_SIGN: '-',
    CURRENCY_PATTERN: '',
    DECIMAL_PATTERN: '',
    DEF_CURRENCY_CODE: '',
    EXP_SYMBOL: '',
    INFINITY: '',
    NAN: '',
    PERCENT: '',
    PERCENT_PATTERN: '',
    PERMILL: '',
    SCIENTIFIC_PATTERN: '',
  );

  late NumberFormat formatter;
  String? formatted;

  if (formatNumberType == FormatNumberType.int) {
    return NumberFormat('#,##0', 'custom').format(value);
  } else if (formatNumberType == FormatNumberType.double) {
    return NumberFormat('#,##0.#####', 'custom').format(value);
  } else if (formatNumberType == FormatNumberType.inputAmount) {
    return NumberFormat('#.#####', 'custom').format(value);
  } else {
    formatter = NumberFormat('#,##0.00###', 'custom');

    formatted = formatter.format(value < 0 ? value * -1 : value);

    // Ugly workaround to prevent showing negative zero values
    if (formatted == '-0.00') {
      formatted = '0.00';
    } else if (formatted == '-0,00') {
      formatted = '0,00';
    }
  }

  final prefix = value < 0 ? '-' : '';

  if (formatNumberType == FormatNumberType.percent) {
    return '$prefix$formatted%';
  }

  return null;
}

String cleanApiUrl(String? url) => (url ?? '')
    .trim()
    .replaceFirst(RegExp(r'/api/'), '')
    .replaceFirst(RegExp(r'/$'), '');
