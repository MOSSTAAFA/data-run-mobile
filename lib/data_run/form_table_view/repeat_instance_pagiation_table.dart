// import 'package:flutter/material.dart';
// import 'package:mass_pro/data_run/form/form_element/form_element_iterators/form_element_iterator.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: _buildShrineTheme(),
//       home: DataTableDemo(),
//     );
//   }
// }
//
// class DataTableDemo extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Tables'),
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           PaginatedDataTable(
//             header: Text('Header Text'),
//             rowsPerPage: 4,
//             columns: [
//               DataColumn(label: Text('Header A')),
//               DataColumn(label: Text('Header B')),
//               DataColumn(label: Text('Header C')),
//               DataColumn(label: Text('Header D')),
//             ],
//             source: _DataSource(context),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class _Row {
//   _Row(this.repeatItem);
//
//   final RepeatItemInstance repeatItem;
//
//   bool selected = false;
// }
//
// class _DataSource extends DataTableSource {
//   _DataSource({required this.repeatInstance});
//
//   final RepeatInstance repeatInstance;
//
//   // List<_Row> _rows = [];
//
//   int _selectedCount = 0;
//
//   @override
//   DataRow? getRow(int index) {
//     getFormElementIterator(formElement);
//     assert(index >= 0);
//     if (index >= repeatInstance.elements.length) return null;
//     final row = _Row(repeatInstance.elements[index]);
//     return DataRow.byIndex(
//       index: index,
//       selected: row.selected,
//       onSelectChanged: (value) {
//         if (row.selected != value) {
//           _selectedCount += (value ?? false) ? 1 : -1;
//           assert(_selectedCount >= 0);
//           row.selected = (value ?? false);
//           notifyListeners();
//         }
//       },
//       cells: [
//         DataCell(Text(row.valueA)),
//         DataCell(Text(row.valueB)),
//         DataCell(Text(row.valueC)),
//         DataCell(Text(row.valueD.toString())),
//       ],
//     );
//   }
//
//   @override
//   int get rowCount => repeatInstance.elements.length;
//
//   @override
//   bool get isRowCountApproximate => false;
//
//   @override
//   int get selectedRowCount => _selectedCount;
// }
//
// ThemeData _buildShrineTheme() {
//   final ThemeData base = ThemeData.light();
//   return base.copyWith(
//     colorScheme: _shrineColorScheme,
//     primaryColor: shrinePink100,
//     scaffoldBackgroundColor: shrineBackgroundWhite,
//     cardColor: shrineBackgroundWhite,
//     buttonTheme: const ButtonThemeData(
//       colorScheme: _shrineColorScheme,
//       textTheme: ButtonTextTheme.normal,
//     ),
//     primaryIconTheme: _customIconTheme(base.iconTheme),
//     textTheme: _buildShrineTextTheme(base.textTheme),
//     primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
//     iconTheme: _customIconTheme(base.iconTheme),
//   );
// }
//
// IconThemeData _customIconTheme(IconThemeData original) {
//   return original.copyWith(color: shrineBrown900);
// }
//
// TextTheme _buildShrineTextTheme(TextTheme base) {
//   return base
//       .copyWith(
//         titleMedium: base.titleMedium?.copyWith(
//           fontWeight: FontWeight.w400,
//           fontSize: 14,
//           letterSpacing: defaultLetterSpacing,
//         ),
//       )
//       .apply(
//         fontFamily: 'Rubik',
//         displayColor: shrineBrown900,
//         bodyColor: shrineBrown900,
//       );
// }
//
// const ColorScheme _shrineColorScheme = ColorScheme(
//   primary: shrinePink100,
//   secondary: shrinePink50,
//   surface: shrineSurfaceWhite,
//   background: shrineBackgroundWhite,
//   error: shrineErrorRed,
//   onPrimary: shrineBrown900,
//   onSecondary: shrineBrown900,
//   onSurface: shrineBrown900,
//   onBackground: shrineBrown900,
//   onError: shrineSurfaceWhite,
//   brightness: Brightness.light,
// );
//
// const Color shrinePink50 = Color(0xFFFEEAE6);
// const Color shrinePink100 = Color(0xFFFEDBD0);
// const Color shrinePink300 = Color(0xFFFBB8AC);
// const Color shrinePink400 = Color(0xFFEAA4A4);
//
// const Color shrineBrown900 = Color(0xFF442B2D);
// const Color shrineBrown600 = Color(0xFF7D4F52);
//
// const Color shrineErrorRed = Color(0xFFC5032B);
//
// const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
// const Color shrineBackgroundWhite = Colors.white;
//
// const defaultLetterSpacing = 0.03;
