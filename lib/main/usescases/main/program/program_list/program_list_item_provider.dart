import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../program_view_model.dart';

part 'program_list_item_provider.g.dart';

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
@Riverpod(keepAlive: true)
class ProgramViewModels extends _$ProgramViewModels {
  @override
  IList<ProgramViewModel> build() {
    return IList<ProgramViewModel>();
  }

  void setValue(IList<ProgramViewModel> value) {
    state = value;
  }
}

@riverpod
int programModelItemIndex(ProgramModelItemIndexRef ref) {
  throw UnimplementedError();
}

@riverpod
ProgramViewModel programViewModelItem(ProgramViewModelItemRef ref) {
  final int index = ref.read(programModelItemIndexProvider);
  final ProgramViewModel item = ref.watch(programViewModelsProvider
      .select((IList<ProgramViewModel> e) => e[index]));

  return item;
}
