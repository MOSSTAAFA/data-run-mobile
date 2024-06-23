import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/project_details/form_entity_mapped_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'entities_riverpod_providers.g.dart';

@riverpod
Future<IList<SyncableEntity>> entitiesByStatus(EntitiesByStatusRef ref,
    {required String formCode, SyncableEntityState? entityStatus}) async {
  return ref
      .watch(formEntityMappedRepositoryProvider(formCode))
      .getEntitiesByState(state: entityStatus);
}
