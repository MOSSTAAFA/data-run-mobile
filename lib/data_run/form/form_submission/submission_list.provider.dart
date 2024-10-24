import 'package:d2_remote/core/datarun/utilities/date_utils.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/queries/data_form_submission.query.dart';
import 'package:d2_remote/modules/metadatarun/org_unit/entities/org_unit.entity.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/errors_management/errors/d_error.dart';
import 'package:mass_pro/data_run/form/form_submission/submission_list_util.dart';
import 'package:mass_pro/data_run/form/form_submission/form_submission_repository.dart';
import 'package:mass_pro/data_run/form/form_submission/submission_summary.model.dart';
import 'package:mass_pro/data_run/form/shared/form_configuration.dart';
import 'package:mass_pro/data_run/form/shared/submission_status.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:mass_pro/utils/navigator_key.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;

part 'submission_list.provider.g.dart';

@riverpod
FormSubmissionRepository formSubmissionRepository(
    FormSubmissionRepositoryRef ref) {
  return FormSubmissionRepository();
}

@riverpod
class FormSubmissions extends _$FormSubmissions {
  Future<IList<DataFormSubmission>> build(String form) async {
    final submissions =
        await ref.watch(formSubmissionRepositoryProvider).getSubmissions(form);
    return submissions;
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

  Future<DataFormSubmission> saveOrgUnit(String uid, String? orgUnit) async {
    await future;

    final DataFormSubmission? submission =
        await D2Remote.formModule.formSubmission.byId(uid).getOne();

    return updateSubmission(submission!..orgUnit = orgUnit);
  }

  /// injecting the arguments from the context
  Future<DataFormSubmission> createNewSubmission(
      {required String activityUid,
      required String teamUid,
      required String orgUnit,
      required int version,
      Map<String, dynamic> formData = const {},
      Geometry? geometry}) async {
    final DataFormSubmission submission = DataFormSubmission(
        status: 'ACTIVE',
        form: form,
        formVersion: '${form}_$version',
        version: version,
        activity: activityUid,
        team: teamUid,
        orgUnit: orgUnit,
        formData: formData,
        dirty: true,
        synced: false,
        deleted: false,
        startEntryTime:
            DateUtils.databaseDateFormat().format(DateTime.now().toUtc()));

    if (geometry != null) {
      submission.geometry = geometry;
    }

    await D2Remote.formModule.formSubmission
        .setData(submission)
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: false));

    return submission;
  }

  Future<DataFormSubmission?> getSubmission(String uid) {
    return D2Remote.formModule.formSubmission.byId(uid).getOne();
  }

  Future<DataFormSubmission> updateSubmission(
      DataFormSubmission submission) async {
    submission.status = 'ACTIVE';
    submission.dirty = true;

    await D2Remote.formModule.formSubmission
        .setData(submission)
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: false));

    ref.invalidateSelf();

    return submission;
  }

  Future<bool> deleteSubmission(Iterable<String?> syncableIds) async {
    try {
      await Future.forEach(syncableIds,
          (uid) => D2Remote.formModule.formSubmission.byId(uid!).delete());
      ref.invalidateSelf();
      await future;
      return true;
    } on DError catch (e) {
      logError(info: '# DataRun Error: ${e.toString()}');
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
Future<bool> submissionEditStatus(SubmissionEditStatusRef ref,
    {required String submission}) async {
  return D2Remote.formModule.formSubmission.byId(submission).canEdit();
}

@riverpod
Future<IMap<String, dynamic>> formSubmissionData(FormSubmissionDataRef ref,
    {required String submissionUid}) async {
  final DataFormSubmission? formSubmission = await ref
      .watch(formSubmissionRepositoryProvider)
      .getSubmission(submissionUid);
  final submissionData = await ref.watch(
      formSubmissionsProvider(formSubmission!.form!).selectAsync(
          (IList<DataFormSubmission> submissions) => submissions
              .firstWhere((item) => item.uid == submissionUid)
              .formData));
  return IMap.withConfig(submissionData, ConfigMap(cacheHashCode: false));
}

@riverpod
Future<List<DataFormSubmission>> submissionFilteredByState(
    SubmissionFilteredByStateRef ref,
    {required String form,
    SyncStatus? status,
    String sortBy = 'name'}) async {
  final allSubmissions = await ref.watch(formSubmissionsProvider(form).future);

  final filteredSubmission = allSubmissions
      .where(SubmissionListUtil.getFilterPredicate(status))
      .toList();

  filteredSubmission.sort((a, b) =>
      (b.finishedEntryTime ?? b.startEntryTime ?? b.name ?? '')
          .compareTo(a.finishedEntryTime ?? a.startEntryTime ?? a.name ?? ''));
  return filteredSubmission;
}

@riverpod
Future<SubmissionItemSummaryModel> submissionInfo(SubmissionInfoRef ref,
    {required FormMetadata formMetadata}) async {
  final allSubmissions =
      await ref.watch(formSubmissionsProvider(formMetadata.form).future);

  final submission =
      allSubmissions.firstWhere((t) => t.uid == formMetadata.submission!);

  final formConfig = await ref.watch(formConfigurationProvider(
          form: formMetadata.form, version: formMetadata.version)
      .future);

  final OrgUnit? orgUnit = submission.orgUnit != null
      ? await D2Remote.organisationUnitModuleD.orgUnit
          .byId(submission.orgUnit!)
          .getOne()
      : null;

  final formData = submission.formData.map<String, dynamic>((k, v) => MapEntry(
      formConfig.getFieldDisplayName(k),
      formConfig.getUserFriendlyValue(k, v)));

  return SubmissionItemSummaryModel(
      syncStatus: SubmissionListUtil.getSyncStatus(submission)!,
      code: orgUnit?.code,
      orgUnit: '${orgUnit?.displayName ?? getItemLocalString(orgUnit?.label)}',
      formData: formData);
}
