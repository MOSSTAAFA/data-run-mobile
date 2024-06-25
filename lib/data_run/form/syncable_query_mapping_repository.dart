import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/core/d2_remote_extensions/tracker/queries/base_query_extension.dart';
import 'package:mass_pro/data_run/form/syncable_entity_initial_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncable_query_mapping_repository.g.dart';

@riverpod
SyncableEntityInitialRepository syncableEntityInitialRepository(
    SyncableEntityInitialRepositoryRef ref,
    {required String formCode,
      String? syncableUid}) {
  return SyncableEntityInitialRepository(ref,
      syncableQueryMappingRepository:
      ref.watch(syncableQueryMappingRepositoryProvider(formCode)),
      syncableUid: syncableUid);
}

@riverpod
SyncableQueryMappingRepository syncableQueryMappingRepository(
    SyncableQueryMappingRepositoryRef ref, String formCode) {
  return SyncableQueryMappingRepository(formCode);
}

class SyncableQueryMappingRepository {
  SyncableQueryMappingRepository(this.formCode);

  final String formCode;

  /// Getting the Query, latter we need to make it more Dynamic depending on the
  /// form and permissions, now we need to provide one of the
  /// following available forms:
  /// ['CHV_PATIENTS_FORM', 'CHV_SESSIONS_FORM', 'ITN_DISTRIBUTION_FORM']
  SyncableQuery getEntityQuery() {
    final SyncableQuery query = when<String?, SyncableQuery>(formCode, {
      'CHV_PATIENTS_FORM': () => D2Remote.iccmModule.chvRegister,
      'CHV_SESSIONS_FORM': () => D2Remote.iccmModule.chvSession,
      'ITN_DISTRIBUTION_FORM': () => D2Remote.itnsVillageModule.itnsVillage,
    }).orElse(() => throw Exception('UnAvailable Entity for Form: $formCode'));
    return query;
  }

  /// returns all entities
  Future<DynamicForm?> getForm() async {
    return D2Remote.formModule.form
        .where(attribute: 'code', value: formCode)
        .getOne();
  }

  /// returns all entities
  Future<IList<SyncableEntity>> getEntities() async {
    final List<SyncableEntity> entities =
        await getEntityQuery().resetFilters().get();
    return entities.lock;
  }

  /// get status based on the status of All entities
  Future<SyncableEntityState> getStatus() async {
    final withSyncErrorState =
        await getEntityQuery().resetFilters().withSyncErrorState().count();

    final withUpdateErrorState = await getEntityQuery()
        .resetFilters()
        .withUpdateSyncedErrorState()
        .count();

    final withToPostState =
        await getEntityQuery().resetFilters().withToPostState().count();
    final withToUpdateState =
        await getEntityQuery().resetFilters().withToUpdateState().count();

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
    final List<SyncableEntity> entities = await getEntityQuery()
        .resetFilters()
        .whereNeq(attribute: 'status', value: 'COMPLETED')
        .where(attribute: 'synced', value: false)
        .get();
    return entities.lock;
  }

  /// Entities that are unsynced, dirty and status is 'COMPLETED'
  Future<IList<SyncableEntity>> getEntitiesToPost() async {
    final List<SyncableEntity> entities = await getEntityQuery()
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
        await getEntityQuery().resetFilters().withSyncErrorState().get();
    return entities.lock;
  }

  /// Synced entities couldn't be updated for updates that have errors,
  /// State = to_update but have errors
  Future<IList<SyncableEntity>> getEntitiesWithUpdateErrorState() async {
    final List<SyncableEntity> entities = await getEntityQuery()
        .resetFilters()
        .withUpdateSyncedErrorState()
        .get();
    return entities.lock;
  }

  /// Entities that are unsynced, dirty and status is 'COMPLETED'
  Future<IList<SyncableEntity>> getEntitiesWithSyncedState() async {
    final List<SyncableEntity> entities = await getEntityQuery()
        .resetFilters()
        .where(attribute: 'synced', value: true)
        .get();
    return entities.lock;
  }
}
