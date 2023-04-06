import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../commons/custom_widgets/fields/factory/field_widget_factory_impl.dart';
import '../../commons/custom_widgets/fields/field_bindings.dart';
import '../model/field_ui_model.dart';
import 'event/list_view_ui_events.dart';
import 'intent/form_intent.dart';

class DataEntryItem extends StatefulWidget {
  const DataEntryItem(
      {super.key,
      required this.uiModel,
      this.intentCallback,
      this.listViewEventCallback,
      this.textChangedListener});

  final FieldUiModel uiModel;
  final void Function(FormIntent intent)? intentCallback;
  final void Function(ListViewUiEvents uiEvent)? listViewEventCallback;
  final TextChangedListener? textChangedListener;

  // final LatitudeLongitudeTextWatcher coordinateTextWatcher;

  @override
  State<DataEntryItem> createState() => _DataEntryItemState();
}

class _DataEntryItemState extends State<DataEntryItem> {
  final FieldWidgetFactoryImpl _fieldFactory = FieldWidgetFactoryImpl();

  @override
  Widget build(BuildContext context) {
    return ProxyProvider0<FieldUiModel>(
        update: (BuildContext context, FieldUiModel? value) => widget.uiModel,
        child: _fieldFactory.createWidgetByType(
            key: ValueKey<String>(widget.uiModel.uid),
            valueType: widget.uiModel.valueType,
            renderingType: null,
            optionSet: widget.uiModel.optionSet,
            sectionRenderingType: null));
  }

  @override
  void initState() {
    super.initState();
    widget.uiModel.setCallback(Callback(
        intent: widget.intentCallback,
        listViewUiEvents: widget.listViewEventCallback));
  }
}
