import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_repository.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_detail.providers.g.dart';

@riverpod
ProjectDetailRepository projectDetailRepository(
    ProjectDetailRepositoryRef ref) {
  return ProjectDetailRepository(ref);
}

@riverpod
Future<IList<ProjectDetailItemModel>> projectDetailItemModels(
    ProjectDetailItemModelsRef ref) {
  final syncStatusData = ref.watch(syncStatusControllerInstanceProvider
      .select((value) => value.syncStatusData));
  final items = ref
      .read(projectDetailRepositoryProvider)
      .projectDetailItems(syncStatusData);
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
