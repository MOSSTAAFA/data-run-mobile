// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/chv_register.entity.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/chv_session.entity.dart';
import 'package:d2_remote/modules/datarun/itns/entities/itns_village.entity.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/metadatarun/teams/entities/d_team.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/data_run/form/database_syncable_query.dart';
import 'package:mass_pro/data_run/form/entity_form_listing_repository.dart';
import 'package:mass_pro/data_run/form/map_field_value_to_user.dart';
import 'package:mass_pro/data_run/form/syncable_object_repository.dart';
import 'package:mass_pro/data_run/form/syncable_status.dart';
import 'package:mass_pro/data_run/screens/form/fields_widgets/q_field.model.dart';
import 'package:mass_pro/sdk/core/maintenance/d2_error.dart';

class SyncableEntityInitialRepository {
  SyncableEntityInitialRepository(this.ref,
      {required DatabaseSyncableQuery syncableQueryProvider,
      String? syncableUid})
      : _syncableUid = syncableUid,
        _syncableQueryProvider =
            syncableQueryProvider /*,
        _syncableObjectRepository = SyncableObjectRepository(
            syncableUid!, syncableQueryProvider.getEntityQuery())*/
  ;

  final String? _syncableUid;

  final SyncableEntityInitialRepositoryRef ref;

  final DatabaseSyncableQuery _syncableQueryProvider;

  // final SyncableObjectRepository _syncableObjectRepository;

  SyncableQuery getQuery() {
    return _syncableQueryProvider.getEntityQuery();
  }

  SyncableEntity initSyncable(
      String formCode, String activityUid, String teamUid) {
    // fix in Ui When tha main field is
    // location set at adding new entity,
    // now it's the default behaviour
    // final locationUidTempTest = 'CawDJJ2iVzj';

    return when<String?, SyncableEntity>(formCode, {
      'CHV_PATIENTS_FORM': () => ChvRegister(
          // location: locationUidTempTest,
          activity: activityUid,
          team: teamUid,
          status: 'ACTIVE',
          dirty: true),
      'CHV_SESSIONS_FORM': () => ChvSession(
          activity: activityUid, team: teamUid, status: 'ACTIVE', dirty: true),
      'ITN_DISTRIBUTION_FORM': () => ItnsVillage(
          activity: activityUid, team: teamUid, status: 'ACTIVE', dirty: true),
    }).orElse(() => throw Exception(
        'UnAvailable Entity for Form: ${_syncableQueryProvider.formCode}'));
  }

  Future<SyncableEntity?> syncableObject(String syncableId) async {
    return (await getQuery().byId(syncableId).getOne())!;
  }

  Future<String> createSyncable(
      {required String activityUid,
      required String teamUid,
      DateTime? date,
      IList<QFieldModel>? mainFieldValues,
      Geometry? geometry}) async {
    final DateTime dateTime = date != null
        ? DateTime(date.year, date.month, date.day)
        : DateTime.now();

    final formCode = _syncableQueryProvider.formCode;

    SyncableEntity initEntityToAdd =
        initSyncable(formCode, activityUid, teamUid);

    IMap<String, dynamic> entityToAddMap = initEntityToAdd.toJson().lock;

    mainFieldValues?.forEach((field) => entityToAddMap = entityToAddMap.update(
        field.uid, (value) => mapFieldToValueType(field)));

    initEntityToAdd = getQuery().fromJsonInstance(entityToAddMap.unlock);

    await getQuery().setData(initEntityToAdd).save();

    final SyncableObjectRepository syncableRepository =
        SyncableObjectRepository(initEntityToAdd.id!, getQuery());

    await syncableRepository.setStartEntryTime(dateTime);
    final SyncableEntity? syncable = await syncableRepository.getSyncable();

    if (geometry != null) {
      await syncableRepository.setGeometry(geometry);
    }

    return syncable!.id!;
  }

  Future<void> deleteSyncable(String syncableId) async {
    try {
      await getQuery().byId(syncableId).delete();
    } on D2Error catch (d2Error) {
      print('Timber.e($d2Error)');
    }
  }

  Future<bool> isFormOpen() async {
    final SyncableEntity? syncable =
        await getQuery().byId(_syncableUid ?? '').getOne();

    final syncableStatus = SyncableStatusUtil.getEnumValue(syncable?.status);

    return syncable == null || syncableStatus == SyncableStatus.ACTIVE;
  }

  Future<DynamicForm> syncableForm() async {
    final form = await D2Remote.formModule.form
        .where(attribute: 'code', value: _syncableQueryProvider.formCode)
        .getOne();
    return form!;
  }

  Future<DTeam?> syncableTeam() async {
    final SyncableEntity? syncable = await syncableObject(_syncableUid ?? '');

    return D2Remote.teamModuleD.team.byId(syncable?.team ?? '').getOne();
  }

  Future<DActivity?> syncableActivity() async {
    final SyncableEntity? syncable = await syncableObject(_syncableUid ?? '');

    return D2Remote.activityModuleD.activity
        .byId(syncable?.activity ?? '')
        .getOne();
  }
}
