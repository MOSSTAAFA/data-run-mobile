// import 'package:datarun/core/utils/get_item_local_string.dart';
// import 'package:datarun/data_run/screens/form/element/form_element.dart';
// import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
// import 'package:datarun/data_run/screens/form/inherited_widgets/form_instance_inherit_widget.dart';
// import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
// import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';
// import 'package:datarun/generated/l10n.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// class ImprovedRepeatInstanceDataTable extends HookConsumerWidget {
//   ImprovedRepeatInstanceDataTable({super.key, required this.repeatInstance});
//
//   final RepeatInstance repeatInstance;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final formInstance = FormInstanceInheritWidget.of(context);
//
//     final tableColumns = formInstance.forFlatTemplate
//         .getChildrenOfType<FieldElementTemplate>(repeatInstance.pathRecursive);
//
//     return Column(
//       children: [
//         DataTable(
//           columns: _buildColumns(tableColumns, context),
//           rows: _buildRows(context, ref),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             ElevatedButton(
//               onPressed: () => _addNewRow(context),
//               child: Text('Add New Row'),
//             ),
//             ElevatedButton(
//               onPressed: () => _saveAllChanges(context),
//               child: Text('Save All Changes'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   void _addNewRow(BuildContext context) {
//     // Logic to add a new row
//     final formInstance = FormInstanceInheritWidget.of(context);
//
//     formInstance.onAddRepeatedItem(repeatInstance);
//     // Optionally open inline editing for the new row
//   }
//
//   void _saveAllChanges(BuildContext context) {
//     final formInstance = FormInstanceInheritWidget.of(context);
//
//     // Logic to save all changes
//     // This could trigger validation for all rows
//     // and only save if everything is valid
//   }
//
//   List<DataRow> _buildRows(BuildContext context, WidgetRef ref) {
//     return repeatInstance.elements.mapIndexed((index, element) {
//       return DataRow(
//         cells: _buildCells(element, context),
//         onSelectChanged: (_) => _editRow(context, ref, index),
//       );
//     }).toList();
//   }
//
//   void _editRow(BuildContext context, WidgetRef ref, int index) {
//     // Logic for inline editing or opening a modal
//     // Could use a more sophisticated editing UI here
//   }
//
//   List<DataColumn> _buildColumns(
//       List<FormElementTemplate> tableColumns, BuildContext context) {
//     return [
//       const DataColumn(label: Text('#')),
//       ...tableColumns
//           .map((fieldTemplate) => DataColumn(
//               label: Text(getItemLocalString(fieldTemplate.label,
//                   defaultString: fieldTemplate.name)),
//               numeric: fieldTemplate.type.isNumeric))
//           .toList(),
//       DataColumn(label: Text(S.of(context).edit)),
//       DataColumn(label: Text(S.of(context).delete)),
//     ];
//   }
// }
