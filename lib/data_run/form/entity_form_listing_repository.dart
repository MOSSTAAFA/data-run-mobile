import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/core/d2_remote_extensions/tracker/queries/base_query_extension.dart';

class EntityFormListingRepository {
  EntityFormListingRepository({required this.d2SyncableQuery});

  final SyncableQuery d2SyncableQuery;

  /// returns all entities
  Future<IList<SyncableEntity>> getEntities() async {
    final List<SyncableEntity> entities =
        await d2SyncableQuery.resetFilters().get();
    return entities.lock;
  }

  /// get status based on the status of All entities
  Future<SyncableEntityState> getStatus() async {
    final withSyncErrorState =
        await d2SyncableQuery.resetFilters().withSyncErrorState().count();

    final withToPostState =
        await d2SyncableQuery.resetFilters().withCompleteState().count();
    final withToUpdateState =
        await d2SyncableQuery.resetFilters().withActiveState().count();

    return when(true, {
      /*withUpdateErrorState > 0 ||*/ withSyncErrorState > 0: () =>
          SyncableEntityState.WARNING,
      withToPostState > 0: () => SyncableEntityState.TO_POST,
      withToUpdateState > 0: () => SyncableEntityState.TO_UPDATE,
    }).orElse(() => SyncableEntityState.SYNCED);
  }

  /// returns entities by a specified State, and if not specified
  /// returns all entities
  Future<IList<SyncableEntity>> getEntitiesByState(
      {SyncableEntityState? state, String sortBy = 'name'}) async {
    final IList<SyncableEntity> entities =
        await when<SyncableEntityState?, Future<IList<SyncableEntity>>>(state, {
      SyncableEntityState.TO_UPDATE: () => getEntitiesToUpdate(),
      SyncableEntityState.TO_POST: () => getEntitiesToPost(),
      SyncableEntityState.ERROR: () => getEntitiesWithSyncErrorState(),
      SyncableEntityState.SYNCED: () => getEntitiesWithSyncedState(),

      /// orElse getAll
    }).orElse(() => getEntities());
    final sorted = entities.sort((a, b) => (b.finishedEntryTime ??
            b.startEntryTime ??
            b.name ??
            '')
        .compareTo(a.finishedEntryTime ?? a.startEntryTime ?? a.name ?? ''));
    return sorted;
  }

  /// returns the count of entities by a specified State, and if not specified
  /// returns the count of all entities
  Future<int> getEntitiesCount({SyncableEntityState? state}) async {
    final entities = await getEntitiesByState(state: state);
    return entities.length;
  }

  /// Entities that Entry needs to be finished and status turned to 'COMPLETED'
  /// Entities that are unsynced, dirty and status is not 'COMPLETED'
  Future<IList<SyncableEntity>> getEntitiesToUpdate() async {
    final List<SyncableEntity> entities =
        await d2SyncableQuery
            .resetFilters()
            .withActiveState()
            .get();
    return entities.lock;
  }

  /// Entities that are unsynced, dirty and status is 'COMPLETED'
  Future<IList<SyncableEntity>> getEntitiesToPost() async {
    final List<SyncableEntity> entities = await d2SyncableQuery
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
        await d2SyncableQuery.resetFilters().withSyncErrorState().get();
    return entities.lock;
  }

  // /// Synced entities couldn't be updated for updates that have errors,
  // /// State = to_update but have errors
  // Future<IList<SyncableEntity>> getEntitiesWithUpdateErrorState() async {
  //   final List<SyncableEntity> entities = await d2SyncableQuery
  //       // .resetFilters()
  //       .withUpdateSyncedErrorState()
  //       .get();
  //   return entities.lock;
  // }

  /// Entities that are unsynced, dirty and status is 'COMPLETED'
  Future<IList<SyncableEntity>> getEntitiesWithSyncedState() async {
    final List<SyncableEntity> entities = await d2SyncableQuery
        .resetFilters()
        .where(attribute: 'synced', value: true)
        .get();
    return entities.lock;
  }
}
