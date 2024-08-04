import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_item.model.dart';
import 'package:mass_pro/data_run/screens/dashboard/dashboard_deck/dashboard_items_models_notifier.dart';

class DashboardItemWidget extends ConsumerStatefulWidget {
  const DashboardItemWidget({
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
  ConsumerState<DashboardItemWidget> createState() =>
      _DashboardItemWidgetState();
}

class _DashboardItemWidgetState extends ConsumerState<DashboardItemWidget> {
  @override
  Widget build(BuildContext context) {
    final item = ref.watch(dashboardItemModelProvider);
    return Card(
      shadowColor: Theme.of(context).colorScheme.shadow,
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      // color: item?.metadataIconData?.programColor,
      child: ListTile(
        onTap: () => widget.onItemClick?.call(item),
        leading: item.metadataIconData?.iconResource ??
            const Icon(Icons.event_note_sharp),
        title: Row(children: [
          Expanded(
            child: Text(item.title),
          ),
          IconButton(
              onPressed: () => widget.onDescriptionClick?.call(item),
              icon: const Icon(Icons.description))
        ]),
        // subtitle: Text('Trailing expansion arrow icon'),
        trailing: item.dirty
            ? ActionChip(
                label: const Icon(
                  Icons.sync,
                ),
                onPressed: () => widget.onGranularSyncClick?.call(item),
              )
            : Icon(
                Icons.check,
                color: Colors.green[300],
              ),
      ),
    );
    // }, error: (AsyncError<ProgramViewModel> error) {
    //   throw error;
    // }, loading: (AsyncLoading<ProgramViewModel> loading) {
    //   return SizedBox();
    // });
  }
}
