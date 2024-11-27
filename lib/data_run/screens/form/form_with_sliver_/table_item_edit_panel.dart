import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditPanel extends HookConsumerWidget {
  const EditPanel(
      {super.key,
      required this.repeatItemInstance,
      this.onCancel,
      this.onSave,
      this.onDelete,
      required this.isNew});

  final RepeatItemInstance repeatItemInstance;
  final VoidCallback? onCancel;
  final VoidCallback? onSave;
  final VoidCallback? onDelete;
  final bool isNew;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final formMetadata = FormMetadataWidget.of(context);
    // final formInstance =
    //     ref.read(formInstanceProvider(formMetadata: formMetadata)).requireValue;

    // bool isNew = index < 0;
    // final element = isNew
    //     ? formInstance.onAddRepeatedItem(repeatInstance)
    //     : repeatInstance.elements[index];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(isNew ? Icons.new_label : Icons.edit, size: 30),
          const SizedBox(height: 10),
          Text(
            isNew
                ? 'New Item: ${repeatItemInstance.name}'
                : 'Edit Item ${int.tryParse(repeatItemInstance.name)! + 1}',
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const SizedBox(height: 10),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PopupFormElementWidgetFactory.createWidget(
                    repeatItemInstance),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton.icon(
                onPressed: onSave,
                icon: Icon(Icons.save),
                label: Text(S.of(context).save),
              ),
              ElevatedButton.icon(
                onPressed: onCancel,
                icon: Icon(Icons.cancel),
                label: Text(S.of(context).cancel),
              ),
              ElevatedButton.icon(
                onPressed: onDelete,
                icon: Icon(Icons.delete),
                label: Text(S.of(context).delete),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
