import 'package:d2_remote/core/mp/period/period_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../main.dart';
import '../l10n/app_localizations.dart';
part 'mp_period_utils.g.dart';

const String DATE_FORMAT_EXPRESSION = 'yyyy-MM-dd';
const String MONTHLY_FORMAT_EXPRESSION = 'MMM yyyy';
const String YEARLY_FORMAT_EXPRESSION = 'yyyy';
const String SIMPLE_DATE_FORMAT = 'd/M/yyyy';

@Riverpod(keepAlive: true)
AmPeriodUtils amPeriodUtils(AmPeriodUtilsRef ref) {
  final localization = AppLocalization.of(navigatorKey.currentContext!)!;

  return AmPeriodUtils(
      localization.lookup('R.period_span_default_label'),
      localization.lookup('R.week_period_span_default_label'),
      localization.lookup('R.biweek_period_span_default_label'));
}

class AmPeriodUtils {
  AmPeriodUtils(this.defaultPeriodLabel, this.defaultWeeklyLabel,
      this.defaultBiWeeklyLabel);
  final String defaultPeriodLabel;
  final String defaultWeeklyLabel;
  final String defaultBiWeeklyLabel;

  // final PeriodHelper periodHelper = d2.periodModule().periodHelper();

  String getPeriodUIString(
    PeriodType? periodType,
    DateTime date,
    // locale: Locale
  ) {
    return '';
  }
}
