import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../commons/custom_widgets/mixins/keyboard_manager.dart';
import 'data_entry_item.widget.dart';
import 'form_view_model.dart';

class DataEntryItemListWidget extends ConsumerStatefulWidget {
  const DataEntryItemListWidget({super.key, this.searchStyle = false});

  final bool searchStyle;

  @override
  ConsumerState<DataEntryItemListWidget> createState() => DataEntryItemListWidgetState();
}

class DataEntryItemListWidgetState extends ConsumerState<DataEntryItemListWidget>
    with KeyboardManager {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final itemCount = ref.watch(
        itemsProvider.select((list) => list.length));
    // final items = ref.watch(itemsProvider);

    return ScrollablePositionedList.builder(
      shrinkWrap: true,
      // itemCount: items.length,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) => ProviderScope(
        overrides: [indexProvider.overrideWith((_) => index)],
        child: const DataEntryItemWidget(),
      ),
      itemScrollController: itemScrollController,
      // itemPositionsListener: itemPositionsListener,
    );
    // return itemCount != null
    //     ? ScrollablePositionedList.builder(
    //         shrinkWrap: true,
    //         itemCount: itemCount,
    //         itemBuilder: (BuildContext context, int index) => ProviderScope(
    //           overrides: [indexProvider.overrideWith((_) => index)],
    //           child: const DataEntryItem(),
    //         ),
    //         itemScrollController: itemScrollController,
    //         // itemPositionsListener: itemPositionsListener,
    //       )
    //     : const SizedBox.shrink();
  }

  @override
  void initState() {
    // ref.listenManual<AsyncValue<IList<FieldUiModel>>>(itemsProvider,
    //     (previous, next) => next.value?.let((it) => _render(it)));

    super.initState();
  }
}
