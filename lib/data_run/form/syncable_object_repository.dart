// import 'package:d2_remote/core/datarun/utilities/date_utils.dart';
// import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
// import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
// import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
// import 'package:mass_pro/data_run/form/syncable_status.dart';
//
// class SyncableObjectRepository {
//   SyncableObjectRepository(this.uid, this.query);
//
//   String uid;
//   SyncableQuery query;
//
//
//   Future<int> updateObject(SyncableEntity syncable) async {
//     // query.mergeMode = MergeMode.Merge;
//     final int savedEntitiesNumber = await query
//         .byId(uid)
//         .setData(syncable)
//         .save();
//     // query.mergeMode = MergeMode.Replace;
//     return savedEntitiesNumber;
//   }
//
//   ///  throws D2Error
//   Future<int> setStartEntryTime(DateTime? startEntryTime) async {
//     String? date;
//     if(startEntryTime != null) {
//       DateUtils.databaseDateFormat().format(startEntryTime.toUtc());
//     }
//     return updateObject((await updateBuilder(uid))..startEntryTime = date);
//   }
//
//   ///  throws D2Error
//   Future<int> setStatus(SyncableStatus syncableStatus) async {
//     final String? completedDate = syncableStatus == SyncableStatus.COMPLETED
//         ? DateUtils.databaseDateFormat().format(DateTime.now().toUtc())
//         : null;
//
//     return updateObject((await updateBuilder(uid))
//       ..status = syncableStatus.name
//       ..finishedEntryTime = completedDate);
//   }
//
//   ///  throws D2Error
//   Future<int> setFinishedEntryTime(DateTime finishedEntryTime) async {
//     final String date =
//         DateUtils.databaseDateFormat().format(finishedEntryTime.toUtc());
//     return updateObject((await updateBuilder(uid))..finishedEntryTime = date);
//   }
//
//   ///  throws D2Error
//   Future<int> setTeam(String team) async {
//     return updateObject((await updateBuilder(uid))..team = team);
//   }
//
//   ///  throws D2Error
//   Future<int> setActivity(String activity) async {
//     return await updateObject((await updateBuilder(uid))..activity = activity);
//   }
//
//   ///  throws D2Error
//   Future<int> setGeometry(Geometry? geometry) async {
//     // GeometryHelper.validateGeometry(geometry);
//     return updateObject((await updateBuilder(uid))..geometry = geometry);
//   }
//
//
//   Future<SyncableEntity> updateBuilder(String uid) async {
//     final SyncableEntity syncable = (await query.byId(uid).getOne())!;
//     final String updateDate =
//         DateUtils.databaseDateFormat().format(DateTime.now().toUtc());
//
//     // bool? state = enrollment.synced;
//     // state = state == State.TO_POST ? state : State.TO_UPDATE;
//
//     syncable.lastModifiedDate = updateDate;
//     syncable.dirty = true;
//
//     return syncable;
//   }
//
//   Future<void> deleteObject(SyncableEntity syncable) async {
//     await query.byId(uid).delete();
//   }
//
//   Future<SyncableEntity?> getSyncable() async {
//     return query.byId(uid).getOne();
//   }
// }
