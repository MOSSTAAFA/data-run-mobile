import 'package:mass_pro/commons/extensions/dynamic_extensions.dart';

enum ProjectType { ITNs, IRS, CHVs, AMDs, UNITS }

extension ToProgramTypeExtension on String? {
  ProjectType? get toProjectType {
    try {
      return ProjectType.values.byName(this ?? '');
      // return ProgramType.values.firstWhere((status) => status.name == this,
      //     orElse: throw ArgumentError(
      //         'The ProgramType $this does not match any ProgramType'));
    } catch (e) {
      logInfo(info: 'The ProjectType $this does not match any Enum Value');
      return null;
    }
  }
}
