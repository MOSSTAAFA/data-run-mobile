import 'package:mass_pro/commons/extensions/dynamic_extensions.dart';

enum ActivityType { ITNs, IRS, CHVs_Patients, CHVs_Sessions, AMDs, UNITS }

extension ToActivityTypeExtension on String? {
  ActivityType? get toActivityType {
    try {
      return ActivityType.values.byName(this ?? '');
    } catch (e) {
      logInfo(info: 'The ActivityType $this does not match any Enum Value');
      return null;
    }
  }
}
