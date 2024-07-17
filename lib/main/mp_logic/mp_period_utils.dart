import 'package:mass_pro/sdk/core/mp/period/period_type.dart';
import 'package:mass_pro/utils/mass_utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mp_period_utils.g.dart';

const String DATE_FORMAT_EXPRESSION = 'yyyy-MM-dd';
const String MONTHLY_FORMAT_EXPRESSION = 'MMM yyyy';
const String YEARLY_FORMAT_EXPRESSION = 'yyyy';
const String SIMPLE_DATE_FORMAT = 'd/M/yyyy';

@Riverpod(keepAlive: true)
AmPeriodUtils amPeriodUtils(AmPeriodUtilsRef ref) {

  return AmPeriodUtils(
      L('period_span_default_label'),
      L('week_period_span_default_label'),
      L('biweek_period_span_default_label'));
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
