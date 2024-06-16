import 'package:mass_pro/sdk/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/datarun/shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun/shared/queries/syncable.query.dart';
import 'package:d2_remote/shared/utilities/merge_mode.util.dart';
import 'package:mass_pro/commons/date/date_utils.dart';
import 'package:mass_pro/core/event/event_status.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/syncable_status.dart';

class EventObjectRepository<T extends SyncableEntity,
    Q extends SyncableQuery<T>> {
  EventObjectRepository(this.uid, this.query);

  String uid;
  Q query;

  Future<void> updateObject(T syncable) async {
    query.mergeMode = MergeMode.Merge;
    await query.setData(syncable).save();
    query.mergeMode = MergeMode.Replace;
  }

  ///  throws D2Error
  Future<void> setOrganisationUnitUid(String organisationUnitUid) async {
    // return updateObject((await updateBuilder())..orgUnit = organisationUnitUid);
  }

  ///  throws D2Error
  Future<void> setStartEntryTime(DateTime? startEntryTime) async {
    final String? date = startEntryTime?.toIso8601String().split('.')[0];
    return updateObject((await updateBuilder())..startEntryTime = date);
  }

  ///  throws D2Error
  Future<void> setStatus(SyncableStatus syncableStatus) async {
    final String? completedDate = syncableStatus == SyncableStatus.COMPLETED
        ? DateUtils.databaseDateFormat().format(DateTime.now())
        : null;

    return updateObject((await updateBuilder())
      ..status = syncableStatus.name
      ..finishedEntryTime = completedDate);
  }

  ///  throws D2Error
  Future<void> setFinishedEntryTime(DateTime finishedEntryTime) async {
    final String date = DateUtils.databaseDateFormat().format(finishedEntryTime);
    return updateObject((await updateBuilder())..finishedEntryTime = date);
  }

  ///  throws D2Error
  Future<void> setGeometry(Geometry? geometry) async {
    // GeometryHelper.validateGeometry(geometry);
    return updateObject((await updateBuilder())..geometry = geometry);
  }

  ///  throws D2Error
  Future<void> setTeam(String team) async {
    return await updateObject(
        (await updateBuilder())..team = team);
  }

  ///  throws D2Error
  Future<void> setActivity(String activity) async {
    return await updateObject(
        (await updateBuilder())..activity = activity);
  }

  Future<T> updateBuilder() async {
    final T syncable =
        (await query.byId(uid).getOne())!;
    final String updateDate =
        DateUtils.databaseDateFormat().format(DateTime.now());

    // bool? state = enrollment.synced;
    // state = state == State.TO_POST ? state : State.TO_UPDATE;

    syncable.lastUpdated = updateDate;
    // enrollment.lastUpdatedAtClient = updateDate;
    //
    // event.synced = false;
    syncable.dirty = true;

    return syncable;
  }

  Future<void> deleteObject(T syncable) async {
    await query.byId(uid).delete();
  }

  Future<T?> getEvent() async {
    return query.byId(uid).getOne();
  }
}
