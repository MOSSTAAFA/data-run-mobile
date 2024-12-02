// part of '../../screens/form/element/form_element.dart';
//
// class Gs1BarcodeModel extends FieldInstance<Map<String, Object?>> {
//   final Iterable<String>? AIs;
//   final GS1Barcode? barcode;
//
//   Gs1BarcodeModel(
//       {required super.form,
//       required super.template,
//       this.barcode,
//       required super.elementProperties})
//       : this.gtin = barcode?.getAIRawData('01') ?? barcode?.getAIRawData('02'),
//         this.isBundle =
//             (barcode?.hasAI('02') ?? false) && (barcode?.hasAI('37') ?? false),
//         this.isSingleItem =
//             (barcode?.hasAI('01') ?? false) && (barcode?.hasAI('21') ?? false),
//         this.batchLot = barcode?.getAIRawData('10'),
//         this.productionDate = barcode?.getAIData('11'),
//         this.serialNumber = barcode?.getAIRawData('21'),
//         this.bundleCount = barcode?.getAIRawData('37') != null
//             ? int.tryParse(barcode!.getAIRawData('37')!)
//             : 1,
//         this.AIs = barcode?.elements.keys;
//
//   // @override
//   // List<Object?> get props => [
//   //       isBundle,
//   //       isSingleItem,
//   //       gtin,
//   //       batchLot,
//   //       productionDate,
//   //       serialNumber,
//   //       bundleCount
//   //     ];
//
//   /// Determines if the code represents a bundle
//   final bool isBundle;
//
//   /// Determines if the code represents a single item
//   final bool isSingleItem;
//
//   /// Consistent for items of the same type
//   final String? gtin;
//
//   /// Batch/Lot number, consistent for items in the same batch
//   final String? batchLot;
//
//   /// Production date, consistent for items in the same batch
//   final DateTime? productionDate;
//
//   // /// Production date, consistent for items in the same batch
//   // String? get productionDateRaw => barcode?.getAIData('11');
//
//   /// Serial number, exclusive to single items
//   final String? serialNumber;
//
//   /// Quantity of items in the bundle (only for bundles)
//   final int? bundleCount;
//
//   /// Utility method to display key information
//   String getDetails() {
//     if (isBundle) {
//       return 'Bundle of $bundleCount items (GTIN: $gtin, Batch: $batchLot, Production Date: $productionDate), Available AIs: ${AIs}';
//     } else if (isSingleItem) {
//       return 'Single item (GTIN: $gtin, Serial: $serialNumber, Batch: $batchLot, Production Date: $productionDate), Available AIs: ${AIs}';
//     } else {
//       return 'Unknown type';
//     }
//   }
//
// // @override
// // String toString() {
// //   final elem = barcode?.elements.entries.fold(
// //       '',
// //           (String previousValue, element) =>
// //       previousValue +
// //           '${element.key} (${AI.AIS[element.key]!.dataTitle}): ${element.value.data},\n');
// //   return 'code = ${code.codeTitle},\ndata = {\n$elem}';
// // }
// }
//
// void main() {
//   String code1 = ']C102076402178117593750\u001d1124070010104724';
//   String code2 = '\u001d01076402178117591124070010104724\u001d21E6DAF62C0';
//   final parser = GS1BarcodeParser.defaultParser();
//   final GS1Barcode parsedCode1 = parser.parse(code1);
//   final GS1Barcode parsedCode2 = parser.parse(code2);
//
//   // Map<String, dynamic> bundleData = {
//   //   '02': '07640217811759',
//   //   '37': '50',
//   //   '11': DateTime(2024, 6, 30),
//   //   '10': '104724',
//   // };
//   //
//   // Map<String, dynamic> singleItemData = {
//   //   '01': '07640217811759',
//   //   '11': DateTime(2024, 6, 30),
//   //   '10': '104724',
//   //   '21': 'E6DAF62C0',
//   // };
//
//   // Gs1BarcodeModel bundleCode = Gs1BarcodeModel(parsedCode1, form: null, template: null, elementProperties: null);
//   // Gs1BarcodeModel singleItemCode = Gs1BarcodeModel(parsedCode2, form: null, template: null, elementProperties: null);
//
//   // print(bundleCode
//   //     .getDetails()); // Output: Bundle of 50 items (GTIN: 07640217811759, Batch: 104724, Production Date: 2024-06-30 00:00:00.000)
//   // print(singleItemCode
//   //     .getDetails()); // Output: Single item (GTIN: 07640217811759, Serial: E6DAF62C0, Batch: 104724, Production Date: 2024-06-30 00:00:00.000)
// }
