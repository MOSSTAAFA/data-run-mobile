import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/form_repeat_view/repeat_table_view/repeat_table_data_source.dart';
import 'package:mass_pro/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';

class RepeatDataTable extends StatelessWidget {
  RepeatDataTable({required this.repeatInstance, required this.formTemplate});

  final RepeatInstance repeatInstance;
  final FormFlatTemplate formTemplate;

  Widget build(BuildContext context) {
    final tableColumns = formTemplate
        .getChildrenOfType<FieldElementTemplate>(repeatInstance.pathRecursive);

    // ExpansionTile(
    //   initiallyExpanded: true,
    //   title: Text(
    //     repeatInstance.label,
    //     style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
    //   ),
    //   children: [
    //     ListView(
    //       padding: const EdgeInsets.all(16),
    //       children: [
    //         PaginatedDataTable(
    //           header: Text('t.header:${repeatInstance.label}'),
    //           rowsPerPage: 4,
    //           columns: tableColumns
    //               .map((fieldTemplate) => DataColumn(
    //               label: Text(getItemLocalString(fieldTemplate.label.unlock,
    //                   defaultString: fieldTemplate.name))))
    //               .toList(),
    //           source: RepeatTableDataSource(repeatInstance: repeatInstance),
    //         ),
    //       ],
    //     )
    //   ],
    // );
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        PaginatedDataTable(
          header: Text('t.header:${repeatInstance.label}'),
          rowsPerPage: 4,
          columns: tableColumns
              .map((fieldTemplate) => DataColumn(
                  label: Text(getItemLocalString(fieldTemplate.label.unlock,
                      defaultString: fieldTemplate.name))))
              .toList(),
          source: RepeatTableDataSource(repeatInstance: repeatInstance),
        ),
      ],
    );
  }
}
