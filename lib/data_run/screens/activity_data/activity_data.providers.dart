import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/activity_data/activity_data_item.model.dart';
import 'package:mass_pro/data_run/screens/activity_data/activity_data_repository.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'activity_data.providers.g.dart';

@riverpod
ActivityDataRepository activityDataRepository(ActivityDataRepositoryRef ref) {
  return ActivityDataRepository(ref);
}

@riverpod
Future<IList<ActivityDataItemModel>> activityDataItemModels(
    ActivityDataItemModelsRef ref) {
  final syncStatusData = ref.watch(syncStatusControllerInstanceProvider
      .select((value) => value.syncStatusData));
  final items = ref
      .read(activityDataRepositoryProvider)
      .activityDataItems(syncStatusData);
  return items;
}

@riverpod
Future<int> activityDataItemModelsListLength(
    ActivityDataItemModelsListLengthRef ref) {
  return ref.watch(activityDataItemModelsProvider
      .selectAsync((IList<ActivityDataItemModel> list) => list.length));
}

@riverpod
int activityDataItemModelIndex(ActivityDataItemModelIndexRef ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: [activityDataItemModelIndex])
ActivityDataItemModel? activityDataItemModel(ActivityDataItemModelRef ref) {
  final IList<ActivityDataItemModel>? items =
      ref.watch(activityDataItemModelsProvider).value;
  if (items != null && items.isNotEmpty) {
    final int index = ref.watch(activityDataItemModelIndexProvider);
    return items[index];
  }
  return null;
}
