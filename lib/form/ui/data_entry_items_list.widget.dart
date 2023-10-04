import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../commons/custom_widgets/mixins/keyboard_manager.dart';
import 'data_entry_item.widget.dart';
import 'event/list_view_ui_events.dart';
import 'intent/form_intent.dart';
import 'view_model/form_view_model_notifier.dart';

class DataEntryItemListWidget extends ConsumerStatefulWidget {
  const DataEntryItemListWidget(
      {super.key,
      required this.itemsCount,
      this.onIntent,
      // required this.records,
      this.onListViewUiEvents,
      this.searchStyle = false});

  final int itemsCount;

  // final FormRepositoryRecords records;

  final void Function(FormIntent intent)? onIntent;
  final void Function(ListViewUiEvents uiEvent)? onListViewUiEvents;

  final bool searchStyle;

  @override
  ConsumerState<DataEntryItemListWidget> createState() =>
      DataEntryItemListWidgetState();
}

class DataEntryItemListWidgetState
    extends ConsumerState<DataEntryItemListWidget> with KeyboardManager {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    // final itemCount = ref
    //     .watch(formViewItemsProvider.select((list) => list.value?.length ?? 0));
    // final items = ref.watch(formViewModelNotifierProvider());
    // final itemCount = items.value?.length ?? 0;
    debugPrint('build(): $runtimeType, item.count ${widget.itemsCount}');

    return widget.itemsCount > 0
        ? ScrollablePositionedList.builder(
            shrinkWrap: true,
            itemCount: widget.itemsCount,
            itemBuilder: (BuildContext context, int index) => ProviderScope(
              overrides: [formViewIndexProvider.overrideWith((_) => index)],
              child: DataEntryItemWidget(
                onIntent: (intent) {
                  if (intent is OnNext) {
                    // scrollToPosition(intent.position!);
                  }
                  widget.onIntent?.call(intent);
                },
                onListViewUiEvents: (uiEvent) =>
                    widget.onListViewUiEvents?.call(uiEvent),
                // records: widget.records,
              ),
            ),
            itemScrollController: itemScrollController,
            // itemPositionsListener: itemPositionsListener,
          )
        : const SizedBox.shrink();
  }

  @override
  void initState() {
    // final records = ref.read(formRepositoryRecordsInstanceProvider);
    super.initState();
  }
}
