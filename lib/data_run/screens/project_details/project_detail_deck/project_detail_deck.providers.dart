import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_deck.view.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_deck_presenter.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_deck_repository.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_deck_repository_impl.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_deck/project_detail_item.model.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_detail_deck.providers.g.dart';

/// Project Deck Items Providers
@riverpod
ProjectDetailDeckPresenter projectDetailDeckPresenter(
    ProjectDetailDeckPresenterRef ref, ProjectDetailDeckView view) {
  return ProjectDetailDeckPresenter(ref, view);
}

@riverpod
ProjectDetailDeckRepository projectDetailDeckRepository(
    ProjectDetailDeckRepositoryRef ref) {
  return ProjectDetailDeckRepositoryImpl(ref);
}

@riverpod
Future<IList<ProjectDetailItemModel>> projectDetailItemModels(
    ProjectDetailItemModelsRef ref) {
  final syncStatusData = ref.watch(syncStatusControllerInstanceProvider
      .select((value) => value.syncStatusData));
  final items = ref
      .read(projectDetailDeckRepositoryProvider)
      .projectDetailDeckItems(syncStatusData);
  return items;
}

@riverpod
Future<int> projectDetailItemModelsListLength(
    ProjectDetailItemModelsListLengthRef ref) {
  return ref.watch(projectDetailItemModelsProvider
      .selectAsync((IList<ProjectDetailItemModel> list) => list.length));
}

@riverpod
int projectDetailItemModelIndex(ProjectDetailItemModelIndexRef ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: [projectDetailItemModelIndex])
ProjectDetailItemModel? projectDetailItemModel(ProjectDetailItemModelRef ref) {
  final IList<ProjectDetailItemModel>? items =
      ref.watch(projectDetailItemModelsProvider).value;
  if (items != null && items.isNotEmpty) {
    final int index = ref.watch(projectDetailItemModelIndexProvider);
    return items[index];
  }
  return null;
}
