import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/extensions/dynamic_extensions.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_items.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_screen.widget.dart';
import 'package:mass_pro/data_run/screens/view/view_base.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

class DashboardDeckWidget extends ConsumerStatefulWidget {
  const DashboardDeckWidget({super.key});

  @override
  ConsumerState<DashboardDeckWidget> createState() =>
      _DashboardDeckWidgetState();
}

class _DashboardDeckWidgetState extends ConsumerState<DashboardDeckWidget>
    with ViewBase {
  Bundle bundle = Bundle();

  @override
  Widget build(BuildContext context) {
    return DashboardItemsWidget(
      onItemClick: (dashboardItemModel) => navigateTo(dashboardItemModel!),
      onGranularSyncClick: (dashboardItemModel) =>
          showSyncDialog(dashboardItemModel!),
      onDescriptionClick: (dashboardItemModel) =>
          dashboardItemModel?.description != null
              ? showDescription(dashboardItemModel!.description!)
              : null,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void clearFilters() {
    // TODO: implement clearFilters
  }

  void navigateTo(DashboardItemModel dashboardItem) {
    bundle = bundle.putString(EXTRA_PROJECT_UID, dashboardItem.uid);
    logInfo(info: '$EXTRA_PROJECT_UID, ${dashboardItem.uid}');
    // navigatorKey.currentState!
    //     .pushNamed(ProjectDetailScreenWidget.route, arguments: bundle);
    Get.to(const ProjectDetailScreenWidget(), arguments: bundle);
    // ref
    //     .read(appStateNotifierProvider.notifier)
    //     .gotToNextRoute(ProjectDetailScreenWidget(), arguments: bundle);
    // ref
    //     .read(appStateNotifierProvider.notifier)
    //     .navigateToScreen(const ProjectDetailScreenWidget(), bundle: bundle);
    // Navigator.of(context).pushNamed(ProjectDetailScreenWidget.route, arguments: bundle);
  }

  void showFilterProgress() {
    // TODO: implement showFilterProgress
  }

  void showHideFilter() {
    // TODO: implement showHideFilter
  }

  @override
  Future<void> showSyncDialog<DashboardItemModel>(
      [DashboardItemModel? program]) async {}
}
