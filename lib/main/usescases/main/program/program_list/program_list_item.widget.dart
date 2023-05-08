import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../program_view.model.dart';
import 'program_list_item_providers.dart';

class ProgramListItem extends ConsumerStatefulWidget {
  const ProgramListItem({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(ProgramViewModel? programViewModel)? onItemClick;
  final void Function(ProgramViewModel? programViewModel)? onGranularSyncClick;
  final void Function(ProgramViewModel? programViewModel)? onDescriptionClick;

  @override
  ConsumerState<ProgramListItem> createState() => _ProgramListItemState();
}

class _ProgramListItemState extends ConsumerState<ProgramListItem> {
  @override
  Widget build(BuildContext context) {
    final item = ref.watch(programViewModelItemProvider);
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
