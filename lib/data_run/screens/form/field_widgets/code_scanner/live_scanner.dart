// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class BarcodeLiveScanner extends StatelessWidget {
//   final Function(String) onCodeScanned;
//
//   BarcodeLiveScanner({required this.onCodeScanned});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Live Barcode Scanner')),
//       body: QRView(
//         key: GlobalKey(debugLabel: 'QR'),
//         onQRViewCreated: (QRViewController controller) {
//           controller.scannedDataStream.listen((scanData) {
//             onCodeScanned(scanData.code);
//             controller.dispose(); // Stop scanning once code is found
//           });
//         },
//       ),
//     );
//   }
// }
