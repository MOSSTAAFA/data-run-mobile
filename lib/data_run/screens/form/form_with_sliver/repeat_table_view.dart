import 'package:datarun/data_run/form/form_element/form_element_iterators/form_element_iterator.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_template_inherit_widget.dart';
import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:datarun/data_run/utils/get_item_local_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RepeatInstanceDataTable extends HookConsumerWidget {
  RepeatInstanceDataTable({super.key, required this.repeatInstance});

  final RepeatInstance repeatInstance;

  Widget build(BuildContext context, WidgetRef ref) {
    final formMetadata = FormMetadataWidget.of(context);

    final formTemplate = FormFlatTemplateInheritWidget.of(context);
    final tableColumns = formTemplate
        .getChildrenOfType<FieldElementTemplate>(repeatInstance.pathRecursive);

    final isEditing = useState(false);
    final editingIndex = useState(-1);

    return Stack(
      children: [
        PaginatedDataTable(
          actions: [
            ElevatedButton(
              onPressed: () {
                isEditing.value = true;
                editingIndex.value = -1; // -1 indicates new item
              },
              child: Icon(Icons.add),
            ),
          ],
          header: Text('${repeatInstance.label}'),
          rowsPerPage: 5,
          columns: [
            DataColumn(label: Text(S.of(context).edit)),
            const DataColumn(label: Text('#')),
            ...tableColumns
                .map((fieldTemplate) => DataColumn(
                    label: Text(getItemLocalString(fieldTemplate.label.unlock,
                        defaultString: fieldTemplate.name))))
                .toList()
          ],
          source: RepeatTableDataSource(
              repeatInstance: repeatInstance,
              onEdit: (index) {
                isEditing.value = true;
                editingIndex.value = index;
              },
              onDelete: (index) {
                ref
                    .read(formInstanceProvider(formMetadata: formMetadata))
                    .requireValue
                    .onRemoveRepeatedItem(index, repeatInstance);
              }),
        ),
        if (isEditing.value)
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),
            right: 0,
            top: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Material(
              elevation: 4,
              child: EditPanel(
                repeatInstance: repeatInstance,
                index: editingIndex.value,
                onSave: () {
                  // Save logic here
                  isEditing.value = false;
                },
                onCancel: () {
                  isEditing.value = false;
                },
              ),
            ),
          ),
      ],
    );
  }

  void onAdd() {

  }
}

class EditPanel extends StatelessWidget {
  const EditPanel(
      {super.key,
      required this.repeatInstance,
      this.onCancel,
      this.onSave,
      required this.index});

  final RepeatInstance repeatInstance;
  final VoidCallback? onCancel;
  final VoidCallback? onSave;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Icon(Icons.save)),
              ElevatedButton(onPressed: () {
                onCancel?.call();
              }, child: Icon(Icons.cancel))
            ],
          )
        ],
      ),
    );
  }
}

class RepeatTableDataSource extends DataTableSource {
  RepeatTableDataSource(
      {required this.repeatInstance, this.onDelete, this.onEdit});

  final RepeatInstance repeatInstance;
  final Function(int)? onDelete;
  final Function(int)? onEdit;

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= repeatInstance.elements.length) return null;
    final repeatItem = repeatInstance.elements[index];
    final rowFields =
        getFormElementIterator<FieldInstance<dynamic>>(repeatItem);
    return DataRow.byIndex(
        index: index,
        selected: repeatItem.selected,
        onSelectChanged: (value) {
          if (repeatItem.selected != value) {
            _selectedCount += (value ?? false) ? 1 : -1;
            assert(_selectedCount >= 0);
            repeatItem.selected = (value ?? false);
            notifyListeners();
          }
        },
        cells: [
          DataCell(IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                onEdit?.call(index);
              })),
          DataCell(Text('${index + 1}')),
          ...rowFields.map((field) => DataCell(Text('${field.value}'))).toList()
        ]);
  }

  @override
  int get rowCount => repeatInstance.elements.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
