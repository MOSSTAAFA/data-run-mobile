// import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:mass_pro/core/common/state.dart';
// import 'package:mass_pro/data_run/form/form.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'entities_riverpod_providers.g.dart';
//
// @riverpod
// Future<IList<DataFormSubmission>> entitiesByStatus(EntitiesByStatusRef ref,
//     {required String formCode,
//     SyncableEntityState? entityStatus,
//     String sortBy = 'name'}) async {
//   final ddd = await ref
//       .watch(entityFormListingRepositoryProvider(formCode))
//       .getEntitiesByState(state: entityStatus);
//   return ddd;
// }
