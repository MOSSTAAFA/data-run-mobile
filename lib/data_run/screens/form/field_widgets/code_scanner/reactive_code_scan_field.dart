// import 'package:datarun/commons/logging/new_app_logging.dart';
// import 'package:datarun/generated/l10n.dart';
// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//
// typedef OnScan = void Function(String code);
//
// class ReactiveCodeScanField<T> extends ReactiveFormField<T, String> {
//   ReactiveCodeScanField({
//     super.key,
//     super.formControlName,
//     super.formControl,
//     super.validationMessages,
//     super.valueAccessor,
//     super.showErrors,
//     super.focusNode,
//     String? labelText,
//     String cancelText = 'Cancel',
//     ScanMode? scanMode = ScanMode.DEFAULT,
//     InputDecoration? decoration,
//     TextStyle? style,
//     bool enableInteractiveSelection = true,
//     bool showClearIcon = false,
//     Widget clearIcon = const Icon(Icons.clear),
//     OnScan? onScan,
//   }) : super(
//           builder: (field) {
//             Widget? suffixIcon = decoration?.suffixIcon;
//             final isEmptyValue =
//                 field.value == null || field.value?.isEmpty == true;
//
//             if (showClearIcon && !isEmptyValue) {
//               suffixIcon = InkWell(
//                 borderRadius: BorderRadius.circular(25),
//                 child: clearIcon,
//                 onTap: () async {
//                   field.control.markAsTouched();
//                   field.didChange(null);
//                 },
//               );
//             }
//
//             final InputDecoration effectiveDecoration =
//                 (decoration ?? const InputDecoration())
//                     .applyDefaults(Theme.of(field.context).inputDecorationTheme)
//                     .copyWith(
//                         suffixIcon: suffixIcon,
//                         prefixIcon: Icon(Icons.qr_code_scanner));
//
//             return IgnorePointer(
//               ignoring: !field.control.enabled,
//               child: Opacity(
//                 opacity: field.control.enabled ? 1 : 0.5,
//                 child: GestureDetector(
//                   onTap: () async {
//                     String barcodeScanRes;
//                     try {
//                       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//                           '#ff6666',
//                           cancelText,
//                           true,
//                           scanMode ?? ScanMode.DEFAULT);
//                       logDebug(barcodeScanRes);
//                     } on PlatformException {
//                       barcodeScanRes = 'Failed to get platform version.';
//                     }
//
//                     onScan?.call(barcodeScanRes);
//                     if (int.tryParse(barcodeScanRes) != -1) {
//                       field.didChange(barcodeScanRes);
//                     }
//                   },
//                   child: InputDecorator(
//                     decoration: effectiveDecoration.copyWith(
//                       errorText: field.errorText,
//                       enabled: field.control.enabled,
//                     ),
//                     isFocused: field.control.hasFocus,
//                     isEmpty: isEmptyValue,
//                     child: Row(
//                       children: [
//                         SizedBox(width: 16),
//                         Expanded(
//                           child: Text(
//                             field.value ?? '',
//                             style: Theme.of(field.context)
//                                 .textTheme
//                                 .titleMedium
//                                 ?.merge(style),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//
//   void showScanner(BuildContext context, Function(String) onResult) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return SizedBox(
//           height: MediaQuery.of(context).size.height * 0.6,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(S.of(context).scanYourCode, style: TextStyle(fontSize: 18)),
//               ElevatedButton(
//                 onPressed: () async {
//                   // Trigger the scanning logic
//                   final scanResult = await FlutterBarcodeScanner.scanBarcode(
//                       '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
//                   onResult(scanResult);
//                   Navigator.pop(context); // Close the sheet
//                 },
//                 child: Text("Start Scanner"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
