enum EventCreationType { DEFAULT, REFERAL, ADDNEW, SCHEDULE }

extension ToEventCreationTypeExtension on String? {
  EventCreationType? get toEventCreationType {
    try {
      return EventCreationType.values.firstWhere(
          (status) => status.name == this,
          orElse: throw ArgumentError(
              'The EventCreationType $this does not match any EventCreationType'));
    } catch (e) {
      return null;
    }
  }
}
