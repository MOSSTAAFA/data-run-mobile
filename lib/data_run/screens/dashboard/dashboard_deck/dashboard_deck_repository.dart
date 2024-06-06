import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/main/data/service/sync_status_data.dart';

abstract class DashboardDeckRepository {
  Future<IList<DashboardItemModel>> homeItems(SyncStatusData syncStatusData);

  Future<IList<DashboardItemModel>> programModels(
      SyncStatusData syncStatusData);

  Future<IList<DashboardItemModel>> aggregatesModels(
      SyncStatusData syncStatusData);
}
