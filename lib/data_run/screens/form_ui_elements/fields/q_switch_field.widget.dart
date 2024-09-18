// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:mass_pro/commons/extensions/string_extension.dart';
// import 'package:mass_pro/data_run/form/form_model/form_model.dart';
//
// class QSwitchField extends StatefulWidget {
//   const QSwitchField({super.key, required this.fieldModel});
//
//   final QFieldModel fieldModel;
//
//   @override
//   State<QSwitchField> createState() => _QSwitchFieldState();
// }
//
// class _QSwitchFieldState extends State<QSwitchField> {
//   @override
//   Widget build(BuildContext context) {
//     return FormBuilderSwitch(
//       key: ValueKey(widget.fieldModel.name),
//       name: widget.fieldModel.name,
//       enabled: widget.fieldModel.disabled,
//       initialValue: widget.fieldModel.value.toBoolean(),
//       decoration: InputDecoration(
//         border: const OutlineInputBorder(),
//         contentPadding: const EdgeInsets.only(left: 20, top: 40),
//         labelText: widget.fieldModel.formattedLabel,
//       ),
//       onChanged: (bool? value) {
//         // widget.fieldModel.onTextChange(value?.toString());
//         // if (value != null) {
//         widget.fieldModel.onSaveBoolean(value);
//         // }
//       },
//       title: Text(widget.fieldModel.formattedLabel),
//     );
//   }
// }
