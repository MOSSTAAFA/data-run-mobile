import '../../commons/extensions/dynamic_extensions.dart';
import 'event_status.dart';

extension ToEventStatusExtension on String? {
  EventStatus? get toEventStatus {
    try {
      return EventStatus.values.byName(this ?? '');
      // return EventStatus.values.firstWhere((status) => status.name == this,
      //     orElse: throw ArgumentError(
      //         'The EventStatus $this does not match any Status type'));
    } catch (e) {
      logInfo(info: 'The EventStatus $this does not match any Enum Value');
      return null;
    }
  }
}
