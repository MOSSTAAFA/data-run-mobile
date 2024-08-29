// import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
// import 'package:d2_remote/modules/metadatarun/org_unit/entities/org_unit.entity.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';
// import 'package:mass_pro/data_run/screens/form/model/q_field.model.dart';
// import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
//
// class QAutocomplete extends StatefulWidget {
//   const QAutocomplete({super.key, required this.fieldModel});
//
//   final QFieldModel fieldModel;
//
//   @override
//   State<QAutocomplete> createState() => _QAutocompleteState();
// }
//
// class _QAutocompleteState extends State<QAutocomplete> {
//   @override
//   Widget build(BuildContext context) {
//     return FormBuilderField<DOrganisationUnit>(
//       key: ValueKey(widget.fieldModel.uid),
//       valueTransformer: (FormOption? option) => option?.name,
//       selectedColor: Theme.of(context).colorScheme.error.withAlpha(100),
//       onReset: () => widget.fieldModel.onClear(),
//       name: widget.fieldModel.uid,
//       enabled: widget.fieldModel.isEditable,
//       validator: widget.fieldModel.isMandatory
//           ? FormBuilderValidators.required()
//           : null,
//       initialValue: widget.fieldModel.getOption(),
//       options: _getChipOptions(
//           widget.fieldModel.optionConfiguration!.optionsToDisplay,
//           wide: false),
//       onChanged: (FormOption? value) {
//         widget.fieldModel.onSaveOption(value);
//       },
//       decoration: InputDecoration(
//         border: const OutlineInputBorder(gapPadding: 20),
//         contentPadding: const EdgeInsets.all(16),
//         labelText: widget.fieldModel.label,
//         labelStyle: Theme.of(context).textTheme.titleLarge,
//         // fillColor: Colors.red.shade200,
//       ),
//     );
//   }
//
//   List<FormBuilderChipOption<FormOption>> _getChipOptions(
//       IList<FormOption> options,
//       {bool? wide}) {
//     return options
//         .map((FormOption option) => FormBuilderChipOption<FormOption>(
//               value: option,
//               // avatar: !(wide ?? false)
//               //     ? CircleAvatar(
//               //         child: Icon(getRandomIcon(option.name), size: 30))
//               //     : null,
//               child: wide ?? false
//                   ? Container(
//                       padding: const EdgeInsets.all(1.0),
//                       child: Column(
//                         children: <Widget>[
//                           Text(getItemLocalString(option.label)),
//                           /*Icon(
//                             getRandomIcon(option.name),
//                             size: 30,
//                           ),*/
//                         ],
//                       ))
//                   : Text(getItemLocalString(option.label)),
//             ))
//         .toList();
//   }
// }
