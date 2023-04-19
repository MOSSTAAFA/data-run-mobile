enum ProgramType { WITH_REGISTRATION, WITHOUT_REGISTRATION }

extension ToProgramTypeExtension on String? {
  ProgramType? get toProgramType {
    try {
      return ProgramType.values.firstWhere((status) => status.name == this,
          orElse: throw ArgumentError(
              'The ProgramType $this does not match any ProgramType'));
    } catch (e) {
      return null;
    }
  }
}
