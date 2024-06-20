import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/activity_data/activity_data.providers.dart';
import 'package:mass_pro/data_run/screens/activity_data/activity_data_item.model.dart';
import 'package:mass_pro/data_run/screens/activity_data/activity_data_item.widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ActivityDataItemsWidget extends ConsumerStatefulWidget {
  const ActivityDataItemsWidget({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(ActivityDataItemModel? programViewModel)? onItemClick;
  final void Function(ActivityDataItemModel? programViewModel)?
      onGranularSyncClick;
  final void Function(ActivityDataItemModel? programViewModel)?
      onDescriptionClick;

  @override
  ConsumerState<ActivityDataItemsWidget> createState() =>
      _ProjectItemsWidgetState();
}

class _ProjectItemsWidgetState extends ConsumerState<ActivityDataItemsWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    // final itemCount = ref.watch(programViewModelsProvider
    //     .select((programModels) => programModels.value?.length ?? 0));
    final itemCount = ref.watch(activityDataItemModelsListLengthProvider).value;
    return itemCount != null
        ? ScrollablePositionedList.builder(
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) => ProviderScope(
              overrides: [
                activityDataItemModelIndexProvider.overrideWith((_) => index)
              ],
              child: ActivityDataItemWidget(
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
