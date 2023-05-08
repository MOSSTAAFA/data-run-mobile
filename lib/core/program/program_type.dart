import '../../commons/extensions/dynamic_extensions.dart';

enum ProgramType { WITH_REGISTRATION, WITHOUT_REGISTRATION }

extension ToProgramTypeExtension on String? {
  ProgramType? get toProgramType {
    try {
      return ProgramType.values.byName(this ?? '');
      // return ProgramType.values.firstWhere((status) => status.name == this,
      //     orElse: throw ArgumentError(
      //         'The ProgramType $this does not match any ProgramType'));
    } catch (e) {
      logInfo(info: 'The ProgramType $this does not match any Enum Value');
      return null;
    }
  }
}
