// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/chv_register.entity.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/chv_session.entity.dart';
import 'package:d2_remote/modules/datarun/itns/entities/itns_village.entity.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/data_run/form/entity_form_listing_repository.dart';
import 'package:mass_pro/data_run/form/map_field_value_to_user.dart';
import 'package:mass_pro/data_run/form/syncable_object_repository.dart';
import 'package:mass_pro/data_run/form/syncable_status.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/sdk/core/maintenance/d2_error.dart';

class SyncableEntityInitialRepository {
  SyncableEntityInitialRepository(this.ref,
      {required SyncableQuery d2SyncableQuery,
      String? formCode,
      String? syncableUid})
      : _syncableUid = syncableUid,
        _syncableQuery = d2SyncableQuery,
        _formCode = formCode;

  final String? _syncableUid;
  final String? _formCode;

  final SyncableEntityInitialRepositoryRef ref;

  final SyncableQuery _syncableQuery;

  // final SyncableObjectRepository _syncableObjectRepository;

  // SyncableEntity initSyncable(String activityUid, String teamUid) {
  //   return when<String?, SyncableEntity>(_formCode, {
  //     'CHV_PATIENTS_FORM': () => ChvRegister(
  //         // location: locationUidTempTest,
  //         activity: activityUid,
  //         team: teamUid,
  //         status: 'ACTIVE',
  //         dirty: true),
  //     'CHV_SESSIONS_FORM': () => ChvSession(
  //         activity: activityUid, team: teamUid, status: 'ACTIVE', dirty: true),
  //     'ITN_DISTRIBUTION_FORM': () => ItnsVillage(
  //         activity: activityUid, team: teamUid, status: 'ACTIVE', dirty: true),
  //   }).orElse(() => throw Exception('UnAvailable Entity for Form: $_formCode'));
  // }

  Future<String> createSyncable(
      {required String activityUid,
      required String teamUid,
      DateTime? date,
      IList<QFieldModel>? mainFieldValues,
      Geometry? geometry}) async {
    final DateTime dateTime = date != null
        ? DateTime(date.year, date.month, date.day)
        : DateTime.now();

    SyncableEntity initEntityToAdd = await (_syncableQuery
          ..activity = activityUid
          ..team = teamUid)
        .create();

    IMap<String, dynamic> entityToAddMap = initEntityToAdd.toJson().lock;

    mainFieldValues?.forEach((field) => entityToAddMap = entityToAddMap.update(
        field.uid, (value) => mapFieldToValueType(field)));

    initEntityToAdd = _syncableQuery.fromJsonInstance(entityToAddMap.unlock);

    await _syncableQuery.setData(initEntityToAdd).save();

    final SyncableObjectRepository syncableRepository =
        SyncableObjectRepository(initEntityToAdd.id!, _syncableQuery);

    await syncableRepository.setStartEntryTime(dateTime);
    final SyncableEntity? syncable = await syncableRepository.getSyncable();

    if (geometry != null) {
      await syncableRepository.setGeometry(geometry);
    }

    return syncable!.id!;
  }

  Future<void> deleteSyncable(String syncableId) async {
    try {
      await _syncableQuery.byId(syncableId).delete();
    } on D2Error catch (d2Error) {
      print('Timber.e($d2Error)');
    }
  }

  Future<bool> isFormOpen() async {
    final SyncableEntity? syncable =
        await _syncableQuery.byId(_syncableUid ?? '').getOne();

    final syncableStatus = SyncableStatusUtil.getEnumValue(syncable?.status);

    return syncable == null || syncableStatus == SyncableStatus.ACTIVE;
  }
}
