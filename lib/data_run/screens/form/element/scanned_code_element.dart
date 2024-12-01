import 'package:flutter/material.dart';
import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';

/// data = {
/// 02 (CONTENT): 07640217811759,
/// 37 (COUNT): 50,
/// 11 (PROD DATE): 2024-06-30 00:00:00.000,
/// 10 (BATCH/LOT): 104724,
/// }
/// code = Undefined,
/// data = {
/// 01 (GTIN): 07640217811759,
/// 11 (PROD DATE): 2024-06-30 00:00:00.000,
/// 10 (BATCH/LOT): 104724,
/// 21 (SERIAL): E6DAF62C0,
/// }
class ScannedItem {
  final String gtin;
  final DateTime productionDate;
  final String batchLot;
  final String? serial; // Only for single items
  final int
      quantity; // Quantity is dynamic (1 for single item, count for bundles)
  bool get isBundle => serial == null || quantity > 1;

  ScannedItem({
    required this.gtin,
    required this.productionDate,
    required this.batchLot,
    this.serial,
    required this.quantity,
  });
}

class ScannedItemsProvider with ChangeNotifier {
  final List<ScannedItem> _items = [];

  List<ScannedItem> get items => List.unmodifiable(_items);

  void addItem(GS1Barcode barcode) {
    final productionDate = barcode.getAIData('11');
    final batchLot = barcode.getAIData('10');
    final serial = barcode.getAIData('21');
    final GTIN =
        serial == null ? barcode.getAIData('01') : barcode.getAIData('02');
    final quantity = int.tryParse(barcode.getAIData('37')) ?? 1;

    final item = ScannedItem(
      gtin: GTIN!,
      productionDate: productionDate!,
      batchLot: batchLot,
      serial: serial,
      quantity: quantity,
    );

    _items.add(item);
    notifyListeners(); // Notify UI to update
  }
}
