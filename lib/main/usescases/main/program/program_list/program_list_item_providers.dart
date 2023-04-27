import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../data/service/sync_status_controller.dart';
import '../di/program_providers.dart';
import '../program_view.model.dart';

part 'program_list_item_providers.g.dart';

// @riverpod
// class ProgramModel extends _$ProgramModel {
//   @override
//   ProgramViewModel build() {
//     return ProgramViewModel();
//   }

//   void setValue(ProgramViewModel value) {
//     state = value;
//   }

//   void setCompleteSyncAnimation() {
//     state = state.copyWith(hasShownCompleteSyncAnimation: true);
//   }
// }
// @Riverpod(keepAlive: true)
// class ProgramViewModels extends _$ProgramViewModels {
//   @override
//   IList<ProgramViewModel> build() {
//     return IList<ProgramViewModel>();
//   }

//   void setValue(IList<ProgramViewModel> value) {
//     state = value;
//   }
// }

@riverpod
Future<IList<ProgramViewModel>> programViewModels(ProgramViewModelsRef ref) {
  final syncStatusData = ref.watch(syncStatusControllerInstanceProvider
      .select((value) => value.syncStatusData));
  return ref.read(programRepositoryProvider).homeItems(syncStatusData);
}

@riverpod
int programModelItemIndex(ProgramModelItemIndexRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<ProgramViewModel> programViewModelItem(ProgramViewModelItemRef ref) {
  final int index = ref.read(programModelItemIndexProvider);
  final item = ref.watch(programViewModelsProvider
      .selectAsync((IList<ProgramViewModel> e) => e[index]));

  return item;
}
