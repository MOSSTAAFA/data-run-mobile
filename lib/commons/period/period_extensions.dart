import 'package:d2_remote/core/mp/period/period_type.dart';

import '../../commons/extensions/dynamic_extensions.dart';

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
