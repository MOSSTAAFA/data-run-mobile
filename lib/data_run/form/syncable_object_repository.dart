import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:mass_pro/commons/date/date_utils.dart';
import 'package:mass_pro/data_run/form/syncable_status.dart';

class SyncableObjectRepository {
  SyncableObjectRepository(this.uid, this.query);

  String uid;
  SyncableQuery query;

  Future<int> updateObject(SyncableEntity syncable) async {
    // query.mergeMode = MergeMode.Merge;
    final int savedEntitiesNumber = await query
        .byId(uid)
        .setData(syncable)
        .save();
    // query.mergeMode = MergeMode.Replace;
    return savedEntitiesNumber;
  }

  ///  throws D2Error
  Future<int> setStartEntryTime(DateTime? startEntryTime) async {
    final String? date = startEntryTime?.toIso8601String().split('.')[0];
    return updateObject((await updateBuilder())..startEntryTime = date);
  }

  ///  throws D2Error
  Future<int> setStatus(SyncableStatus syncableStatus) async {
    final String? completedDate = syncableStatus == SyncableStatus.COMPLETED
        ? DateUtils.databaseDateFormat().format(DateTime.now())
        : null;

    return updateObject((await updateBuilder())
      ..status = syncableStatus.name
      ..finishedEntryTime = completedDate);
  }

  ///  throws D2Error
  Future<int> setFinishedEntryTime(DateTime finishedEntryTime) async {
    final String date =
        DateUtils.databaseDateFormat().format(finishedEntryTime);
    return updateObject((await updateBuilder())..finishedEntryTime = date);
  }

  ///  throws D2Error
  Future<int> setTeam(String team) async {
    return updateObject((await updateBuilder())..team = team);
  }

  ///  throws D2Error
  Future<int> setActivity(String activity) async {
    return await updateObject((await updateBuilder())..activity = activity);
  }

  ///  throws D2Error
  Future<int> setGeometry(Geometry? geometry) async {
    // GeometryHelper.validateGeometry(geometry);
    return updateObject((await updateBuilder())..geometry = geometry);
  }

  Future<SyncableEntity> updateBuilder() async {
    final SyncableEntity syncable = (await query.byId(uid).getOne())!;
    final String updateDate =
        DateUtils.databaseDateFormat().format(DateTime.now());

    // bool? state = enrollment.synced;
    // state = state == State.TO_POST ? state : State.TO_UPDATE;

    syncable.lastModifiedDate = updateDate;
    syncable.dirty = true;

    return syncable;
  }

  Future<void> deleteObject(SyncableEntity syncable) async {
    await query.byId(uid).delete();
  }

  Future<SyncableEntity?> getSyncable() async {
    return query.byId(uid).getOne();
  }
}
