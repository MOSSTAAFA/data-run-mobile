import 'dart:async';

import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/shared/utilities/merge_mode.util.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';

import '../../commons/date/date_utils.dart';

class EnrollmentObjectRepository {
  EnrollmentObjectRepository(this.uid);

  final String uid;

  Future<void> updateObject(Enrollment enrollment) async {
    D2Remote.trackerModule.enrollment.mergeMode = MergeMode.Merge;
    await D2Remote.trackerModule.enrollment
        .setData(enrollment)
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: true));
    D2Remote.trackerModule.enrollment.mergeMode = MergeMode.Replace;
  }

  ///  throws D2Error
  Future<void> setOrganisationUnitUid(String organisationUnitUid) async {
    return updateObject((await updateBuilder())..orgUnit = organisationUnitUid);
  }

  ///  throws D2Error
  Future<void> setEnrollmentDate(DateTime? enrollmentDate) async {
    final date = enrollmentDate?.toIso8601String().split('.')[0];
    return updateObject((await updateBuilder())..enrollmentDate = date);
  }

  ///  throws D2Error
  Future<void> setIncidentDate(DateTime? incidentDate) async {
    final date = incidentDate?.toIso8601String().split('.')[0];
    return updateObject((await updateBuilder())..incidentDate = date);
  }

  ///  throws D2Error
  Future<void> setCompletedDate(DateTime completedDate) async {
    // final date = completedDate.toIso8601String().split('.')[0];
    final String date = DateUtils.databaseDateFormat().format(completedDate);
    return updateObject((await updateBuilder())..completedDate = date);
  }

  ///  throws D2Error
  Future<void> setFollowUp(bool followUp) async {
    return updateObject((await updateBuilder())..followup = followUp);
  }

  ///  throws D2Error
  Future<void> setStatus(EnrollmentStatus? enrollmentStatus) async {
    // final String? completedDate = enrollmentStatus == EnrollmentStatus.COMPLETED
    //     ? DateTime.now().toIso8601String().split('.')[0]
    //     : null;
    final String? completedDate = enrollmentStatus == EnrollmentStatus.COMPLETED
        ? DateUtils.databaseDateFormat().format(DateTime.now())
        : null;

    return updateObject((await updateBuilder())
      ..status = enrollmentStatus?.name
      ..completedDate = completedDate);
  }

  ///  throws D2Error
  Future<void> setGeometry(Geometry? geometry) async {
    // GeometryHelper.validateGeometry(geometry);

    return updateObject((await updateBuilder())..geometry = geometry);
  }

  Future<Enrollment> updateBuilder() async {
    final Enrollment enrollment =
        (await D2Remote.trackerModule.enrollment.byId(uid).getOne())!;
    final String updateDate =
        DateUtils.databaseDateFormat().format(DateTime.now());
    // bool? state = enrollment.synced;
    // state = state == State.TO_POST ? state : State.TO_UPDATE;

    enrollment.lastUpdated = updateDate;
    enrollment.lastUpdatedAtClient = updateDate;

    enrollment.synced = false;
    enrollment.dirty = true;

    return enrollment;
  }

  Future<void> deleteObject(Enrollment enrollment) async {
    await D2Remote.trackerModule.enrollment.byId(uid).delete();
  }

  Future<Enrollment?> getEnrollment() async {
    return D2Remote.trackerModule.enrollment.byId(uid).getOne();
  }
}
