import 'package:intl/intl.dart';

String getItemLocalString(Map<String?, String?>? localsMap) {
  final String local = Intl.getCurrentLocale();

  return localsMap?[local] ?? localsMap?.values.first ?? 'unProvidedLocale';
}
