import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/activity_forms/activity_form_item.model.dart';
import 'package:mass_pro/data_run/screens/activity_forms/activity_form_items_models_notifier.dart';

class ActivityFormItemWidget extends ConsumerStatefulWidget {
  const ActivityFormItemWidget({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(ActivityFormItemModel? projectItemModel)? onItemClick;
  final void Function(ActivityFormItemModel? projectItemModel)?
      onGranularSyncClick;
  final void Function(ActivityFormItemModel? projectItemModel)?
      onDescriptionClick;

  @override
  ConsumerState<ActivityFormItemWidget> createState() =>
      _ActivityFormItemWidgetState();
}

class _ActivityFormItemWidgetState
    extends ConsumerState<ActivityFormItemWidget> {
  @override
  Widget build(BuildContext context) {
    final item = ref.watch(activityFormItemModelProvider);
    return Card(
      // color: item?.metadataIconData?.activityColor,
      child: ListTile(
        onTap: () => widget.onItemClick?.call(item),
        leading: item.metadataIconData?.iconResource ??
            const Icon(Icons.event_note_sharp),
        title: Row(children: [
          Expanded(
            child: Text(item.title ?? ''),
          ),
          IconButton(
              onPressed: () => widget.onDescriptionClick?.call(item),
              icon: const Icon(Icons.description))
        ]),
        // subtitle: Text('Trailing expansion arrow icon'),
        trailing: item.dirty ?? false
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
  }
}
