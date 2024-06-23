import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/activity_forms/activity_form_item.model.dart';
import 'package:mass_pro/data_run/screens/activity_forms/activity_form_item.widget.dart';
import 'package:mass_pro/data_run/screens/activity_forms/activity_form_items_models_notifier.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ActivityFormItemsWidget extends ConsumerStatefulWidget {
  const ActivityFormItemsWidget({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(ActivityFormItemModel? activityViewModel)? onItemClick;
  final void Function(ActivityFormItemModel? activityViewModel)?
      onGranularSyncClick;
  final void Function(ActivityFormItemModel? activityViewModel)?
      onDescriptionClick;

  @override
  ConsumerState<ActivityFormItemsWidget> createState() =>
      _ProjectItemsWidgetState();
}

class _ProjectItemsWidgetState extends ConsumerState<ActivityFormItemsWidget> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    // final itemCount = ref.watch(activityViewModelsProvider
    //     .select((activityModels) => activityModels.value?.length ?? 0));
    final value = ref.watch(activityFormItemsModelsNotifierProvider);
    return value.when(
        data: (data) => ScrollablePositionedList.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) => ProviderScope(
                overrides: [
                  activityFormItemModelProvider.overrideWith((_) => data[index])
                ],
                child: ActivityFormItemWidget(
                  onItemClick: (activityViewModel) =>
                      widget.onItemClick?.call(activityViewModel),
                  onGranularSyncClick: (activityViewModel) =>
                      widget.onGranularSyncClick?.call(activityViewModel),
                  onDescriptionClick: (activityViewModel) =>
                      widget.onDescriptionClick?.call(activityViewModel),
                ),
              ),
              itemScrollController: itemScrollController,
              // itemPositionsListener: itemPositionsListener,
            ),
        error: (error, _) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator());
  }
}
