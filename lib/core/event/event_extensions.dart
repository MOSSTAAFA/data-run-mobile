import 'event_status.dart';

extension ToEventStatusExtension on String? {
  EventStatus? get toStatus {
    try {
      return EventStatus.values.firstWhere((status) => status.name == this,
          orElse: throw ArgumentError(
              'The EventStatus $this does not match any Status type'));
    } catch (e) {
      return null;
    }
  }
}