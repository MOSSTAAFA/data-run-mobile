// import 'package:datarun/data_run/screens/form/field_widgets/code_scanner/barcode_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//
// class MyEnhancedScanner extends StatefulWidget {
//   @override
//   _MyEnhancedScannerState createState() => _MyEnhancedScannerState();
// }
//
// class _MyEnhancedScannerState extends State<MyEnhancedScanner> {
//   String _scannedCode = "";
//
//   void _startScan() async {
//     final result = await FlutterBarcodeScanner.scanBarcode(
//         '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
//     if (!mounted) return;
//
//     setState(() => _scannedCode = result);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Barcode Scanner')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             BarcodeField(
//               value: _scannedCode,
//               onScan: _startScan,
//             ),
//             ElevatedButton(
//               onPressed: () => showScanner(context, (result) {
//                 setState(() => _scannedCode = result);
//               }),
//               child: Text("Open Advanced Scanner"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
