import 'package:d2_remote/modules/datarun/form/shared/field_template/field_template.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/template_extensions/form_traverse_extension.dart';
import 'package:datarun/core/utils/get_item_local_string.dart';
import 'package:datarun/data_run/form/form_element/form_element_iterators/form_element_iterator.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/element/form_instance.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/form_with_sliver/repeat_table/repeat_table_rows_source.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RepeatTable extends HookConsumerWidget {
  const RepeatTable({
    super.key,
    required this.repeatInstance,
    this.onEdit,
    this.onDelete,
    this.onAdd,
  });

  final RepeatInstance repeatInstance;
  final void Function(int index)? onEdit;
  final void Function(int index)? onDelete;
  final void Function()? onAdd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formInstance = ref
        .watch(
            formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
        .requireValue;

    final List<FormElementTemplate> tableColumns = useMemoized(() {
      getFormElementIterator<FieldInstance<dynamic>>(repeatInstance)
          .where((element) => element.visible)
          .map((element) => element.template);
      return formInstance.formFlatTemplate
          .getChildrenOfType<FieldElementTemplate>(repeatInstance.elementPath!)
        ..sort((a, b) => a.order.compareTo(b.order));
    }, [repeatInstance.elementPath]);

    final tableDataSource = buildTableDataSource(
        context, formInstance, repeatInstance.elements,
        onEdit: onEdit, onDelete: onDelete);

    return Opacity(
      opacity: repeatInstance.elementControl.enabled ? 1 : 0.5,
      child: PaginatedDataTable(
        showFirstLastButtons: true,
        actions: [
          ElevatedButton(
            onPressed: repeatInstance.elementControl.enabled ? onAdd : null,
            child: Icon(Icons.add),
          ),
        ],
        header: Text('${repeatInstance.label}'),
        rowsPerPage: 5,
        columns: //_buildVisibleColumns(visibleTableColumns, context),
            _buildColumns(tableColumns, context,
                editMode: repeatInstance.elementControl.enabled),
        source: tableDataSource,
      ),
    );
  }

  RepeatTableDataSource buildTableDataSource(BuildContext context,
      FormInstance formInstance, List<RepeatItemInstance> elements,
      {void Function(int index)? onEdit, void Function(int index)? onDelete}) {
    return RepeatTableDataSource(
      elements: elements,
      onEdit: onEdit,
      onDelete: onDelete,
      editable: repeatInstance.elementControl.enabled,
    );
  }

  List<DataColumn> _buildColumns(
      List<FormElementTemplate> tableColumns, BuildContext context,
      {bool editMode = true}) {
    return [
      const DataColumn(label: Text('#')),
      ...tableColumns
          .map((fieldTemplate) => DataColumn(
              label: Text(getItemLocalString(fieldTemplate.label,
                  defaultString: fieldTemplate.name)),
              numeric: fieldTemplate.type.isNumeric))
          .toList(),
      if (editMode) DataColumn(label: Text(S.of(context).edit)),
      if (editMode) DataColumn(label: Text(S.of(context).delete)),
    ];
  }

  List<DataColumn> _buildVisibleColumns(
      Iterable<FieldTemplate> tableColumns, BuildContext context) {
    return [
      const DataColumn(label: Text('#')),
      ...tableColumns
          .map((fieldTemplate) => DataColumn(
              label: Text(getItemLocalString(fieldTemplate.label.unlockView,
                  defaultString: fieldTemplate.name)),
              numeric: fieldTemplate.isNumeric))
          .toList(),
      DataColumn(label: Text(S.of(context).edit)),
      DataColumn(label: Text(S.of(context).delete)),
    ];
  }
}
