// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// class BarcodeScannerSimple extends StatefulWidget {
//   const BarcodeScannerSimple({super.key});
//
//   @override
//   State<BarcodeScannerSimple> createState() => _BarcodeScannerSimpleState();
// }
//
// class _BarcodeScannerSimpleState extends State<BarcodeScannerSimple> {
//   final MobileScannerController controller = MobileScannerController(
//     autoStart: false,
//     torchEnabled: true,
//     useNewCameraSelector: true,
//   );
//
//   Barcode? _barcode;
//
//   Widget _buildBarcode(Barcode? value) {
//     if (value == null) {
//       return const Text(
//         'Scan something!',
//         overflow: TextOverflow.fade,
//         style: TextStyle(color: Colors.white),
//       );
//     }
//
//     return Text(
//       value.displayValue ?? 'No display value.',
//       overflow: TextOverflow.fade,
//       style: const TextStyle(color: Colors.white),
//     );
//   }
//
//   void _handleBarcode(BarcodeCapture barcodes) {
//     if((barcodes.barcodes.firstOrNull?.displayValue?.contains(r'076402*') ?? false)) {
//       unawaited(controller.stop());
//     }
//     if (mounted) {
//       setState(() {
//         _barcode = barcodes.barcodes.firstOrNull;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Simple scanner')),
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           MobileScanner(
//             controller: controller,
//             onDetect: _handleBarcode,
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               height: 100,
//               color: Colors.black.withOpacity(0.4),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(child: Center(child: _buildBarcode(_barcode))),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
