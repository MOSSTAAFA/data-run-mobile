import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/form/submission_status.dart';

class SubmissionListUtil {
  static Iterable<DataFormSubmission> filterByState(
      Iterable<DataFormSubmission> submissions,
      {SyncableEntityState? state,
      String sortBy = 'name'}) {
    final entities = switch (state) {
      == SyncableEntityState.TO_UPDATE => filterToUpdate(submissions),
      == SyncableEntityState.TO_POST => filterToPost(submissions),
      == SyncableEntityState.ERROR => filterWithSyncErrorState(submissions),
      == SyncableEntityState.SYNCED => filterWithSyncedState(submissions),
      _ => submissions,
    };
    entities.toList().sort((a, b) => (b.finishedEntryTime ??
            b.startEntryTime ??
            b.name ??
            '')
        .compareTo(a.finishedEntryTime ?? a.startEntryTime ?? a.name ?? ''));
    return entities;
  }

  static Iterable<DataFormSubmission> filterToUpdate(
      Iterable<DataFormSubmission> submissions) {
    return submissions.where((t) =>
        SubmissionStatus.getEnumValue(t.status) == SubmissionStatus.ACTIVE);
  }

  static Iterable<DataFormSubmission> filterToPost(
      Iterable<DataFormSubmission> submissions) {
    return submissions.where((t) =>
        SubmissionStatus.getEnumValue(t.status) == SubmissionStatus.COMPLETED &&
        t.synced == false);
  }

  static Iterable<DataFormSubmission> filterWithSyncErrorState(
      Iterable<DataFormSubmission> submissions) {
    return submissions.where((t) => t.syncFailed == true && t.dirty == true);
  }

  static Iterable<DataFormSubmission> filterWithSyncedState(
      Iterable<DataFormSubmission> submissions) {
    return submissions.where((t) => t.synced == true);
  }
}
