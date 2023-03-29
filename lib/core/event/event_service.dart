import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';

import 'event_editable_status.dart';

abstract class EventService {
  ///
  /// Check if user has data write access to a particular event.
  ///
  /// It returns true if the user has data write access to both the program and the program stage.
  /// If the event does not exist, returns null
  ///
  Future<bool> hasDataWriteAccess(String eventUid);

  ///
  /// Check if the event has the event date within the opening period of the assigned organisation unit.
  ///
  Future<bool> isInOrgUnitRange(Event event);

  ///
  /// Check if the event can be edited or not. If you want to know the reason why the event is not editable, check
  /// the method [getEditableStatus] for a richer description of the status.
  ///
  Future<bool> isEditable(String eventUid);

  ///
  /// Returns the editable status of an event. In case the event is not editable, the result also includes the
  /// reason why it is not editable.
  ///
  Future<EventEditableStatus> getEditableStatus(String eventUid);

  ///
  /// Evaluates if an enrollments accepts more events for a particular programStage.
  ///
  /// It takes into account the enrollment status and if the program stage is repeatable or not.
  ///
  Future<bool> canAddEventToEnrollment(
      String enrollmentUid, String programStageUid);
}
