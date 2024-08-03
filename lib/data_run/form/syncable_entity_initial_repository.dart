// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/form/form.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';

import '../errors_management/error_management.dart';

class SyncableEntityInitialRepository {
  SyncableEntityInitialRepository(this.ref,
      {required SyncableQuery d2SyncableQuery,
      String? form,
      String? syncableUid})
      : _syncableUid = syncableUid,
        _syncableQuery = d2SyncableQuery,
        _form = form;

  final String? _syncableUid;
  final String? _form;

  final SyncableEntityInitialRepositoryRef ref;

  final SyncableQuery _syncableQuery;

  Future<String> createSyncable(
      {required String activityUid,
      required String teamUid,
      required int version,
      required String form,
      DateTime? date,
      IList<QFieldModel>? mainFieldValues,
      Geometry? geometry}) async {
    final DateTime dateTime = date != null
        ? DateTime(date.year, date.month, date.day)
        : DateTime.now();

    SyncableEntity initEntityToAdd = await (_syncableQuery
          ..activity = activityUid
          ..team = teamUid)
        .createSubmission(form, version);

    IMap<String, dynamic> entityToAddMap = initEntityToAdd.toJson().lock;

    mainFieldValues?.forEach((QFieldModel field) => entityToAddMap = entityToAddMap.update(
        field.uid, (value) => mapFieldToValueType(field)));

    initEntityToAdd = _syncableQuery.fromJsonInstance(entityToAddMap.unlock);

    await _syncableQuery.setData(initEntityToAdd).save();

    final SyncableObjectRepository syncableRepository =
        SyncableObjectRepository(initEntityToAdd.id!, _syncableQuery);

    final SyncableEntity? syncable = await syncableRepository.getSyncable();

    ///
    final DataFormSubmission submission =
        await (D2Remote.formModule.formSubmission
              ..activity = activityUid
              ..team = teamUid)
            .createSubmission(form, version);

    final Map<String, dynamic> formData = <String, dynamic>{};
    mainFieldValues
        ?.forEach((QFieldModel field) => formData[field.uid] = mapFieldToValueType(field));

    submission.formData = formData;

    await D2Remote.formModule.formSubmission
        .setData(submission
          ..id = syncable!.id
          ..uid = syncable.id)
        .save();

    ///

    if (geometry != null) {
      await syncableRepository.setGeometry(geometry);
    }

    return syncable.id!;
  }

  Future<void> deleteSyncable(String syncableId) async {
    try {
      await _syncableQuery.byId(syncableId).delete();
    } on DError catch (d2Error) {
      print('Timber.e($d2Error)');
    }
  }

  Future<bool> isFormOpen() async {
    final SyncableEntity? syncable =
        await _syncableQuery.byId(_syncableUid ?? '').getOne();

    final SyncableStatus syncableStatus = SyncableStatusUtil.getEnumValue(syncable?.status);

    return syncable == null || syncableStatus == SyncableStatus.ACTIVE;
  }
}
