import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck.view.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck_presenter.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck_repository.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck_repository_impl.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_item.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_deck.providers.g.dart';

/// Project Deck Items Providers
@Riverpod(keepAlive: true)
ProjectDeckPresenter projectDeckPresenter(ProjectDeckPresenterRef ref, ProjectDeckView view) {
  return ProjectDeckPresenter(ref, view, ref.read(projectDeckRepositoryProvider));
}

@Riverpod(keepAlive: true)
ProjectDeckRepository projectDeckRepository(ProjectDeckRepositoryRef ref) {
  return ProjectDeckRepositoryImpl(
      ref);
}

@riverpod
Future<IList<ProjectItemModel>> projectItemModels(
    ProjectItemModelsRef ref) {
  final syncStatusData = ref.watch(syncStatusControllerInstanceProvider
      .select((value) => value.syncStatusData));
  final items =
      ref.read(projectDeckRepositoryProvider).homeItems(syncStatusData);
  return items;
}

@riverpod
Future<int> projectItemModelsListLength(
    ProjectItemModelsListLengthRef ref) {
  return ref.watch(projectItemModelsProvider
      .selectAsync((IList <ProjectItemModel> list) => list.length));
}

@riverpod
int projectItemModelIndex(ProjectItemModelIndexRef ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: [projectItemModelIndex])
ProjectItemModel? projectItemModel(ProjectItemModelRef ref) {
  final IList<ProjectItemModel>? items =
      ref.watch(projectItemModelsProvider).value;
  if (items != null && items.isNotEmpty) {
    final int index = ref.watch(projectItemModelIndexProvider);
    return items[index];
  }
  return null;
}
