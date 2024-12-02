// import 'package:flutter/material.dart';
// import 'package:gs1_barcode_parser/gs1_barcode_parser.dart';
//
// /// data = {
// /// 02 (CONTENT): 07640217811759,
// /// 37 (COUNT): 50,
// /// 11 (PROD DATE): 2024-06-30 00:00:00.000,
// /// 10 (BATCH/LOT): 104724,
// /// }
// /// code = Undefined,
// /// data = {
// /// 01 (GTIN): 07640217811759,
// /// 11 (PROD DATE): 2024-06-30 00:00:00.000,
// /// 10 (BATCH/LOT): 104724,
// /// 21 (SERIAL): E6DAF62C0,
// /// }
// class ScannedItem {
//   final String gtin;
//   final DateTime productionDate;
//   final String batchLot;
//   final String? serial; // Only for single items
//   final int
//       quantity; // Quantity is dynamic (1 for single item, count for bundles)
//   bool get isBundle => serial == null || quantity > 1;
//
//   ScannedItem({
//     required this.gtin,
//     required this.productionDate,
//     required this.batchLot,
//     this.serial,
//     required this.quantity,
//   });
// }
//
//
