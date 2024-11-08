import 'package:d2_remote/core/utilities/list_extensions.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:datarun/data_run/form/form_element/form_element_iterators/form_element_iterator.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;
import 'package:datarun/utils/navigator_key.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_template_inherit_widget.dart';
import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:datarun/data_run/utils/get_item_local_string.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RepeatInstanceDataTable extends HookConsumerWidget {
  RepeatInstanceDataTable(
      {super.key,
      required this.repeatInstance,
      this.onEdit,
      this.onAdd,
      this.onDelete});

  final RepeatInstance repeatInstance;

  // final int initialFirstRowIndex;
  final Future<int> Function()? onAdd;
  final Future<int> Function(int)? onEdit;
  final Function(int)? onDelete;

  Widget build(BuildContext context, WidgetRef ref) {
    final formTemplate = FormFlatTemplateInheritWidget.of(context);
    final tableColumns = formTemplate
        .getChildrenOfType<FieldElementTemplate>(repeatInstance.pathRecursive);

    final ValueNotifier<int?> initialFirstRowIndex = useState(null);

    return Stack(
      children: [
        PaginatedDataTable(
          initialFirstRowIndex: initialFirstRowIndex.value,
          showFirstLastButtons: true,
          actions: [
            ElevatedButton(
              onPressed: () async {
                initialFirstRowIndex.value = await onAdd?.call();
              },
              child: Icon(Icons.add),
            ),
          ],
          header: Text('${repeatInstance.label}'),
          rowsPerPage: 5,
          columns: [
            const DataColumn(label: Text('#')),
            ...tableColumns
                .map((fieldTemplate) => DataColumn(
                    label: Text(getItemLocalString(fieldTemplate.label.unlock,
                        defaultString: fieldTemplate.name)),
                    numeric: fieldTemplate.type.isNumeric))
                .toList(),
            DataColumn(label: Text(S.of(context).edit)),
            DataColumn(label: Text(S.of(context).delete)),
          ],
          source: RepeatTableDataSource(
              repeatInstance: repeatInstance,
              onEdit: (index) async {
                await onEdit?.call(index);
              },
              onDelete: (index) async {
                await onDelete?.call(index);
                // formInstance.onRemoveRepeatedItem(index, repeatInstance);
              }),
        ),
      ],
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
    final rowFields = getFormElementIterator<FieldInstance<dynamic>>(
        repeatInstance.elements[index]);

    final rowFieldsStates =
        rowFields.map((field) => field).toList().reversedView;

    return DataRow.byIndex(index: index, selected: repeatItem.selected, cells: [
      DataCell(Text('${index + 1}')),
      ...rowFieldsStates
          .map((field) => DataCell(userFriendlyValue(field)))
          .toList(),
      DataCell(IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            onEdit?.call(index);
          })),
      DataCell(IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            onDelete?.call(index);
          })),
    ]);
  }

  Widget userFriendlyValue(FieldInstance<dynamic> field) {
    final value = field.value ?? '-';
    if (field.elementControl?.hasErrors == true) {
      return Text(
        '$value! ${S.of(navigatorKey.currentContext!).fieldContainErrors}',
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      );
    }
    switch (field.type) {
      case ValueType.Date:
      case ValueType.DateTime:
      case ValueType.Time:
        return Text(modelToViewValue(field.value) ?? '-');
      case ValueType.SelectMulti:
        return Text(field.visibleOption
            .where((option) => option.name == field.value)
            .whereType<String>()
            .join(', '));
      case ValueType.SelectOne:
        if (field.elementControl?.hasErrors == true) {
          return Text(
            S.of(navigatorKey.currentContext!).fieldContainErrors,
            style: const TextStyle(color: Colors.red),
          );
        }
        return Text(getItemLocalString(
            field.visibleOption
                .firstOrNullWhere((option) => option.name == field.value)
                ?.label,
            defaultString: '-'));
      default:
        return Text('${field.value ?? '-'}');
    }
  }

  String? modelToViewValue(String? modelValue) {
    return modelValue == null ? null : sdk.DateUtils.format(modelValue);
  }

  @override
  int get rowCount => repeatInstance.elements.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
