// import 'package:flutter/material.dart';
// import 'package:datarun/data_run/screens/form/scanned_code_element/barcode_scanning_screen.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Barcode Scanner Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: BarcodeScanningScreen(),
//     );
//   }
// }
//
// class Gs1ScannedItem {
//   final String gtin;
//   final int count;
//
//   Gs1ScannedItem({required this.gtin, required this.count});
// }
// //
// // class BarcodeScannerWidget extends StatefulWidget {
// //   final Function(Gs1ScannedItem) onValidItemScanned;
// //   final bool Function(Gs1ScannedItem?)? validateItem;
// //   final VoidCallback onCancel;
// //
// //   const BarcodeScannerWidget({
// //     Key? key,
// //     required this.onValidItemScanned,
// //     this.validateItem,
// //     required this.onCancel,
// //   }) : super(key: key);
// //
// //   @override
// //   _BarcodeScannerWidgetState createState() => _BarcodeScannerWidgetState();
// // }
// //
// // class _BarcodeScannerWidgetState extends State<BarcodeScannerWidget> {
// //   MobileScannerController controller = MobileScannerController();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Expanded(
// //           child: MobileScanner(
// //             controller: controller,
// //             onDetect: (capture) {
// //               final List<Barcode> barcodes = capture.barcodes;
// //               for (final barcode in barcodes) {
// //                 _handleBarcode(barcode.rawValue ?? '');
// //               }
// //             },
// //           ),
// //         ),
// //         ElevatedButton(
// //           onPressed: widget.onCancel,
// //           child: Text('Cancel'),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   void _handleBarcode(String scannedCode) {
// //     // This is a simplified version. You'll need to implement proper GS1 parsing.
// //     final item = Gs1ScannedItem(gtin: scannedCode, count: 1);
// //     if (widget.validateItem?.call(item) ?? true) {
// //       widget.onValidItemScanned(item);
// //     }
// //   }
// //
// //   @override
// //   void dispose() {
// //     controller.dispose();
// //     super.dispose();
// //   }
// // }