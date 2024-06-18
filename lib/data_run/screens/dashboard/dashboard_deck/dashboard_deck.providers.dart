import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck_repository.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/main/data/service/sync_status_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_deck.providers.g.dart';

@Riverpod(keepAlive: true)
DashboardDeckRepository dashboardDeckRepository(
    DashboardDeckRepositoryRef ref) {
  return DashboardDeckRepository(ref);
}

@riverpod
Future<IList<DashboardItemModel>> dashboardItemModels(
    DashboardItemModelsRef ref) {
  final syncStatusData = ref.watch(syncStatusControllerInstanceProvider
      .select((value) => value.syncStatusData));
  final items =
      ref.read(dashboardDeckRepositoryProvider).deckItems(syncStatusData);
  return items;
}

@riverpod
Future<int> dashboardItemModelsListLength(
    DashboardItemModelsListLengthRef ref) {
  return ref.watch(dashboardItemModelsProvider
      .selectAsync((IList<DashboardItemModel> list) => list.length));
}

@riverpod
int dashboardItemModelIndex(DashboardItemModelIndexRef ref) {
  throw UnimplementedError();
}

@Riverpod(dependencies: [dashboardItemModelIndex])
DashboardItemModel? dashboardItemModel(DashboardItemModelRef ref) {
  final IList<DashboardItemModel>? items =
      ref.watch(dashboardItemModelsProvider).value;
  if (items != null && items.isNotEmpty) {
    final int index = ref.watch(dashboardItemModelIndexProvider);
    return items[index];
  }
  return null;
}
