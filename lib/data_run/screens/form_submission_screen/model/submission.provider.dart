import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submission.provider.g.dart';

@riverpod
Future<bool> submissionEditStatus(SubmissionEditStatusRef ref) async {
  final Bundle eventBundle = Get.arguments as Bundle;
  final String syncableUid = eventBundle.getString(SYNCABLE_UID)!;

  return D2Remote.formModule.formSubmission.byId(syncableUid).canEdit();
}


@riverpod
class Submission extends _$Submission {
  Future<DataFormSubmission> build({required String submissionId}) async {
    final submission =
    await D2Remote.formModule.formSubmission.byId(submissionId).getOne();
    return submission!;
  }

  Future<void> updateOrgUnit(String? orgUnitId) async {
    final previousState = await future;

    previousState.status = 'ACTIVE';
    previousState.dirty = true;
    previousState.orgUnit = orgUnitId;

    await D2Remote.formModule.formSubmission
        .setData(previousState..orgUnit = orgUnitId)
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: false));

    ref.invalidateSelf();
    ref.invalidate(formSubmissionListProvider);
    await future;
  }
}
