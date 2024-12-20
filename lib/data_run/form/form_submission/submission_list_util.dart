import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:datarun/core/common/state.dart';
import 'package:datarun/data_run/form_reactive/form/form.dart';

typedef SubmissionFilterPredicate = bool Function(DataFormSubmission);

class SubmissionListUtil {
  /// returns entities by a specified State, and if not specified
  /// returns all entities
  static SyncStatus? getSyncStatus(DataFormSubmission? submission) {
    return switch (submission) {
      var s? when s.synced == true => SyncStatus.SYNCED,
      var s? when s.syncFailed == true && s.dirty == true => SyncStatus.ERROR,
      var s?
      when EntryStatus.getEnumValue(s.status) == EntryStatus.COMPLETED &&
          s.synced == false =>
      SyncStatus.TO_POST,
      var s? when EntryStatus.getEnumValue(s.status) == EntryStatus.ACTIVE =>
        SyncStatus.TO_UPDATE,



      _ => null,
    };
  }

  static SubmissionFilterPredicate getFilterPredicate(SyncStatus? state) {
    final predicate = switch (state) {
      == SyncStatus.TO_UPDATE => (t) =>
          EntryStatus.getEnumValue(t.status) == EntryStatus.ACTIVE && t.synced == false,
      == SyncStatus.TO_POST => (t) =>
          EntryStatus.getEnumValue(t.status) == EntryStatus.COMPLETED &&
          t.synced == false,
      == SyncStatus.ERROR => (t) => t.syncFailed == true && t.dirty == true  && t.synced == false,
      == SyncStatus.SYNCED => (t) => t.synced == true,
      _ => (t) => true,
    };
    return predicate;
  }

  static Iterable<DataFormSubmission> filterByState(
      Iterable<DataFormSubmission> submissions,
      {SyncStatus? state,
      String sortBy = 'name'}) {
    final entities = switch (state) {
      == SyncStatus.TO_UPDATE => filterToUpdate(submissions),
      == SyncStatus.TO_POST => filterToPost(submissions),
      == SyncStatus.ERROR => filterWithSyncErrorState(submissions),
      == SyncStatus.SYNCED => filterWithSyncedState(submissions),
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
    return submissions
        .where((t) => EntryStatus.getEnumValue(t.status) == EntryStatus.ACTIVE);
  }

  static Iterable<DataFormSubmission> filterToPost(
      Iterable<DataFormSubmission> submissions) {
    return submissions.where((t) =>
        EntryStatus.getEnumValue(t.status) == EntryStatus.COMPLETED &&
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
