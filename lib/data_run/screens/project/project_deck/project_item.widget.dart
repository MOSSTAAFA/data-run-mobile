import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_deck.providers.dart';
import 'package:mass_pro/data_run/screens/project/project_deck/project_item.model.dart';

class ProjectItemWidget extends ConsumerStatefulWidget {
  const ProjectItemWidget({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(ProjectItemModel? projectItemModel)? onItemClick;
  final void Function(ProjectItemModel? projectItemModel)? onGranularSyncClick;
  final void Function(ProjectItemModel? projectItemModel)? onDescriptionClick;

  @override
  ConsumerState<ProjectItemWidget> createState() => _ProjectItemWidgetState();
}

class _ProjectItemWidgetState extends ConsumerState<ProjectItemWidget> {
  @override
  Widget build(BuildContext context) {
    final item = ref.watch(projectItemModelProvider);
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
