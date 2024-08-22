import 'package:d2_remote/core/datarun/utilities/date_utils.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/metadatarun/org_unit/entities/org_unit.entity.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/errors_management/errors/d_error.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/form/submission_status.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_list_util.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_summary.model.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_status_count.model.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_mapping_repository.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;

part 'submission_list.provider.g.dart';

@riverpod
SubmissionMappingRepository submissionMappingRepository(
    SubmissionMappingRepositoryRef ref,
    {required FormConfiguration formConfiguration,
    required String submissionUid}) {
  return SubmissionMappingRepository(ref,
      formConfiguration: formConfiguration, submissionUid: submissionUid);
}

@riverpod
class SubmissionList extends _$SubmissionList {
  Future<IList<DataFormSubmission>> build({required String form}) async {
    List<DataFormSubmission> submissions =
        await D2Remote.formModule.formSubmission.byForm(form).get();
    return submissions.lock;
  }

  Future<void> markSubmissionAsFinal(String uid) async {
    final String? completedDate =
        sdk.DateUtils.databaseDateFormat().format(DateTime.now().toUtc());
    final DataFormSubmission? submission =
        await D2Remote.formModule.formSubmission.byId(uid).getOne();
    submission!
      ..status = EntryStatus.COMPLETED.name
      ..finishedEntryTime = completedDate;

    await D2Remote.formModule.formSubmission
        .setData(submission)
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: false));

    ref.invalidateSelf();
    await future;
  }

  Future<void> saveOrgUnit(String uid, String orgUnit) async {
    await future;

    final DataFormSubmission? submission =
        await D2Remote.formModule.formSubmission.byId(uid).getOne();

    return saveSubmission(submission!..orgUnit = orgUnit);
  }

  Future<String> createSubmission(
      {required String activityUid,
      required String teamUid,
      required String orgUnit,
      required Map<String, String?> formData,
      Geometry? geometry}) async {
    final DynamicForm? submissionForm =
        await D2Remote.formModule.form.byId(form).getOne();

    final DataFormSubmission submission = DataFormSubmission(
        status: 'ACTIVE',
        form: form,
        version: submissionForm!.version,
        activity: activityUid,
        team: teamUid,
        orgUnit: orgUnit,
        formData: {},
        dirty: true,
        synced: false,
        deleted: false,
        startEntryTime:
            DateUtils.databaseDateFormat().format(DateTime.now().toUtc()));

    if (geometry != null) {
      submission.geometry = geometry;
    }

    await saveSubmission(submission);

    return submission.id!;
  }

  Future<DataFormSubmission?> getSubmission(String uid) {
    return D2Remote.formModule.formSubmission.byId(uid).getOne();
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

  Future<void> saveSubmissionData(
      String uid, IMap<String, dynamic> pendingUpdatesDataMap) async {
    final DataFormSubmission? storedFormSubmission =
        await D2Remote.formModule.formSubmission.byId(uid).getOne();

    storedFormSubmission!.formData!.addAll(pendingUpdatesDataMap.unlock);
    await saveSubmission(storedFormSubmission);
  }

  Future<bool> deleteSubmission(String syncableId) async {
    try {
      await D2Remote.formModule.formSubmission.byId(syncableId).delete();
      // ref.invalidateSelf();
      ref.invalidate(submissionListProvider);
      await future;
      return true;
    } on DError catch (d2Error) {
      return false;
    }
  }

  Future<void> syncEntities(List<String> uids) async {
    await D2Remote.formModule.formSubmission.byIds(uids).upload();

    ref.invalidateSelf();
    await future;
  }
}

@riverpod
Future<List<DataFormSubmission>> submissionFilteredByState(
    SubmissionFilteredByStateRef ref,
    {required String form,
    SyncStatus? syncState,
    String sortBy = 'name'}) async {
  final allSubmissions =
      await ref.watch(submissionListProvider(form: form).future);

  final filteredSubmission = allSubmissions
      .where(SubmissionListUtil.getFilterPredicate(syncState))
      .toList();

  filteredSubmission.sort((a, b) =>
      (b.finishedEntryTime ?? b.startEntryTime ?? b.name ?? '')
          .compareTo(a.finishedEntryTime ?? a.startEntryTime ?? a.name ?? ''));
  return filteredSubmission;
}

@riverpod
Future<SubmissionStatusModel> submissionStatusModel(
    SubmissionStatusModelRef ref,
    {required String form}) async {
  final allSubmissions =
      await ref.watch(submissionListProvider(form: form).future);

  final toPost = allSubmissions
      .where(SubmissionListUtil.getFilterPredicate(SyncStatus.TO_POST));
  final toUpdate = allSubmissions
      .where(SubmissionListUtil.getFilterPredicate(SyncStatus.TO_UPDATE));
  final synced = allSubmissions
      .where(SubmissionListUtil.getFilterPredicate(SyncStatus.SYNCED));
  final withError = allSubmissions
      .where(SubmissionListUtil.getFilterPredicate(SyncStatus.ERROR));

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

  final formData = submission.formData?.map<String, dynamic>((k, v) => MapEntry(
      formConfig.getFieldDisplayName(k),
      formConfig.getUserFriendlyValue(k, v)));

  return SubmissionItemSummaryModel(
      syncStatus: SubmissionListUtil.getSyncStatus(submission)!,
      code: orgUnit?.code,
      orgUnit:
          '${orgUnit?.displayName ?? getItemLocalString(orgUnit?.label)}',
      formData: formData);
}
