// import 'package:datarun/commons/logging/new_app_logging.dart';
// import 'package:datarun/data_run/form/scanned_code/scan_validator.dart';
// import 'package:datarun/data_run/screens/form/element/form_element.dart';
// import 'package:datarun/data_run/screens/form/element_widgets/scanned_items_table.dart';
// import 'package:datarun/generated/l10n.dart';
// import 'package:flutter/material.dart';
// import 'package:reactive_forms/reactive_forms.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//
// typedef OnGs1Scan = void Function(Gs1ScannedItem code);
//
// class ReactiveCodeScanField
//     extends ReactiveFormField<Map<String, Object?>, Gs1ScannedItem> {
//   final ScanValidator? validator;
//
//   ReactiveCodeScanField({
//     super.key,
//     super.formControlName,
//     super.formControl,
//     super.validationMessages,
//     super.valueAccessor,
//     super.showErrors,
//     super.focusNode,
//     this.validator,
//     String? labelText,
//     String cancelText = 'Cancel',
//     ScanMode? scanMode = ScanMode.DEFAULT,
//     InputDecoration? decoration,
//     TextStyle? style,
//     bool enableInteractiveSelection = true,
//     bool showClearIcon = false,
//     Widget clearIcon = const Icon(Icons.clear),
//     OnGs1Scan? onScan,
//   }) : super(
//           builder: (field) {
//             return IgnorePointer(
//               ignoring: !field.control.enabled,
//               child: Opacity(
//                 opacity: field.control.enabled ? 1 : 0.5,
//                 child: ScanGs1Items(
//                     validator: validator,
//                     onScan: (barcodeScanRes) {
//                       field.didChange(barcodeScanRes);
//                     }),
//               ),
//             );
//           },
//         );
// }
