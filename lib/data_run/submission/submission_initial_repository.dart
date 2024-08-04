import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/form/map_field_value_to_user.dart';

import 'package:mass_pro/data_run/errors_management/error_management.dart';

class SubmissionInitialRepository {
  SubmissionInitialRepository({required FormConfiguration formConfiguration})
      : _formConfiguration = formConfiguration;

  final FormConfiguration _formConfiguration;

  SyncableQuery<DataFormSubmission> _getQuery() {
    return D2Remote.formModule.formSubmission.byForm(_formConfiguration.form);
  }

  Future<String> createSyncable(
      {required String activityUid,
      required String teamUid,
      required Map<String, String?> formData,
      Geometry? geometry}) async {
    final DataFormSubmission submission =
        await (D2Remote.formModule.formSubmission
              ..activity = activityUid
              ..team = teamUid
              ..form = _formConfiguration.form
              ..version = _formConfiguration.version)
            .create();

    final Map<String, dynamic> submissionData = {};

    formData.forEach((String key, String? value) => submissionData[key] =
        mapFieldToValueType(
            value: value, valueType: _formConfiguration.fields.get(key)?.type));

    submission.formData = submissionData;

    if (geometry != null) {
      submission.geometry = geometry;
    }

    await D2Remote.formModule.formSubmission.setData(submission).save();

    return submission.id!;
  }

  Future<bool> deleteSyncable(String syncableId) async {
    try {
      await D2Remote.formModule.formSubmission.byId(syncableId).delete();
      return true;
    } on DError catch (d2Error) {
      print('Timber.e($d2Error)');
      return false;
    }
  }
}
