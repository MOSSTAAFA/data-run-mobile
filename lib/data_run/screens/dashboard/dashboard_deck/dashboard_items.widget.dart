import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_deck.providers.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DashboardItemsWidget extends ConsumerStatefulWidget {
  const DashboardItemsWidget({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(DashboardItemModel? programViewModel)? onItemClick;
  final void Function(DashboardItemModel? programViewModel)?
      onGranularSyncClick;
  final void Function(DashboardItemModel? programViewModel)? onDescriptionClick;

  @override
  ConsumerState<DashboardItemsWidget> createState() =>
      _DashboardItemsWidgetState();
}

class _DashboardItemsWidgetState
    extends ConsumerState<DashboardItemsWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    // final itemCount = ref.watch(programViewModelsProvider
    //     .select((programModels) => programModels.value?.length ?? 0));
    final itemCount = ref.watch(dashboardItemModelsListLengthProvider).value;
    return itemCount != null
        ? ScrollablePositionedList.builder(
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) => ProviderScope(
              overrides: [
                dashboardItemModelIndexProvider.overrideWith((_) => index)
              ],
              child: DashboardItemWidget(
                onItemClick: (programViewModel) =>
                    widget.onItemClick?.call(programViewModel),
                onGranularSyncClick: (programViewModel) =>
                    widget.onGranularSyncClick?.call(programViewModel),
                onDescriptionClick: (programViewModel) =>
                    widget.onDescriptionClick?.call(programViewModel),
              ),
            ),
            itemScrollController: itemScrollController,
            // itemPositionsListener: itemPositionsListener,
          )
        : const SizedBox.shrink();
  }
}
