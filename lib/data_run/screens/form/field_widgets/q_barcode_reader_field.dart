import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter/material.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class QBarcodeReaderField extends StatelessWidget {
  final FieldInstance<String> element;

  const QBarcodeReaderField({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text('Scan ${element.type == ValueType.Barcode ? 'Barcode' : 'QR Code'}'),
      onPressed: () async {
        // Implement barcode/QR code scanning logic here
        // You'll need to use a package like flutter_barcode_scanner
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', false, ScanMode.BARCODE);
        // Update the form field value with the scanned result
        element.elementControl!.value = barcodeScanRes;
      },
    );
  }
}