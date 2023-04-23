import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../program_view_model.dart';
import 'program_list_item_provider.dart';

class ProgramListItem extends ConsumerWidget {
  const ProgramListItem({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });
  final void Function(ProgramViewModel programViewModel)? onItemClick;
  final void Function(ProgramViewModel programViewModel)? onGranularSyncClick;
  final void Function(ProgramViewModel programViewModel)? onDescriptionClick;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(programViewModelItemProvider);
    return Card(
      color: item.metadataIconData?.programColor,
      child: ListTile(
        onTap: () => onItemClick?.call(item),
        leading: item.metadataIconData?.iconResource ??
            const Icon(Icons.event_note_sharp),
        title: Row(children: [
          Expanded(
            child: Text(item.title),
          ),
          IconButton(
              onPressed: () => onDescriptionClick?.call(item),
              icon: const Icon(Icons.description))
        ]),
        // subtitle: Text('Trailing expansion arrow icon'),
        trailing: item.dirty
            ? ActionChip(
                label: const Icon(
                  Icons.sync,
                ),
                onPressed: () => onGranularSyncClick?.call(item),
              )
            : Icon(
                Icons.check,
                color: Colors.green[300],
              ),
      ),
    );
  }
}
