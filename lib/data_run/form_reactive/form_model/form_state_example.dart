// import 'package:flutter/material.dart';
// import 'package:mass_pro/data_run/form_reactive/form_model/form_state.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// typedef ReactiveFieldBuilder<T, K> = Widget Function(ReactiveFieldState<T,
//     K> field);
//
// class ReactiveField<ModelDataType, ViewDataType>
//     extends ReactiveFormField<ModelDataType, ViewDataType> {
//   final FieldConfig fieldConfig;
//   final ReactiveFieldBuilder<ModelDataType, ViewDataType> builder;
//   final ValidationMessageFunction? validationMessage;
//   final ShowErrorsFunction? showError;
//
//   ReactiveField(
//       {required this.fieldConfig, required this.builder,
//         this.validationMessage, this.showError})
//       : super(
//       formControlName: fieldConfig.key,
//       validationMessages: validationMessage,
//       showErrors: showError,
//       builder: (field) {
//         return Visibility(visible: fieldConfig.visible,
//             child: builder(
//                 field as ReactiveFieldState<ModelDataType, ViewDataType>));
//       });
//
//   @override
//   ReactiveFieldState<ModelDataType, ViewDataType> createState() =>
//       ReactiveFieldState<ModelDataType, ViewDataType>(fieldConfig: fieldConfig);
// }
//
// // State for base reactive form Field
// class ReactiveFieldState<ModelDataType, ViewDataType>
//     extends ReactiveFormFieldState<ModelDataType, ViewDataType> {
//   final FieldConfig fieldConfig;
//
//   ReactiveFieldState({required this.fieldConfig});
//
//   bool get readOnly =>
//       (fieldConfig.templateOptions?.readonly ?? false) || control.disabled;
//
//   bool get isTouchedAndInvalid =>
//       control.touched && control.invalid && control.hasErrors;
//
// // Other shared props and methods that uses field control state
// }
//
// // Sample custom field:
// class BarcodeScannerFormField extends ReactiveField<dynamic, String> {
//   BarcodeScannerFormField({required FieldConfig fieldConfig})
//       : super(
//       fieldConfig: fieldConfig,
//       showError: fieldConfig.hasValidators ? (control) =>
//           showErrorMessage(control, fieldConfig.key) : null,
//       validationMessage: fieldConfig.hasValidators ? (control) =>
//           getValidationMessage(control, fieldConfig.key) : null,
//       builder: (field) {
//         final state = field as BarcodeScannerFormFieldState
//           ..setFocusNode();
//         return TextField(
//           onChanged: state.didChange,
//           enabled: state.control.enabled,
//           autocorrect: false,
//           controller: state.textController,
//           focusNode: state.focusNode,
//           readOnly: state.readOnly,
//           decoration: InputDecoration(
//               enabled: !state.readOnly,
//               labelText: fieldConfig.templateOptions?.label ?? '',
//               hintText: fieldConfig.templateOptions?.placeholder,
//               labelStyle: TextStyle(color: Theme
//                   .of(state.context)
//                   .primaryColor),
//               border: OutlineInputBorder(),
//               filled: false,
//               errorText: state.errorText,
//               contentPadding: EdgeInsets.all(16),
//               suffixIcon: (state.control.value == null ||
//                   state.control.value.isEmpty || !state.control.valid)
//                   ? IconButton(
//                 onPressed: () async {
//                   await state.scanBarcode();
//                 },
//                 icon: Icon(Icons.scanner),
//               )
//                   : SizedBox(
//                 width: 100,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     IconButton(
//                       onPressed: () async {
//                         await state.scanBarcode();
//                       },
//                       icon: Icon(Icons.scanner),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.done),
//                     ),
//                   ],
//                 ),
//               )),
//           keyboardType: TextInputType.text,
//         );
//       });
//
//   @override
//   BarcodeScannerFormFieldState createState() =>
//       BarcodeScannerFormFieldState(fieldConfig: fieldConfig);
// }
//
//
// // Extends InputFormFieldState already used in custom InputField
// // and provide only additional methods
// class BarcodeScannerFormFieldState extends InputFormFieldState {
//   BarcodeScannerFormFieldState({required FieldConfig fieldConfig})
//       : super(element: fieldConfig);
//
//   Future scanBarcode() async {
//     try {
//       final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Abandon', true, ScanMode.QR);
//       if (barcodeScanRes.isEmpty || barcodeScanRes.trim() == '-1') {
//         return;
//       }
//       updateBarcodeValue(barcodeScanRes.trim());
//     } catch (e, trace) {
//       logError('Error read barcode', '$e', trace);
//       toastError('Error read barcode. $e');
//       updateBarcodeValue('');
//     }
//   }
//
//   void updateBarcodeValue(dynamic value) {
//     try {
//       if (!control.dirty) {
//         control.markAsDirty(emitEvent: false);
//       }
//       control.updateValue(value);
//       if (!control.touched) {
//         control.markAsTouched();
//       }
//     } catch (e, trace) {
//       logError(
//           'BarcodeField - updateBarcodeValue ${element.key}', e, trace);
//     }
//   }
// }