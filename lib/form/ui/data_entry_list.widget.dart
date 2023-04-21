import 'package:d2_remote/core/common/value_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../commons/extensions/standard_extensions.dart';

import '../../commons/custom_widgets/mixins/keyboard_manager.dart';
import '../model/field_ui_model.dart';
import 'data_entry_item.widget.dart';
import 'form_view_model.dart';

class DataEntryList extends ConsumerStatefulWidget {
  const DataEntryList({super.key, this.searchStyle = false});

  final bool searchStyle;

  @override
  ConsumerState<DataEntryList> createState() => DataEntryListState();
}

class DataEntryListState extends ConsumerState<DataEntryList>
    with KeyboardManager {
  final ItemScrollController itemScrollController = ItemScrollController();
  List<FieldUiModel> _items = [];
  // final ItemPositionsListener itemPositionsListener =
  //     ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    ref
        .watch(itemsProvider)
        .let((AsyncValue<List<FieldUiModel>> items) => items.when(
              loading: () {},
              data: (List<FieldUiModel>? data) => _render(data ?? []),
              error: (Object error, StackTrace stackTrace) =>
                  debugPrint('error loading forme Fields $error'),
            ));
    return ScrollablePositionedList.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) => ProviderScope(
        overrides: [indexProvider.overrideWith((_) => index)],
        child: const DataEntryItem(),
      ),
      itemScrollController: itemScrollController,
      // itemPositionsListener: itemPositionsListener,
    );
  }

  void _render(List<FieldUiModel> items) {
    ref.read(itemsProvider.notifier).processCalculatedItems();
    // widget.viewModel.calculateCompletedFields();
    // TODO(NMC): implementing Rules
    // viewModel.updateConfigurationErrors();
    ref
        .read(calculationLoopValueProvider.notifier)
        .displayLoopWarningIfNeeded();
    _handleKeyBoardOnFocusChange(items);
    _items = items;
  }

  void _handleKeyBoardOnFocusChange(List<FieldUiModel> items) {
    items.firstWhereOrNull((FieldUiModel it) => it.focused)?.let(
        (FieldUiModel fieldUiModel) =>
            fieldUiModel.valueType?.let((ValueType valueType) {
              if (!ref
                  .read(formViewModelProvider)
                  .valueTypeIsTextField(valueType)) {
                hideKeyboard(context);
              }
            }));
  }
}
