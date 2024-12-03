import 'dart:async';

import 'package:d2_remote/modules/datarun_shared/utilities/parsing_helpers.dart';
import 'package:datarun/data_run/form/scanned_code/examples/scanner_button_widgets.dart';
import 'package:datarun/data_run/form/scanned_code/examples/scanner_error_widget.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/scanned_code_element/scanned_item_details.dart';
import 'package:flutter/material.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../form/scanned_code/examples/scanned_barcode_label.dart';

class BarcodeScannerWidget extends StatefulWidget {
  final Function(Gs1ScannedItem) onValidItemScanned;
  final bool Function(Gs1ScannedItem?)? validateItem;
  final Gs1ScannedItem? initialItem;
  final VoidCallback? onCancel;

  BarcodeScannerWidget({
    this.initialItem,
    required this.onValidItemScanned,
    this.validateItem,
    this.onCancel,
  });

  @override
  State<BarcodeScannerWidget> createState() => _BarcodeScannerWidgetState();
}

class _BarcodeScannerWidgetState extends State<BarcodeScannerWidget>
    with WidgetsBindingObserver {
  late final FormGroup _itemForm;
  late final FormControl<Gs1ScannedItem> _itemControl;
  late final Gs1ScannedItem? _item;
  final parser = GS1BarcodeParser.defaultParser();

  final MobileScannerController controller = MobileScannerController(
    autoStart: false,
    torchEnabled: true,
    useNewCameraSelector: true,
  );

  Barcode? _barcode;
  StreamSubscription<Object?>? _subscription;

  Widget _buildScannedItemDetailsWidget(Barcode? value) {
    if (value == null) {
      return ScannedItemDetailsWidget(
        itemForm: _itemForm,
      );
    }

    return Text(
      value.displayValue ?? 'No display value.',
      overflow: TextOverflow.fade,
      style: const TextStyle(color: Colors.white),
    );
  }

  Future<void> _handleBarcode(BarcodeCapture barcodes) async {
    if (barcodes.barcodes.firstOrNull?.displayValue != null) {
      final String scannedCode = barcodes.barcodes.firstOrNull!.displayValue!;
      final parsedItem =
          Gs1ScannedItem.fromScannedCode(parser.parse(scannedCode));
      if (mounted && (widget.validateItem?.call(parsedItem) ?? true)) {
        _itemControl.updateValue(parsedItem);
        await controller.stop();
      }
    }

    // // Gs1ScannedItem?
    // if (mounted) {
    //   setState(() {
    //     _barcode = barcodes.barcodes.firstOrNull;
    //   });
    // }
  }

  Future<void> onRescan() async {
    // resume controller
    controller.start();
  }

  @override
  void initState() {
    super.initState();
    _item = widget.initialItem;
    _itemControl = FormControl<Gs1ScannedItem>(value: _item);
    _itemForm = FormGroup({
      'item': _itemControl,
      'count': FormControl<int>(value: _item?.count),
    });

    WidgetsBinding.instance.addObserver(this);

    _subscription = controller.barcodes.listen(_handleBarcode);

    unawaited(controller.start());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Returning image')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: ColoredBox(
                color: Colors.grey,
                child: Stack(
                  children: [
                    MobileScanner(
                      controller: controller,
                      errorBuilder: (context, error, child) {
                        return ScannerErrorWidget(error: error);
                      },
                      fit: BoxFit.contain,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 100,
                        color: Colors.black.withOpacity(0.4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ToggleFlashlightButton(controller: controller),
                            StartStopMobileScannerButton(
                              controller: controller,
                            ),
                            Expanded(
                              child: Center(
                                child: ScannedBarcodeLabel(
                                  barcodes: controller.barcodes,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// returning the item using [_buildScannedItemDetailsWidget(value)] method
            Expanded(
              child: StreamBuilder<BarcodeCapture>(
                stream: controller.barcodes,
                builder: (context, snapshot) {
                  final BarcodeCapture? barcode = snapshot.data;

                  if (barcode == null) {
                    return const Center(
                      child: Text(
                        'Your scanned barcode will appear here!',
                      ),
                    );
                  }

                  final barcodeImage = barcode.image;

                  if (barcodeImage == null) {
                    return const Center(
                      child: Text('No image for this barcode.'),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      late final Gs1ScannedItem updatedItem;
                      if (_itemControl.value != null) {
                        final updatedItem = _itemControl.value!
                            .copyWith(count: _itemForm.control('count').value);
                        widget.onValidItemScanned(updatedItem);
                      }
                    },
                    child: const Text('Add Item'),
                  ),
                  ElevatedButton(
                    onPressed: onRescan,
                    child: const Text('Rescan'),
                  ),

                  /// usually would pop this widget without result
                  ElevatedButton(
                    onPressed: widget.onCancel,
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    unawaited(_subscription?.cancel());
    _subscription = null;
    super.dispose();
    await controller.dispose();
  }
}
