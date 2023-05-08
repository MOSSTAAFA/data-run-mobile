import '../../commons/extensions/dynamic_extensions.dart';

enum EventMode { NEW, CHECK }

extension ToEventModeExtension on String? {
  EventMode? get toEventMode {
    try {
      return EventMode.values.byName(this ?? '');
      // return EventMode.values.firstWhere((status) => status.name == this,
      //     orElse: throw ArgumentError(
      //         'The EventMode $this does not match any EventMode'));
    } catch (e) {
      logInfo(info: 'The EventMode $this does not match any Enum Value');
      return null;
    }
  }
}
