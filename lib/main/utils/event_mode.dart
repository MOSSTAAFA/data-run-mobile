enum EventMode { NEW, CHECK }

extension ToEventModeExtension on String? {
  EventMode? get toEventMode {
    try {
      return EventMode.values.firstWhere((status) => status.name == this,
          orElse: throw ArgumentError(
              'The EventMode $this does not match any EventMode'));
    } catch (e) {
      return null;
    }
  }
}
