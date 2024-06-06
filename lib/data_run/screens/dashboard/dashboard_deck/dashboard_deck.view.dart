import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/data_run/screens/general/view_base.dart';

mixin DashboardDeckView implements ViewBase {
  void showFilterProgress();

  void showHideFilter();

  void clearFilters();

  void navigateTo(DashboardItemModel dh);

  @override
  Future<void> showSyncDialog<T>([T? program]);
}
