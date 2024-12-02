part of '../../screens/form/element/form_element.dart';

class Gs1ScannedItem with EquatableMixin {
  const Gs1ScannedItem({
    this.AIs,
    required this.isBundle,
    required this.isSingleItem,
    this.gtin,
    this.batchLot,
    this.productionDate,
    this.serialNumber,
    this.bundleCount,
  });

  factory Gs1ScannedItem.fromScannedCode(GS1Barcode? barcode) => Gs1ScannedItem(
        gtin: barcode?.getAIRawData('01') ?? barcode?.getAIRawData('02'),
        isBundle:
            (barcode?.hasAI('02') ?? false) && (barcode?.hasAI('37') ?? false),
        isSingleItem:
            (barcode?.hasAI('01') ?? false) && (barcode?.hasAI('21') ?? false),
        batchLot: barcode?.getAIRawData('10'),
        productionDate: barcode?.getAIData('11'),
        serialNumber: barcode?.getAIRawData('21'),
        bundleCount: barcode?.getAIRawData('37') != null
            ? int.tryParse(barcode!.getAIRawData('37')!)
            : 1,
        AIs: barcode?.elements.keys,
      );

  final Iterable<String>? AIs;

  /// Determines if the code represents a bundle
  final bool isBundle;

  /// Determines if the code represents a single item
  final bool isSingleItem;

  /// Consistent for items of the same type
  final String? gtin;

  /// Batch/Lot number, consistent for items in the same batch
  final String? batchLot;

  /// Production date, consistent for items in the same batch
  final DateTime? productionDate;

  // /// Production date, consistent for items in the same batch
  // String? get productionDateRaw => barcode?.getAIData('11');

  /// Serial number, exclusive to single items
  final String? serialNumber;

  /// Quantity of items in the bundle (only for bundles)
  final int? bundleCount;

  /// Utility method to display key information
  String getDetails() {
    if (isBundle) {
      return 'Bundle of $bundleCount items (GTIN: $gtin, Batch: $batchLot, Production Date: $productionDate), Available AIs: ${AIs}';
    } else if (isSingleItem) {
      return 'Single item (GTIN: $gtin, Serial: $serialNumber, Batch: $batchLot, Production Date: $productionDate), Available AIs: ${AIs}';
    } else {
      return 'Unknown type';
    }
  }

  Gs1ScannedItem copyWith({
    Iterable<String>? AIs,
    bool? isBundle,
    bool? isSingleItem,
    String? gtin,
    String? batchLot,
    DateTime? productionDate,
    String? serialNumber,
    int? bundleCount,
  }) {
    return Gs1ScannedItem(
      AIs: AIs ?? this.AIs,
      isBundle: isBundle ?? this.isBundle,
      isSingleItem: isSingleItem ?? this.isSingleItem,
      gtin: gtin ?? this.gtin,
      batchLot: batchLot ?? this.batchLot,
      productionDate: productionDate ?? this.productionDate,
      serialNumber: serialNumber ?? this.serialNumber,
      bundleCount: bundleCount ?? this.bundleCount,
    );
  }

  @override
  List<Object?> get props => [
        isBundle,
        isSingleItem,
        gtin,
        batchLot,
        productionDate,
        serialNumber,
        bundleCount
      ];

  factory Gs1ScannedItem.fromMap(Map<String, dynamic> map) {
    return Gs1ScannedItem(
      AIs: map['AIs'] as Iterable<String>,
      isBundle: map['isBundle'] as bool,
      isSingleItem: map['isSingleItem'] as bool,
      gtin: map['gtin'] as String,
      batchLot: map['batchLot'] as String,
      productionDate: map['productionDate'] as DateTime,
      serialNumber: map['serialNumber'] as String,
      bundleCount: map['bundleCount'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'AIs': this.AIs,
      'isBundle': this.isBundle,
      'isSingleItem': this.isSingleItem,
      'gtin': this.gtin,
      'batchLot': this.batchLot,
      'productionDate': this.productionDate,
      'serialNumber': this.serialNumber,
      'bundleCount': this.bundleCount,
    };
  }

// @override
// String toString() {
//   final elem = barcode?.elements.entries.fold(
//       '',
//           (String previousValue, element) =>
//       previousValue +
//           '${element.key} (${AI.AIS[element.key]!.dataTitle}): ${element.value.data},\n');
//   return 'code = ${code.codeTitle},\ndata = {\n$elem}';
// }
}

void main() {
  String code1 = ']C102076402178117593750\u001d1124070010104724';
  String code2 = '\u001d01076402178117591124070010104724\u001d21E6DAF62C0';
  final parser = GS1BarcodeParser.defaultParser();
  final GS1Barcode parsedCode1 = parser.parse(code1);
  final GS1Barcode parsedCode2 = parser.parse(code2);

  // Map<String, dynamic> bundleData = {
  //   '02': '07640217811759',
  //   '37': '50',
  //   '11': DateTime(2024, 6, 30),
  //   '10': '104724',
  // };
  //
  // Map<String, dynamic> singleItemData = {
  //   '01': '07640217811759',
  //   '11': DateTime(2024, 6, 30),
  //   '10': '104724',
  //   '21': 'E6DAF62C0',
  // };

  Gs1ScannedItem bundleCode = Gs1ScannedItem.fromScannedCode(parsedCode1);
  Gs1ScannedItem singleItemCode = Gs1ScannedItem.fromScannedCode(parsedCode2);

  print(bundleCode
      .getDetails()); // Output: Bundle of 50 items (GTIN: 07640217811759, Batch: 104724, Production Date: 2024-06-30 00:00:00.000)
  print(singleItemCode
      .getDetails()); // Output: Single item (GTIN: 07640217811759, Serial: E6DAF62C0, Batch: 104724, Production Date: 2024-06-30 00:00:00.000)
}
