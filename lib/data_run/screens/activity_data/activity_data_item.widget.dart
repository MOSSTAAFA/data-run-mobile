import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/activity_data/activity_data.providers.dart';
import 'package:mass_pro/data_run/screens/activity_data/activity_data_item.model.dart';

class ActivityDataItemWidget extends ConsumerStatefulWidget {
  const ActivityDataItemWidget({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(ActivityDataItemModel? projectItemModel)? onItemClick;
  final void Function(ActivityDataItemModel? projectItemModel)?
      onGranularSyncClick;
  final void Function(ActivityDataItemModel? projectItemModel)?
      onDescriptionClick;

  @override
  ConsumerState<ActivityDataItemWidget> createState() =>
      _ActivityDataItemWidgetState();
}

class _ActivityDataItemWidgetState
    extends ConsumerState<ActivityDataItemWidget> {
  @override
  Widget build(BuildContext context) {
    final item = ref.watch(activityDataItemModelProvider);
    return Card(
      // color: item?.metadataIconData?.programColor,
      child: ListTile(
        onTap: () => widget.onItemClick?.call(item),
        leading: item?.metadataIconData?.iconResource ??
            const Icon(Icons.event_note_sharp),
        title: Row(children: [
          Expanded(
            child: Text(item?.title ?? ''),
          ),
          IconButton(
              onPressed: () => widget.onDescriptionClick?.call(item),
              icon: const Icon(Icons.description))
        ]),
        // subtitle: Text('Trailing expansion arrow icon'),
        trailing: item?.dirty ?? false
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
