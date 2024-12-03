// import 'dart:async';
// import 'package:datarun/data_run/screens/form/scanned_code_element/scanned_item_details.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
//
// class BarcodeScannerWidget extends StatefulWidget {
//   final Function(Gs1ScannedItem) onValidItemScanned;
//   final bool Function(Gs1ScannedItem?)? validateItem;
//   final Gs1ScannedItem? initialItem;
//   final VoidCallback? onCancel;
//
//   BarcodeScannerWidget({
//     this.initialItem,
//     required this.onValidItemScanned,
//     this.validateItem,
//     this.onCancel,
//   });
//
//   @override
//   State<BarcodeScannerWidget> createState() => _BarcodeScannerWidgetState();
// }
//
// class _BarcodeScannerWidgetState extends State<BarcodeScannerWidget>
//     with WidgetsBindingObserver {
//   late final FormGroup _itemForm;
//   late final FormControl<Gs1ScannedItem> _itemControl;
//   late final Gs1ScannedItem? _item;
//   final parser = GS1BarcodeParser.defaultParser();
//
//   final MobileScannerController controller = MobileScannerController(
//     autoStart: false,
//     torchEnabled: true,
//     useNewCameraSelector: true,
//   );
//
//   StreamSubscription<Object?>? _subscription;
//   BarcodeCapture? _barcodeCapture;
//
//   // Future<void> _handleBarcode(BarcodeCapture barcodes) async {
//   //   if (barcodes.barcodes.firstOrNull?.displayValue != null) {
//   //     final String scannedCode = barcodes.barcodes.firstOrNull!.displayValue!;
//   //     final parsedItem =
//   //         Gs1ScannedItem.fromScannedCode(parser.parse(scannedCode));
//   //     if (mounted && (widget.validateItem?.call(parsedItem) ?? true)) {
//   //       _itemControl.updateValue(parsedItem);
//   //       _itemForm.control('count').updateValue(parsedItem.count ?? 1);
//   //       await controller.stop();
//   //     }
//   //   }
//   // }
//     void _handleBarcode(BarcodeCapture scannedCode) {
//     // This is a simplified version. You'll need to implement proper GS1 parsing.
//     final item = Gs1ScannedItem(gtin: scannedCode.barcodes.firstOrNull?.displayValue ?? 'null', count: 1);
//     if (widget.validateItem?.call(item) ?? true) {
//       widget.onValidItemScanned(item);
//     }
//   }
//
//
//   // Widget _buildScannedItemDetailsWidget(Barcode? value) {
//   //   if (value == null) {
//   //     return ScannedItemDetailsWidget(
//   //       itemForm: _itemForm,
//   //     );
//   //   }
//
//   //   return Text(
//   //     value.displayValue ?? 'No display value.',
//   //     overflow: TextOverflow.fade,
//   //     style: const TextStyle(color: Colors.white),
//   //   );
//   // }
//
//
//   // Future<void> _handleBarcode(BarcodeCapture barcodes) async {
//   //   if (barcodes.barcodes.firstOrNull?.displayValue != null) {
//   //     final String scannedCode = barcodes.barcodes.firstOrNull!.displayValue!;
//   //     final parsedItem =
//   //         Gs1ScannedItem.fromScannedCode(parser.parse(scannedCode));
//   //     if (mounted && (widget.validateItem?.call(parsedItem) ?? true)) {
//   //       _itemControl.updateValue(parsedItem);
//   //       await controller.stop();
//   //     }
//   //   }
//
//   //   // // Gs1ScannedItem?
//   //   // if (mounted) {
//   //   //   setState(() {
//   //   //     _barcode = barcodes.barcodes.firstOrNull;
//   //   //   });
//   //   // }
//   // }
//
//   Future<void> onRescan() async {
//     // resume controller
//     controller.start();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _item = widget.initialItem;
//     _itemControl = FormControl<Gs1ScannedItem>(value: _item);
//     _itemForm = FormGroup({
//       'item': _itemControl,
//       'count': FormControl<int>(value: _item?.count),
//     });
//
//     WidgetsBinding.instance.addObserver(this);
//
//     _subscription = controller.barcodes.listen(_handleBarcode);
//
//     unawaited(controller.start());
//   }
//   Future<void> _analyzeImageFromFile() async {
//     try {
//       final XFile? file =
//       await ImagePicker().pickImage(source: ImageSource.gallery);
//
//       if (!mounted) {
//         return;
//       }
//
//       if (file == null) {
//         setState(() {
//           _barcodeCapture = null;
//         });
//         return;
//       }
//
//       final BarcodeCapture? barcodeCapture =
//       await controller.analyzeImage(file.path);
//
//       if (mounted) {
//         setState(() {
//           _barcodeCapture = barcodeCapture;
//         });
//       }
//     } catch (_) {}
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget label = const Text('Pick a file to detect barcode');
//
//     if (_barcodeCapture != null) {
//       _handleBarcode(_barcodeCapture!);
//       label = Text(
//         _barcodeCapture?.barcodes.firstOrNull?.rawValue ??
//             'No barcode detected',
//       );
//     }
//     return Column(
//       children: [
//         Expanded(
//           child: Stack(
//             children: [
//               // MobileScanner(
//               //   controller: controller,
//               //   fit: BoxFit.contain,
//               // ),
//               // Positioned.fill(
//               //   child: ColoredBox(
//               //     color: Colors.black.withOpacity(0.5),
//               //     child: CustomPaint(
//               //       painter: ScannerOverlay(Rect.fromCenter(
//               //         center: MediaQuery.sizeOf(context).center(Offset.zero),
//               //         width: 200,
//               //         height: 200,
//               //       )),
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: Center(
//             child: ElevatedButton(
//               onPressed: kIsWeb ? null : _analyzeImageFromFile,
//               child: kIsWeb
//                   ? const Text('Analyze image is not supported on web')
//                   : const Text('Choose file'),
//             ),
//           ),
//         ),
//         ReactiveValueListenableBuilder<Gs1ScannedItem>(
//           formControl: _itemControl,
//           builder: (context, control, child) {
//             return control.value != null
//                 ? ScannedItemDetailsWidget(
//                     itemForm: _itemForm,
//                     onAddItem: _onAddItem,
//                     onCancel: _onCancel,
//                     onRescan: onRescan,
//                   )
//                 : SizedBox.shrink();
//           },
//         ),
//       ],
//     );
//     ;
//   }
//
//   void _onAddItem() {
//     if (_itemForm.valid) {
//       widget.onValidItemScanned(_itemControl.value!);
//     }
//   }
//
//   void _onCancel() {
//     widget.onCancel?.call();
//   }
//
//   @override
//   Future<void> dispose() async {
//     WidgetsBinding.instance.removeObserver(this);
//     unawaited(_subscription?.cancel());
//     _subscription = null;
//     super.dispose();
//     await controller.dispose();
//   }
// }
//
// class Gs1ScannedItem {
//   final String gtin;
//   final int count;
//
//   Gs1ScannedItem({required this.gtin, required this.count});
// }