import 'package:d2_remote/core/common/value_type.dart';
import 'package:dartx/dartx_io.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/form/ui/form_view_providers.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../commons/custom_widgets/mixins/keyboard_manager.dart';
import '../../commons/extensions/standard_extensions.dart';
import '../model/field_ui_model.dart';
import 'data_entry_item.widget.dart';
import 'form_view_model.dart';

class DataEntryItemsList extends ConsumerStatefulWidget {
  const DataEntryItemsList({super.key, this.searchStyle = false});

  final bool searchStyle;

  @override
  ConsumerState<DataEntryItemsList> createState() => DataEntryListState();
}

class DataEntryListState extends ConsumerState<DataEntryItemsList>
    with KeyboardManager {
  final ItemScrollController itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    // final itemCount = ref.watch(itemsListLengthProvider).value;
    return Consumer(
      builder: (context, ref, _) {
        final itemCount = ref.watch(itemsListLengthProvider).value;
        return ScrollablePositionedList.builder(
          shrinkWrap: true,
          itemCount: itemCount ?? 0,
          itemBuilder: (BuildContext context, int index) => ProviderScope(
            overrides: [indexProvider.overrideWith((_) => index)],
            child: const DataEntryItem(),
          ),
          itemScrollController: itemScrollController,
          // itemPositionsListener: itemPositionsListener,
        );
      },
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

  void _render(IList<FieldUiModel> items) {
    Future(() => ref.read(itemsProvider.notifier).processCalculatedItems());

    // widget.viewModel.calculateCompletedFields();
    // TODO(NMC): implementing Rules
    // viewModel.updateConfigurationErrors();
    Future(() => ref
        .read(calculationLoopValueProvider.notifier)
        .displayLoopWarningIfNeeded());

    _handleKeyBoardOnFocusChange(items);
  }

  void _handleKeyBoardOnFocusChange(IList<FieldUiModel> items) {
    items.firstOrNullWhere((FieldUiModel it) => it.focused)?.let(
        (FieldUiModel fieldUiModel) =>
            fieldUiModel.valueType?.let((ValueType valueType) {
              if (!ref
                  .read(formViewModelProvider)
                  .valueTypeIsTextField(valueType)) {
                hideTheKeyboard(context);
              }
            }));
  }
}
