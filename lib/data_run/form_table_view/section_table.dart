// import 'package:flutter/material.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
//
// class SectionTable extends StatelessWidget {
//   final List<FieldInstance<dynamic>> entries;
//   final void Function(FieldInstance<dynamic> entry) onTapEntry;
//
//   const SectionTable({Key? key, required this.entries, required this.onTapEntry}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final table = Column(
//       mainAxisSize: MainAxisSize.max,
//       children: [
//         Expanded(
//           child: SingleChildScrollView(
//             // controller: _controller,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               child: PaginatedDataTable(
//                 onSelectAll: (value) {
//                 },
//                 columns: [
//                   if (!isInMultiselect) const DataColumn(label: SizedBox()),
//                   if (widget.tableColumns != null)
//                     ...widget.tableColumns!.map((field) {
//                       String label =
//                       AppLocalization.of(context)!.lookup(field);
//                       // if (field.startsWith('custom')) {
//                       //   final key = field.replaceFirst(
//                       //       'custom', entityType.snakeCase);
//                       //   label = state.company.getCustomFieldLabel(key);
//                       // }
//                       return DataColumn(
//                           label: Container(
//                             child: Text(
//                               label,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           onSort: (int columnIndex, bool ascending) {
//                             widget.onSortColumn(field);
//                           });
//                     }),
//                 ],
//                 source: dataTableSource,
//                 sortColumnIndex:
//                 widget.tableColumns != null &&
//                     widget.tableColumns!.contains(listUIState.sortField)
//                     ? widget.tableColumns!.indexOf(listUIState.sortField)
//                     : 0,
//                 sortAscending: listUIState.sortAscending,
//                 onPageChanged: (row) => _firstRowIndex = row,
//                 initialFirstRowIndex: _firstRowIndex,
//                 rowsPerPage: prefState.rowsPerPage,
//                 availableRowsPerPage: const <int>[
//                   20,
//                   40,
//                   80,
//                   120,
//                 ],
//                 onRowsPerPageChanged: (value) =>
//                     context
//                         .read<AppBloc>()
//                         .add(UpdateUserPreferences(rowsPerPage: value)),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//
//     return DataTable(
//       columns: const [
//         DataColumn(label: Text('Field 1')),
//         DataColumn(label: Text('Field 2')),
//         DataColumn(label: Text('Field 3')),
//       ],
//       rows: entries.map((entry) {
//         return DataRow(
//           cells: [
//             DataCell(Text(entry.field1)),
//             DataCell(Text(entry.field2)),
//             DataCell(Text(entry.field3.toString())),
//           ],
//           onSelectChanged: (selected) {
//             if (selected == true) {
//               onTapEntry(entry);
//             }
//           },
//         );
//       }).toList(),
//     );
//   }
// }
