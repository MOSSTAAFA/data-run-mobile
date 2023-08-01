import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../commons/custom_widgets/mixins/keyboard_manager.dart';
import 'data_entry_item.widget.dart';
import 'di/form_view_controllers.dart';
import 'event/list_view_ui_events.dart';
import 'intent/form_intent.dart';

class DataEntryItemListWidget extends ConsumerStatefulWidget {
  const DataEntryItemListWidget(
      {super.key,
      this.onIntent,
      this.onListViewUiEvents,
      this.searchStyle = false});

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
    final itemCount = ref
        .watch(itemsResultProvider.select((list) => list.value?.length ?? 0));

    return itemCount > 0
        ? ScrollablePositionedList.builder(
            shrinkWrap: true,
            itemCount: itemCount,
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
              ),
            ),
            itemScrollController: itemScrollController,
            // itemPositionsListener: itemPositionsListener,
          )
        : const SizedBox.shrink();
  }
  @override
  void initState() {
    final records = ref.read(formRepositoryRecordsInstanceProvider);
    super.initState();
  }
}
