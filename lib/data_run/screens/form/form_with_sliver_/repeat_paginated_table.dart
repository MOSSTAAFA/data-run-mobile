// import 'package:datarun/data_run/screens/form/element/form_element.dart';
// import 'package:flutter/material.dart';
//
// class PaginatedTable extends StatefulWidget {
//   final RepeatInstance repeatSection;
//   final int rowsPerPage;
//
//   PaginatedTable({
//     super.key,
//     required this.repeatSection,
//     this.rowsPerPage = 5, // Default to 5 rows per page
//   });
//
//   @override
//   _PaginatedTableState createState() => _PaginatedTableState();
// }
//
// class _PaginatedTableState extends State<PaginatedTable> {
//   int _currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     int totalRows = widget.repeatSection.elements.length;
//     int startIndex = _currentPage * widget.rowsPerPage;
//     int endIndex = (startIndex + widget.rowsPerPage) > totalRows
//         ? totalRows
//         : startIndex + widget.rowsPerPage;
//
//     List<List<FormElement>> currentPageRows =
//     widget.repeatSection.elements.sublist(startIndex, endIndex);
//
//     return Column(
//       children: [
//         // Render table headers (you can customize this as per your form structure)
//         Table(
//           columnWidths: {0: FractionColumnWidth(0.5)}, // Adjust column widths
//           children: currentPageRows.map((rowElements) {
//             return TableRow(
//               children: rowElements.map((element) {
//                 return TableCell(
//                   child: ListTile(
//                     title: Text(element.label),
//                   ),
//                 );
//               }).toList(),
//             );
//           }).toList(),
//         ),
//         // Pagination controls
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _currentPage > 0
//                   ? () {
//                 setState(() {
//                   _currentPage--;
//                 });
//               }
//                   : null,
//               child: Text('Previous'),
//             ),
//             SizedBox(width: 20),
//             ElevatedButton(
//               onPressed: (startIndex + widget.rowsPerPage) < totalRows
//                   ? () {
//                 setState(() {
//                   _currentPage++;
//                 });
//               }
//                   : null,
//               child: Text('Next'),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
