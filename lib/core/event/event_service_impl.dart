import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';

import 'event_editable_status.dart';
import 'event_service.dart';

class EventServiceImpl implements EventService {
  const EventServiceImpl();

  @override
  Future<bool> hasDataWriteAccess(String eventUid) {
    // TODO(NMC): implement hasDataWriteAccess
    return Future<bool>.value(true);
  }

  @override
  Future<bool> isInOrgUnitRange(Event event) {
    // TODO(NMC): implement isInOrgUnitRange
    return Future<bool>.value(true);
  }

  @override
  Future<bool> isEditable(String eventUid) async {
    return (await getEditableStatus(eventUid))
        .map(editable: (_) => true, nonEditable: (_) => false);
  }

  @override
  Future<EventEditableStatus> getEditableStatus(String eventUid) async {
    final Event event =
        (await D2Remote.trackerModule.event.byId(eventUid).getOne())!;
    final ProgramStage programStage = (await D2Remote.programModule.programStage
        .byId(event.programStage)
        .getOne())!;
    final Program program = (await D2Remote.programModule.program
        .byId(programStage.program)
        .getOne())!;

    // TODO(NMC): implement getEditableStatus
    return const EventEditableStatus.editable();
  }

  @override
  Future<bool> canAddEventToEnrollment(
      String enrollmentUid, String programStageUid) async {
    final Enrollment? enrollment =
        await D2Remote.trackerModule.enrollment.byId(enrollmentUid).getOne();
    final ProgramStage? programStage = await D2Remote.programModule.programStage
        .byId(programStageUid)
        .getOne();

    if (enrollment == null || programStage == null) {
      return false;
    }

    final bool isActiveEnrollment =
        enrollment.status.toEnrollmentStatus == EnrollmentStatus.ACTIVE;

    bool acceptMoreEvents = false;

    if (programStage.repeatable == true) {
      acceptMoreEvents = true;
    } else {
      acceptMoreEvents =
          await _getEventCount(enrollmentUid, programStageUid) == 0;
    }

    return isActiveEnrollment && acceptMoreEvents;
  }

  Future<int> _getEventCount(
      String enrollmentUid, String programStageUid) async {
    return await D2Remote.trackerModule.event
        .byEnrollment(enrollmentUid)
        .byProgramStage(programStageUid)
        .where(attribute: 'deleted', value: false)
        .count();
  }
}
