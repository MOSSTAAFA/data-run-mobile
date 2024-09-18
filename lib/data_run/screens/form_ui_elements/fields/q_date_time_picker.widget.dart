// import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
//
// class QDateTimePicker extends StatelessWidget {
//   const QDateTimePicker({super.key, required this.fieldModel});
//
//   final QFieldModel fieldModel;
//
//   @override
//   Widget build(BuildContext context) {
//     final InputType inputType = fieldModel.valueType == ValueType.Date
//         ? InputType.date
//         : fieldModel.valueType == ValueType.Time
//             ? InputType.time
//             : InputType.both;
//     return FormBuilderDateTimePicker(
//       key: ValueKey(fieldModel.name),
//       format: sdk.DateUtils.uiDateFormat(),
//       initialValue: fieldModel.value.toDate(),
//       valueTransformer: (DateTime? date) => date != null
//           ? sdk.DateUtils.databaseDateFormat().format(date.toUtc())
//           : null,
//       name: fieldModel.name,
//       enabled: fieldModel.disabled,
//       validator:
//           fieldModel.isMandatory ? FormBuilderValidators.required() : null,
//       initialEntryMode: DatePickerEntryMode.calendar,
//       inputType: inputType,
//       onChanged: fieldModel.onSaveDate,
//       decoration: InputDecoration(
//         labelText: fieldModel.formattedLabel,
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(width: 2.0),
//         ),
//         suffixIcon: (fieldModel.value ?? '').isNotEmpty
//             ? IconButton(
//                 icon: const Icon(Icons.close),
//                 onPressed: () {
//                   FormBuilder.of(context)
//                       ?.fields[fieldModel.name]
//                       ?.didChange(null);
//                 },
//               )
//             : null,
//       ),
//     );
//   }
// }
