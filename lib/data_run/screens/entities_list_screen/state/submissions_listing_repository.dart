import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/core/d2_remote_extensions/tracker/queries/base_query_extension.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submissions_listing_repository.g.dart';

@riverpod
SubmissionsListingRepository submissionsListingRepository(
    SubmissionsListingRepositoryRef ref) {
  final Bundle eventBundle = Get.arguments as Bundle;
  final String formUid = eventBundle.getString(FORM_CODE)!;
  final int latestFormVersion = int.parse(eventBundle.getString(FORM_VERSION)!);

  return SubmissionsListingRepository(
      formUid: formUid, version: latestFormVersion);
}

@riverpod
Future<IList<SyncableEntity>> submissionsByStatus(SubmissionsByStatusRef ref,
    {required String formCode,
    SyncableEntityState? entityStatus,
    String sortBy = 'name'}) async {
  final IList<SyncableEntity> ddd = await ref
      .watch(submissionsListingRepositoryProvider)
      .getEntitiesByState(state: entityStatus);
  return ddd;
}

class SubmissionsListingRepository {
  SubmissionsListingRepository({required this.formUid, required this.version});

  final String formUid;
  final int version;

  SyncableQuery getQuery() {
    return D2Remote.formModule.formSubmission;
  }

  /// returns all entities
  Future<IList<SyncableEntity>> getEntities() async {
    final List<SyncableEntity> entities = await getQuery().byId(formUid).get();
    return entities.lock;
  }

  /// get status based on the status of All entities
  Future<SyncableEntityState> getStatus() async {
    final withSyncErrorState =
        await getQuery().resetFilters().withSyncErrorState().count();

    final withToPostState =
        await getQuery().resetFilters().withCompleteState().count();
    final withToUpdateState =
        await getQuery().resetFilters().withActiveState().count();

    return when(true, {
      withSyncErrorState > 0: () => SyncableEntityState.WARNING,
      withToPostState > 0: () => SyncableEntityState.TO_POST,
      withToUpdateState > 0: () => SyncableEntityState.TO_UPDATE,
    }).orElse(() => SyncableEntityState.SYNCED);
  }

  /// returns entities by a specified State, and if not specified
  /// returns all entities
  Future<IList<SyncableEntity>> getEntitiesByState(
      {SyncableEntityState? state, String sortBy = 'name'}) async {
    final IList<SyncableEntity> entities =
        await when<SyncableEntityState?, Future<IList<SyncableEntity>>>(state, <SyncableEntityState?, Future<IList<SyncableEntity>> Function()>{
      SyncableEntityState.TO_UPDATE: () => getEntitiesToUpdate(),
      SyncableEntityState.TO_POST: () => getEntitiesToPost(),
      SyncableEntityState.ERROR: () => getEntitiesWithSyncErrorState(),
      SyncableEntityState.SYNCED: () => getEntitiesWithSyncedState(),

      /// orElse getAll
    }).orElse(() => getEntities());
    final IList<SyncableEntity> sorted = entities.sort((SyncableEntity a, SyncableEntity b) => (b.finishedEntryTime ??
            b.startEntryTime ??
            b.name ??
            '')
        .compareTo(a.finishedEntryTime ?? a.startEntryTime ?? a.name ?? ''));
    return sorted;
  }

  /// returns the count of entities by a specified State, and if not specified
  /// returns the count of all entities
  Future<int> getEntitiesCount({SyncableEntityState? state}) async {
    final IList<SyncableEntity> entities = await getEntitiesByState(state: state);
    return entities.length;
  }

  /// Entities that Entry needs to be finished and status turned to 'COMPLETED'
  /// Entities that are unsynced, dirty and status is not 'COMPLETED'
  Future<IList<SyncableEntity>> getEntitiesToUpdate() async {
    final List<SyncableEntity> entities =
        await getQuery().resetFilters().withActiveState().get();
    return entities.lock;
  }

  /// Entities that are unsynced, dirty and status is 'COMPLETED'
  Future<IList<SyncableEntity>> getEntitiesToPost() async {
    final List<SyncableEntity> entities = await getQuery()
        .resetFilters()
        .withCompleteState()
        // .where(attribute: 'status', value: 'COMPLETED')
        .where(attribute: 'synced', value: false)
        .get();
    return entities.lock;
  }

  /// Not Synced to server at all, Couldn't be synced
  /// State = to_post but have errors
  Future<IList<SyncableEntity>> getEntitiesWithSyncErrorState() async {
    final List<SyncableEntity> entities =
        await getQuery().resetFilters().withSyncErrorState().get();
    return entities.lock;
  }

  /// Entities that are unsynced, dirty and status is 'COMPLETED'
  Future<IList<SyncableEntity>> getEntitiesWithSyncedState() async {
    final List<SyncableEntity> entities = await getQuery()
        .resetFilters()
        .where(attribute: 'synced', value: true)
        .get();
    return entities.lock;
  }
}
