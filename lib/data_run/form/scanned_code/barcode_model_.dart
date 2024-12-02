// import 'package:equatable/equatable.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
//
// class Gs1BarcodeModel with EquatableMixin {
//   GS1Barcode? barcode;
//   // final IMap<String, GS1ParsedElement<dynamic>> elements;
//
//   Map<String, dynamic> get data => barcode?.getAIsData ?? {};
//
//   @override
//   List<Object?> get props => [elements];
//
//   Iterable<String> get AIs => data.keys;
//
//   Gs1BarcodeModel(GS1Barcode? barcode)
//       : elements = IMap.orNull(barcode?.elements) ?? const IMap.empty();
//
//   /// Determines if the code represents a bundle
//   bool get isBundle =>
//       (barcode?.hasAI('02') ?? false) && (barcode?.hasAI('37') ?? false);
//
//   /// Determines if the code represents a single item
//   bool get isSingleItem =>
//       (barcode?.hasAI('01') ?? false) && (barcode?.hasAI('21') ?? false);
//
//   /// Consistent for items of the same type
//   String? get gtin =>
//       barcode?.getAIRawData('01') ?? barcode?.getAIRawData('02');
//
//   /// Batch/Lot number, consistent for items in the same batch
//   String? get batchLot => barcode?.getAIRawData('10');
//
//   /// Production date, consistent for items in the same batch
//   DateTime? get productionDate => barcode?.getAIData('11');
//
//   /// Production date, consistent for items in the same batch
//   String? get productionDateRaw => barcode?.getAIData('11');
//
//   /// Serial number, exclusive to single items
//   String? get serialNumber => barcode?.getAIRawData('21');
//
//   /// Quantity of items in the bundle (only for bundles)
//   int? get bundleCount => barcode?.getAIRawData('37') != null
//       ? int.tryParse(barcode!.getAIRawData('37')!)
//       : 1;
//
//   /// Utility method to display key information
//   String getDetails() {
//     if (isBundle) {
//       return 'Bundle of $bundleCount items (GTIN: $gtin, Batch: $batchLot, Production Date: $productionDate), Available AIs: ${barcode?.AIs}';
//     } else if (isSingleItem) {
//       return 'Single item (GTIN: $gtin, Serial: $serialNumber, Batch: $batchLot, Production Date: $productionDate), Available AIs: ${barcode?.AIs}';
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
//   Gs1BarcodeModel bundleCode = Gs1BarcodeModel(parsedCode1);
//   Gs1BarcodeModel singleItemCode = Gs1BarcodeModel(parsedCode2);
//
//   print(bundleCode
//       .getDetails()); // Output: Bundle of 50 items (GTIN: 07640217811759, Batch: 104724, Production Date: 2024-06-30 00:00:00.000)
//   print(singleItemCode
//       .getDetails()); // Output: Single item (GTIN: 07640217811759, Serial: E6DAF62C0, Batch: 104724, Production Date: 2024-06-30 00:00:00.000)
// }
