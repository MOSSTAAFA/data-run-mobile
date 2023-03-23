import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/shared/utilities/merge_mode.util.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:mass_pro/core/event/event_status.dart';

class EventObjectRepository {
  String uid;

  EventObjectRepository(this.uid);

  Future<void> updateObject(Event enrollment) async {
    D2Remote.trackerModule.enrollment.mergeMode = MergeMode.Merge;
    await D2Remote.trackerModule.enrollment
        .setData(enrollment)
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: true));
  }

  ///  throws D2Error
  Future<void> setOrganisationUnitUid(String organisationUnitUid) async {
    return await updateObject(
        (await updateBuilder())..orgUnit = organisationUnitUid);
  }

  ///  throws D2Error
  Future<void> setEventDate(DateTime? enrollmentDate) async {
    var date = enrollmentDate?.toIso8601String().split('.')[0];
    return await updateObject((await updateBuilder())..eventDate = date);
  }

  ///  throws D2Error
  Future<void> setStatus(EventStatus eventStatus) async {
    String? completedDate = eventStatus == EnrollmentStatus.COMPLETED
        ? DateTime.now().toIso8601String().split('.')[0]
        : null;

    return await updateObject((await updateBuilder())
      ..status = eventStatus.name
      ..completedDate = completedDate);
  }

  ///  throws D2Error
  Future<void> setCompletedDate(DateTime completedDate) async {
    var date = completedDate.toIso8601String().split('.')[0];
    return await updateObject((await updateBuilder())..completedDate = date);
  }

  ///  throws D2Error
  Future<void> setDueDate(DateTime dueDate) async {
    var date = dueDate.toIso8601String().split('.')[0];
    return await updateObject((await updateBuilder())..dueDate = date);
  }

  ///  throws D2Error
  Future<void> setGeometry(Geometry? geometry) async {
    // GeometryHelper.validateGeometry(geometry);

    return await updateObject((await updateBuilder())..geometry = geometry);
  }

  ///  throws D2Error
  // Future<void> setAssignedUser(String assignedUser) async {
  //   return await updateObject(
  //       (await updateBuilder())..assignedUser = assignedUser);
  // }

  ///  throws D2Error
  // Future<void> setFollowUp(bool followUp) async {
  // return updateObject((await updateBuilder())..followUp = followUp);
  // }

  Future<Event> updateBuilder() async {
    Event event = (await D2Remote.trackerModule.event.byId(uid).getOne())!;
    String updateDate = DateTime.now().toIso8601String().split('.')[0];
    // bool? state = enrollment.synced;
    // state = state == State.TO_POST ? state : State.TO_UPDATE;

    event.lastUpdated = updateDate;
    // enrollment.lastUpdatedAtClient = updateDate;

    event.synced = false;
    event.dirty = true;

    return event;
  }

  Future<void> deleteObject(Event enrollment) async {
    await D2Remote.trackerModule.enrollment.byId(uid).delete();
  }
}
