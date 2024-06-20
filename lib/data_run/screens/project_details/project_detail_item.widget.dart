import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_items_models_notifier.dart';

class ProjectDetailItemWidget extends ConsumerStatefulWidget {
  const ProjectDetailItemWidget({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(ProjectDetailItemModel? projectItemModel)? onItemClick;
  final void Function(ProjectDetailItemModel? projectItemModel)?
      onGranularSyncClick;
  final void Function(ProjectDetailItemModel? projectItemModel)?
      onDescriptionClick;

  @override
  ConsumerState<ProjectDetailItemWidget> createState() =>
      _ProjectDetailItemWidgetState();
}

class _ProjectDetailItemWidgetState
    extends ConsumerState<ProjectDetailItemWidget> {
  @override
  Widget build(BuildContext context) {
    final item = ref.watch(projectDetailItemModelProvider);
    return Card(
      // color: item?.metadataIconData?.programColor,
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
