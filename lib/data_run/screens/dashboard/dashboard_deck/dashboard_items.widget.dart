import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.widget.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_items_models_notifier.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/get_error_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DashboardItemsWidget extends ConsumerStatefulWidget {
  const DashboardItemsWidget({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(DashboardItemModel? dashboardItemModel)? onItemClick;
  final void Function(DashboardItemModel? dashboardItemModel)?
      onGranularSyncClick;
  final void Function(DashboardItemModel? dashboardItemModel)?
      onDescriptionClick;

  @override
  ConsumerState<DashboardItemsWidget> createState() =>
      _DashboardItemsWidgetState();
}

class _DashboardItemsWidgetState extends ConsumerState<DashboardItemsWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(dashboardItemsModelsNotifierProvider);
    return value.when(
        data: (data) => ScrollablePositionedList.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) => ProviderScope(
                overrides: [
                  dashboardItemModelProvider.overrideWith((_) => data[index])
                ],
                child: DashboardItemWidget(
                  onItemClick: (dashboardItemModel) =>
                      widget.onItemClick?.call(dashboardItemModel),
                  onGranularSyncClick: (dashboardItemModel) =>
                      widget.onGranularSyncClick?.call(dashboardItemModel),
                  onDescriptionClick: (dashboardItemModel) =>
                      widget.onDescriptionClick?.call(dashboardItemModel),
                ),
              ),
              itemScrollController: itemScrollController,
              // itemPositionsListener: itemPositionsListener,
            ),
        error: (Object error, StackTrace s) => getErrorWidget(error, s),
        loading: () => const CircularProgressIndicator());
  }
}
