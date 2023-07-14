import '../date/date_utils.dart';
import 'dynamic_extensions.dart';

extension StringNullExtension on String? {
  DateTime? toDate() {
    DateTime? date;
    try {
      return DateUtils.databaseDateFormatNoZone().parse(this ?? '');
    } catch (e) {
      logError(info: 'wrong DateTime format');
    }

    try {
      return DateUtils.databaseDateFormat().parse(this ?? '');
    } catch (e) {
      logError(info: 'wrong DateTime format');
    }
    try {
      return DateUtils.dateTimeFormat().parse(this ?? '');
    } catch (e) {
      logError(info: 'wrong DateTime format');
    }

    try {
      return DateUtils.uiDateFormat().parse(this ?? '');
    } catch (e) {
      logError(info: 'wrong DateTime format');
    }

    try {
      return DateUtils.oldUiDateFormat().parse(this ?? '');
    } catch (e) {
      logError(info: 'wrong DateTime format');
    }

    return date;
  }

  bool get isNullOrEmpty => this?.isEmpty ?? true;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  bool toBoolean() {
    return this == 'true' || this == 'TRUE';
  }

  double toDouble() => double.parse(this!);

  int toInt({int? radix}) => int.parse(this!, radix: radix);

  String? format(List args, {String needleRegex = '%s'}) {
    final RegExp exp = RegExp(needleRegex);

    // Iterable<RegExpMatch> matches = exp.allMatches(this?? '');
    // assert(
    //     l.length == matches.length,
    //     'StringExtension.format: number of string '
    //     'args not match number of %s in the string');

    var i = -1;
    return this?.replaceAllMapped(exp, (match) {
      i = i + 1;
      return '${args[i]}';
    });
  }
}

extension StringExtension on String {
  String format(List args, {String needleRegex = '%s'}) {
    final RegExp exp = RegExp(needleRegex);

    // Iterable<RegExpMatch> matches = exp.allMatches(this);
    // assert(
    //     l.length == matches.length,
    //     'StringExtension.format: number of string '
    //     'args not match number of %s in the string');

    var i = -1;
    return replaceAllMapped(exp, (match) {
      i = i + 1;
      return '${args[i]}';
    });
  }
}
