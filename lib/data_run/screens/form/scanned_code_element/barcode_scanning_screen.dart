// // import 'package:datarun/data_run/screens/form/element/form_element.dart';
// import 'package:datarun/data_run/screens/form/scanned_code_element/barcode_scanner_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// class BarcodeScanningScreen extends StatefulWidget {
//   @override
//   _BarcodeScanningScreenState createState() => _BarcodeScanningScreenState();
// }
//
// class _BarcodeScanningScreenState extends State<BarcodeScanningScreen> {
//   final List<Gs1ScannedItem> _scannedItems = [];
//   final MobileScannerController controller = MobileScannerController(
//     autoStart: false,
//     torchEnabled: true,
//   );
//
//   void _addItem(Gs1ScannedItem item) {
//     if (_scannedItems.any((i) => i.gtin == item.gtin)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Duplicate Item!')),
//       );
//       return;
//     }
//     setState(() => _scannedItems.add(item));
//   }
//
//   void _removeItem(int index) {
//     setState(() => _scannedItems.removeAt(index));
//   }
//
//   void _editItem(int index, Gs1ScannedItem newItem) {
//     setState(() => _scannedItems[index] = newItem);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Barcode Scanning')),
//       body: Column(
//         children: [
//           Expanded(
//             child: BarcodeScannerWidget(
//               onValidItemScanned: _onValidItemScanned,
//               validateItem: _validateItem,
//               onCancel: () => Navigator.of(context).pop(),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _scannedItems.length,
//               itemBuilder: (context, index) {
//                 final item = _scannedItems[index];
//                 return ListTile(
//                   title: Text('GTIN: ${item.gtin}'),
//                   subtitle: Text('Count: ${item.count}'),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//     //  return Scaffold(
//     //   appBar: AppBar(title: Text('Scan Items')),
//     //   body: Column(
//     //     children: [
//     //       Expanded(
//     //         child: ScannedItemsTable(
//     //           items: _scannedItems,
//     //           onRemove: _removeItem,
//     //           onEdit: _editItem,
//     //         ),
//     //       ),
//     //       ElevatedButton(
//     //           onPressed: () {
//     //             showDialog(
//     //                 context: context,
//     //                 builder: (context) {
//     //                   return BarcodeScannerWidget(
//     //                     onCancel: () {
//     //                       Navigator.pop(context);
//     //                     },
//     //                     validateItem: (gs1Item) {
//     //                       return true;
//     //                     },
//     //                     onValidItemScanned: _addItem,
//     //                   );
//     //                 });
//     //           },
//     //           child: Text('Add'))
//     //     ],
//     //   ),
//     // );
//   }
//
//
//   void _onValidItemScanned(Gs1ScannedItem item) {
//     setState(() {
//       _scannedItems.add(item);
//     });
//   }
//
//   bool _validateItem(Gs1ScannedItem? item) {
//     // Implement your validation logic here
//     return item != null;
//   }
// }
