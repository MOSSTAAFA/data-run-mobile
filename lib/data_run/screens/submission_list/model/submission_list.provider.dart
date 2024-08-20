import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/metadatarun/org_unit/entities/org_unit.entity.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_list_util.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_summary.model.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_list.repository.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_status_count.model.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submission.provider.g.dart';

@riverpod
SubmissionListRepository submissionListRepository(
    SubmissionListRepositoryRef ref, String form) {
  return SubmissionListRepository(form: form);
}

@riverpod
class SubmissionList extends _$SubmissionList {
  Future<IList<DataFormSubmission>> build(
      {required String form,
      SyncableEntityState? entityStatus,
      String sortBy = 'name'}) async {
    final ddd = await ref
        .watch(submissionListRepositoryProvider(form))
        .getByState(state: entityStatus);
    return ddd;
  }

  Future<void> syncEntities(List<String> uids) async {
    await D2Remote.formModule.formSubmission.byIds(uids).upload();

    ref.invalidateSelf();
    await future;
  }


  Future<void> saveSubmission(DataFormSubmission submission) async {

    submission.status = 'ACTIVE';
    submission.dirty = true;

    await D2Remote.formModule.formSubmission
        .setData(submission)
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: false));

    ref.invalidateSelf();
    await future;
  }
}

@riverpod
Future<SubmissionStatusModel> submissionStatusModel(
    SubmissionStatusModelRef ref,
    {required String form}) async {
  final allSubmissions =
      await ref.watch(submissionListProvider(form: form).future);

  final toPost = SubmissionListUtil.filterToPost(allSubmissions);
  final toUpdate = SubmissionListUtil.filterToUpdate(allSubmissions);
  final synced = SubmissionListUtil.filterWithSyncedState(allSubmissions);
  final withError = SubmissionListUtil.filterWithSyncErrorState(allSubmissions);

  return SubmissionStatusModel(
      toPost: toPost.length,
      toUpdate: toUpdate.length,
      synced: synced.length,
      withError: withError.length);
}

@riverpod
Future<SubmissionItemSummaryModel> submissionItemSummaryModel(
    SubmissionItemSummaryModelRef ref,
    {required String submissionUid,
    required String form}) async {
  final allSubmissions =
      await ref.watch(submissionListProvider(form: form).future);

  final submission = allSubmissions.firstWhere((t) => t.uid == submissionUid);

  final formConfig = await ref.watch(
      formConfigurationProvider(form: form, formVersion: submission.version)
          .future);

  final OrgUnit? orgUnit = submission.orgUnit != null
      ? await D2Remote.organisationUnitModuleD.orgUnit
          .byId(submission.orgUnit!)
          .getOne()
      : null;

  final formData = submission.formData?.map<String, dynamic>(
      (k, v) => MapEntry(formConfig.getFieldDisplayName(k), v));

  return SubmissionItemSummaryModel(
      orgUnit: orgUnit?.displayName ?? getItemLocalString(orgUnit?.label),
      formData: formData);
}
