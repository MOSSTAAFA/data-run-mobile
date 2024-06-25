// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:mass_pro/data_run/form/form_input_field.model.dart';
// import 'package:mass_pro/data_run/form/syncable_form_repository.dart';
// import 'package:mass_pro/sdk/core/common/value_type.dart';
//
// /// the app uses flutter_form_builder package
// ///
// /// FormBuilderTextField when FieldInputModel.valueType
// /// is either = [ValueType.Text, ValueType.Number]
// /// when field.valueType = ValueType.Number, TextInputType = TextInputType.number
// /// otherwise TextInputType will be = TextInputType.text
// class TextFieldInput extends ConsumerWidget {
//   const TextFieldInput({super.key, required this.fieldIndex});
//
//   final int fieldIndex;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<FormFieldModel> fieldInputModel =
//         ref.watch(fieldInputModelNotifierProvider(fieldIndex));
//
//     return fieldInputModel.when(
//         data: (FormFieldModel fieldModel) => FormBuilderTextField(
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             name: fieldModel.key,
//             decoration: InputDecoration(
//                 labelText: fieldModel.label,
//                 focusedBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue, width: 2.0),
//                 )),
//             keyboardType: _getInputType(fieldModel.valueType)),
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (Object e, _) => Center(
//               child: Text(
//                 e.toString(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineSmall!
//                     .copyWith(color: Colors.red),
//               ),
//             ));
//   }
//
//   /// helper function to determine the TextInputType of the field
//   TextInputType _getInputType(ValueType? type) {
//     if (type?.isNumeric ?? false) {
//       return TextInputType.number;
//     }
//     return TextInputType.text;
//   }
// }
//
// /// FormBuilderDateTimePicker when FieldInputModel.valueType = ValueType.Date
// class DateFieldInput extends ConsumerWidget {
//   const DateFieldInput({super.key, required this.fieldIndex});
//
//   final int fieldIndex;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<FormFieldModel> fieldInputModel =
//         ref.watch(fieldInputModelNotifierProvider(fieldIndex));
//
//     return fieldInputModel.when(
//         // the Card that will contain the input field
//         data: (FormFieldModel fieldModel) => Placeholder(),
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (Object e, _) => Center(
//               child: Text(
//                 e.toString(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineSmall!
//                     .copyWith(color: Colors.red),
//               ),
//             ));
//   }
// }
//
// /// FormBuilderCheckboxGroup when FieldInputModel.valueType = ValueType.SelectMulti
// /// When FieldInputModel.valueType = ValueType.SelectMulti
// /// The Field options will be inside FieldInputModel.options
// class CheckboxGroupFieldInput extends ConsumerWidget {
//   const CheckboxGroupFieldInput({super.key, required this.fieldIndex});
//
//   final int fieldIndex;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<FormFieldModel> fieldInputModel =
//         ref.watch(fieldInputModelNotifierProvider(fieldIndex));
//
//     return fieldInputModel.when(
//         // the Card that will contain the input field
//         data: (FormFieldModel fieldModel) => Placeholder(),
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (Object e, _) => Center(
//               child: Text(
//                 e.toString(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineSmall!
//                     .copyWith(color: Colors.red),
//               ),
//             ));
//   }
// }
//
// /// TextField when FieldInputModel.valueType = ValueType.SelectOne
// class RadioGroupFieldInput extends ConsumerWidget {
//   const RadioGroupFieldInput({super.key, required this.fieldIndex});
//
//   final int fieldIndex;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<FormFieldModel> fieldInputModel =
//         ref.watch(fieldInputModelNotifierProvider(fieldIndex));
//
//     return fieldInputModel.when(
//         // the Card that will contain the input field
//         data: (FormFieldModel fieldModel) => Placeholder(),
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (Object e, _) => Center(
//               child: Text(
//                 e.toString(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .headlineSmall!
//                     .copyWith(color: Colors.red),
//               ),
//             ));
//   }
// }
