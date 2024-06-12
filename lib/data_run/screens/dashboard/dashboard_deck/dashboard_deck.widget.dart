import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/extensions/dynamic_extensions.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck.providers.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck.view.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck_presenter.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_items.widget.dart';
import 'package:mass_pro/data_run/screens/general/view_base.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_screen.widget.dart';
import 'package:mass_pro/data_run/utils/screens_constants.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

import '../../../../utils/navigator_key.dart';

/// ProgramFragment
class DashboardDeckWidget extends ConsumerStatefulWidget {
  const DashboardDeckWidget({super.key});

  @override
  ConsumerState<DashboardDeckWidget> createState() =>
      _DashboardDeckWidgetState();
}

class _DashboardDeckWidgetState extends ConsumerState<DashboardDeckWidget>
    with DashboardDeckView, ViewBase {
  Bundle bundle = Bundle();
  late final KeepAliveLink bundleKeepAliveLink;
  late final DashboardDeckPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return DashboardItemsWidget(
      onItemClick: (dashboardItemModel) =>
          presenter.onItemClick(dashboardItemModel!),
      onGranularSyncClick: (dashboardItemModel) =>
          presenter.onSyncStatusClick(dashboardItemModel!),
      onDescriptionClick: (dashboardItemModel) =>
          presenter.showDescription(dashboardItemModel?.description),
    );
  }

  @override
  void initState() {
    // bundle = ref.read(bundleObjectProvider.notifier).ref;
    // bundleKeepAliveLink = ref.read(bundleObjectProvider.notifier).ref.keepAlive();
    presenter = ref.read(dashboardDeckPresenterProvider(this));
    super.initState();
  }

  @override
  void clearFilters() {
    // TODO: implement clearFilters
  }

  @override
  void navigateTo(DashboardItemModel dashboardItem) {
    bundle = bundle.putString(EXTRA_PROJECT_UID, dashboardItem.uid);
    logInfo(info: '$EXTRA_PROJECT_UID, ${dashboardItem.uid}');
    navigatorKey.currentState!
        .pushNamed(ProjectDetailScreenWidget.route, arguments: bundle);
    // ref
    //     .read(appStateNotifierProvider.notifier)
    //     .gotToNextRoute(ProjectDetailScreenWidget(), arguments: bundle);
    // ref
    //     .read(appStateNotifierProvider.notifier)
    //     .navigateToScreen(const ProjectDetailScreenWidget(), bundle: bundle);
    // Navigator.of(context).pushNamed(ProjectDetailScreenWidget.route, arguments: bundle);
  }

  @override
  void showFilterProgress() {
    // TODO: implement showFilterProgress
  }

  @override
  void showHideFilter() {
    // TODO: implement showHideFilter
  }

  @override
  Future<void> showSyncDialog<DashboardItemModel>(
      [DashboardItemModel? program]) async {}
}
