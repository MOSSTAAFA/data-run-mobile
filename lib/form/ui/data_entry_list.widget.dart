import 'package:dartx/dartx_io.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../model/field_ui_model.dart';
import 'data_entry_item.widget.dart';
import 'event/list_view_ui_events.dart';
import 'intent/form_intent.dart';

class DataEntryList extends StatefulWidget {
  const DataEntryList(
      {super.key,
      this.onIntent,
      this.onListViewUiEvents,
      this.searchStyle = false,
      required this.fields});

  final void Function(FormIntent intent)? onIntent;
  final void Function(ListViewUiEvents uiEvent)? onListViewUiEvents;
  final bool searchStyle;
  final List<FieldUiModel> fields;

  @override
  State<DataEntryList> createState() => DataEntryListState();
}

class DataEntryListState extends State<DataEntryList> {
  final ItemScrollController itemScrollController = ItemScrollController();

  // final ItemPositionsListener itemPositionsListener =
  //     ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemCount: widget.fields.count(),
      itemBuilder: (BuildContext context, int index) => DataEntryItem(
        uiModel: widget.fields[index],
        intentCallback: (FormIntent intent) {
          FormIntent formIntent = intent;
          if (intent is OnNext) {
            // scrollToPosition(intent.position!);
            formIntent = intent.copyWith(position: index + 1);
            itemScrollController.scrollTo(
                index: intent.position!,
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeInOutCubic);
            // itemScrollController.jumpTo(index: intent.position!);
          }
          widget.onIntent?.call(formIntent);
        },
        listViewEventCallback: (ListViewUiEvents uiEvent) =>
            widget.onListViewUiEvents?.call(uiEvent),
      ),
      itemScrollController: itemScrollController,
      // itemPositionsListener: itemPositionsListener,
    );
  }
}
