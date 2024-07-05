import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/core/d2_remote_extensions/tracker/queries/base_query_extension.dart';
import 'package:mass_pro/data_run/form/form_fields_repository.dart';
import 'package:mass_pro/data_run/form/syncable_entity_initial_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entity_form_listing_repository.g.dart';

@riverpod
SyncableEntityInitialRepository syncableEntityInitialRepository(
    SyncableEntityInitialRepositoryRef ref,
    {required String formCode,
    String? syncableUid}) {
  final d2SyncableQuery =
      ref.watch(databaseSyncableQueryProvider(formCode)).provideQuery();
  return SyncableEntityInitialRepository(ref,
      d2SyncableQuery: d2SyncableQuery, syncableUid: syncableUid);
}

@riverpod
EntityFormListingRepository entityFormListingRepository(
    EntityFormListingRepositoryRef ref, String formCode) {
  final d2SyncableQuery =
      ref.watch(databaseSyncableQueryProvider(formCode)).provideQuery();
  return EntityFormListingRepository(d2SyncableQuery: d2SyncableQuery);
}

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

    final withUpdateErrorState = await d2SyncableQuery
        .resetFilters()
        .withUpdateSyncedErrorState()
        .count();

    final withToPostState =
        await d2SyncableQuery.resetFilters().withToPostState().count();
    final withToUpdateState =
        await d2SyncableQuery.resetFilters().withToUpdateState().count();

    return when(true, {
      withUpdateErrorState > 0 || withSyncErrorState > 0: () =>
          SyncableEntityState.WARNING,
      withToPostState > 0: () => SyncableEntityState.TO_POST,
      withToUpdateState > 0: () => SyncableEntityState.TO_UPDATE,
    }).orElse(() => SyncableEntityState.SYNCED);
  }

  /// returns entities by a specified State, and if not specified
  /// returns all entities
  Future<IList<SyncableEntity>> getEntitiesByState(
      {SyncableEntityState? state}) async {
    final IList<SyncableEntity> entities =
        await when<SyncableEntityState?, Future<IList<SyncableEntity>>>(state, {
      SyncableEntityState.TO_UPDATE: () => getEntitiesToUpdate(),
      SyncableEntityState.TO_POST: () => getEntitiesToPost(),
      SyncableEntityState.ERROR: () async {
        IList<SyncableEntity> withSyncErrorState =
            await getEntitiesWithSyncErrorState();
        withSyncErrorState =
            withSyncErrorState.addAll(await getEntitiesWithUpdateErrorState());
        return withSyncErrorState;
      },
      SyncableEntityState.SYNCED: () => getEntitiesWithSyncedState(),

      /// orElse getAll
    }).orElse(() => getEntities());
    return entities;
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
    final List<SyncableEntity> entities = await d2SyncableQuery
        .resetFilters()
        .whereNeq(attribute: 'status', value: 'COMPLETED')
        .where(attribute: 'synced', value: false)
        .get();
    return entities.lock;
  }

  /// Entities that are unsynced, dirty and status is 'COMPLETED'
  Future<IList<SyncableEntity>> getEntitiesToPost() async {
    final List<SyncableEntity> entities = await d2SyncableQuery
        .resetFilters()
        .where(attribute: 'status', value: 'COMPLETED')
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

  /// Synced entities couldn't be updated for updates that have errors,
  /// State = to_update but have errors
  Future<IList<SyncableEntity>> getEntitiesWithUpdateErrorState() async {
    final List<SyncableEntity> entities =
        await d2SyncableQuery.resetFilters().withUpdateSyncedErrorState().get();
    return entities.lock;
  }

  /// Entities that are unsynced, dirty and status is 'COMPLETED'
  Future<IList<SyncableEntity>> getEntitiesWithSyncedState() async {
    final List<SyncableEntity> entities = await d2SyncableQuery
        .resetFilters()
        .where(attribute: 'synced', value: true)
        .get();
    return entities.lock;
  }
}
