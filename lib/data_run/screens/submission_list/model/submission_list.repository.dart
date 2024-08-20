import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/core/common/state.dart';

class SubmissionListRepository {
  SubmissionListRepository({required this.form});

  final String form;

  SyncableQuery<DataFormSubmission> getQuery() {
    return D2Remote.formModule.formSubmission.byForm(form);
  }

  /// returns all entities
  Future<IList<DataFormSubmission>> getSubmissions() async {
    final List<DataFormSubmission> entities = await getQuery().get();
    return entities.lock;
  }

  /// get status based on the status of All entities
  Future<SyncableEntityState> getOverallStatus() async {
    final withSyncErrorState = await getQuery().withSyncErrorState().count();

    final withToPostState = await getQuery().withCompleteState().count();
    final withToUpdateState = await getQuery().withActiveState().count();

    if (withSyncErrorState > 0) {
      return SyncableEntityState.WARNING;
    }

    if (withToPostState > 0) {
      return SyncableEntityState.TO_POST;
    }

    if (withToUpdateState > 0) {
      return SyncableEntityState.TO_UPDATE;
    }

    return SyncableEntityState.SYNCED;
  }

  /// returns entities by a specified State, and if not specified
  /// returns all entities
  Future<IList<DataFormSubmission>> getByState(
      {SyncableEntityState? state, String sortBy = 'name'}) async {
    final entities = await switch (state) {
      == SyncableEntityState.TO_UPDATE => getToUpdate(),
      == SyncableEntityState.TO_POST => getToPost(),
      == SyncableEntityState.ERROR => getWithSyncErrorState(),
      == SyncableEntityState.SYNCED => getWithSyncedState(),
      _ => getSubmissions(),
    };

    final IList<DataFormSubmission> sorted = entities.sort((a, b) =>
        (b.finishedEntryTime ?? b.startEntryTime ?? b.name ?? '').compareTo(
            a.finishedEntryTime ?? a.startEntryTime ?? a.name ?? ''));
    return sorted;
  }

  /// returns the count of entities by a specified State, and if not specified
  /// returns the count of all entities
  Future<int> getCount({SyncableEntityState? state}) async {
    final entities = await getByState(state: state);
    return entities.length;
  }

  /// Entities that Entry needs to be finished and status turned to 'COMPLETED'
  /// Entities that are unsynced, dirty and status is not 'COMPLETED'
  Future<IList<DataFormSubmission>> getToUpdate() async {
    final entities = await getQuery().withActiveState().get();
    return entities.lock;
  }

  /// Entities that are unsynced, dirty and status is 'COMPLETED'
  Future<IList<DataFormSubmission>> getToPost() async {
    final List<DataFormSubmission> entities = await getQuery()
        .withCompleteState()
        .where(attribute: 'synced', value: false)
        .get();
    return entities.lock;
  }

  /// Not Synced to server at all, Couldn't be synced
  /// State = to_post but have errors
  Future<IList<DataFormSubmission>> getWithSyncErrorState() async {
    final entities = await getQuery().withSyncErrorState().get();
    return entities.lock;
  }

  /// Entities that are unsynced, dirty and status is 'COMPLETED'
  Future<IList<DataFormSubmission>> getWithSyncedState() async {
    final List<DataFormSubmission> dataSubmissions =
        await getQuery().where(attribute: 'synced', value: true).get();
    return dataSubmissions.lock;
  }
}
