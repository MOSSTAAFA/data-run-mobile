import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:datarun/data_run/screens/home_screen/home_deck/home_item.model.dart';
import 'package:datarun/data_run/screens/home_screen/home_deck/home_items_models_notifier.dart';

class HomeItem extends ConsumerStatefulWidget {
  const HomeItem({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(HomeItemModel? homeDeckItemModel)? onItemClick;
  final void Function(HomeItemModel? homeDeckItemModel)?
      onGranularSyncClick;
  final void Function(HomeItemModel? homeDeckItemModel)?
      onDescriptionClick;

  @override
  ConsumerState<HomeItem> createState() =>
      _HomeItemState();
}

class _HomeItemState extends ConsumerState<HomeItem> {
  @override
  Widget build(BuildContext context) {
    final item = ref.watch(homeItemModelProvider);
    return Card(
      shadowColor: Theme.of(context).colorScheme.shadow,
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      // color: item?.metadataIconData?.programColor,
      child: ListTile(
        onTap: () => widget.onItemClick?.call(item),
        leading:
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
