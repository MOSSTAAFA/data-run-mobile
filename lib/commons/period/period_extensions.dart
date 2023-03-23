import 'package:d2_remote/core/mp/period/period_type.dart';

extension PeriodTypeExtension on String? {
  PeriodType? get toPeriodType {
    try {
      return PeriodType.values.firstWhere(
          (periodType) => periodType.name == this,
          orElse: () => throw ArgumentError(
              'The period $this does not match any period type'));
    } catch (e) {
      return null;
    }
  }
}
