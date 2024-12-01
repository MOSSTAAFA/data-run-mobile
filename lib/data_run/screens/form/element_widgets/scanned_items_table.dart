import 'package:datarun/commons/logging/new_app_logging.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/element/scanned_code_element.dart';
import 'package:datarun/data_run/screens/form/element/validator/scan_validator.dart';
import 'package:datarun/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

class ScanScreen extends StatefulWidget {
  ScanScreen({super.key, required this.scannedElement});

  ScannedFieldInstance scannedElement;

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final ScannedItemsProvider provider = ScannedItemsProvider();

  void handleScan(GS1Barcode barcode) {
    final validator =
        ScanValidator(widget.scannedElement.template.scannedCodeProperties!);
    if (validator.validate(barcode)) {
      provider.addItem(barcode);
      showSnackBar('Item added successfully!');
    } else {
      showSnackBar('Invalid scan!');
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ScannedItemsTable(items: provider.items),
        ),
        ElevatedButton(
          onPressed: () async {
            // Trigger scanning logic
            String barcodeScanRes;
            try {
              barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                  '#ff6666', S.of(context).cancel, true, ScanMode.DEFAULT);
              logDebug(barcodeScanRes);
            } on PlatformException {
              barcodeScanRes = 'Failed to get platform version.';
            }

            if (barcodeScanRes != -1) {
              final parser = GS1BarcodeParser.defaultParser();
              final result = parser.parse(barcodeScanRes);
              handleScan(result);
            }
          },
          child: const Text('Scan Again'),
        ),
      ],
    );
  }

  final Set<String> scannedGtins = {};

  bool isDuplicate(String gtin, String batchLot) {
    final key = '$gtin-$batchLot';
    if (scannedGtins.contains(key)) {
      return true;
    } else {
      scannedGtins.add(key);
      return false;
    }
  }
}

class ScannedItemsTable extends StatelessWidget {
  final List<ScannedItem> items;

  const ScannedItemsTable({required this.items, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('GTIN')),
        DataColumn(label: Text('Production Date')),
        DataColumn(label: Text('Batch/Lot')),
        DataColumn(label: Text('Serial')),
        DataColumn(label: Text('Quantity')),
        DataColumn(label: Text('Type')),
      ],
      rows: items.map((item) {
        return DataRow(cells: [
          DataCell(Text(item.gtin)),
          DataCell(Text(item.productionDate.toIso8601String())),
          DataCell(Text(item.batchLot)),
          DataCell(Text(item.serial ?? '-')),
          DataCell(Text(item.quantity.toString())),
          DataCell(Text(item.isBundle ? 'Bundle' : 'Single Item')),
        ]);
      }).toList(),
    );
  }
}
