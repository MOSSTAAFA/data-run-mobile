import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../program_view.model.dart';
import 'program_list_item.widget.dart';
import 'program_list_item_providers.dart';

class ProgramList extends ConsumerStatefulWidget {
  const ProgramList({
    super.key,
    required this.onItemClick,
    required this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(ProgramViewModel? programViewModel)? onItemClick;
  final void Function(ProgramViewModel? programViewModel)? onGranularSyncClick;
  final void Function(ProgramViewModel? programViewModel)? onDescriptionClick;

  @override
  ConsumerState<ProgramList> createState() => _ProgramListState();
}

class _ProgramListState extends ConsumerState<ProgramList> {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    // final itemCount = ref.watch(programViewModelsProvider
    //     .select((programModels) => programModels.value?.length ?? 0));
    final itemCount = ref.watch(programModelItemsListLengthProvider).value;
    return itemCount != null
        ? ScrollablePositionedList.builder(
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (BuildContext context, int index) => ProviderScope(
              overrides: [
                programModelItemIndexProvider.overrideWith((_) => index)
              ],
              child: ProgramListItem(
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
