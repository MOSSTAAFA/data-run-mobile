import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/custom_widgets/mixins/keyboard_manager.dart';
import 'package:mass_pro/data_run/form/form_input_field_intent.dart';
import 'package:mass_pro/data_run/screens/data_submission/form_input_field.widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class FormInputFieldsListWidget extends ConsumerStatefulWidget {
  const FormInputFieldsListWidget(
      {super.key,
      required this.itemsCount,
      this.onIntent,
      // required this.records,
      // this.onListViewUiEvents,
      this.searchStyle = false});

  final int itemsCount;

  // final FormRepositoryRecords records;

  final void Function(FormInputFieldIntent intent)? onIntent;

  // final void Function(ListViewUiEvents uiEvent)? onListViewUiEvents;

  final bool searchStyle;

  @override
  ConsumerState<FormInputFieldsListWidget> createState() =>
      FormInputFieldsListWidgetState();
}

class FormInputFieldsListWidgetState
    extends ConsumerState<FormInputFieldsListWidget> with KeyboardManager {
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
            itemBuilder: (BuildContext context, int index) =>
                FormInputFieldWidget(
              index: index,
              onIntent: (intent) {
                if (intent is OnNext) {
                  // scrollToPosition(intent.position!);
                }
                widget.onIntent?.call(intent);
              },
              // onListViewUiEvents: (uiEvent) =>
              //     widget.onListViewUiEvents?.call(uiEvent),
              // records: widget.records,
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
