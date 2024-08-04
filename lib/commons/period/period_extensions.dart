import 'package:mass_pro/sdk/core/mp/period/period_type.dart';

import 'package:mass_pro/commons/extensions/dynamic_extensions.dart';

extension PeriodTypeExtension on String? {
  PeriodType? get toPeriodType {
    try {
      return PeriodType.values.byName(this ?? '');
    } catch (e) {
      logInfo(info: 'The period $this does not match any period type');
      return null;
    }
  }
}
