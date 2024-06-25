import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/form/syncable_query_mapping_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entities_riverpod_providers.g.dart';

@riverpod
Future<IList<SyncableEntity>> entitiesByStatus(EntitiesByStatusRef ref,
    {required String formCode, SyncableEntityState? entityStatus}) async {
  return ref
      .watch(syncableQueryMappingRepositoryProvider(formCode))
      .getEntitiesByState(state: entityStatus);
}
