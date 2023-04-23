import '../../../../../commons/data/event_creation_type.dart';
import '../models/event_temp.dart';
import '../models/event_temp_status.dart';

class ConfigureEventTemp {
  const ConfigureEventTemp({required EventCreationType creationType})
      : _creationType = creationType;

  final EventCreationType _creationType;

  EventTemp call(EventTempStatus? status) {
    return EventTemp(
        active: _isActive(), status: status, completed: _isCompleted(status));
  }

  bool _isCompleted(EventTempStatus? status) {
    switch (_creationType) {
      case EventCreationType.REFERAL:
        return status != null;
      default:
    }
    return true;
  }

  bool _isActive() {
    return _creationType == EventCreationType.REFERAL;
  }
}
