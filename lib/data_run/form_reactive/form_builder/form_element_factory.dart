// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:flutter/material.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_element_members.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_element.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class FormElementWidgetFactory {
//   static Widget createWidget(FormElementInstance element) {
//     if (element is FieldInstance) {
//       return _buildFieldWidget(element);
//     } else if (element is SectionInstance) {
//       return _buildSectionWidget(element);
//     } else if (element is RepeatSectionInstance) {
//       return _buildRepeatSectionWidget(element);
//     } else {
//       return const Text('Unsupported field type');
//     }
//   }
//
//   static Widget _buildFieldWidget(FieldInstance field) {
//     switch (field.type) {
//       case ValueType.Text:
//         return ReactiveTextField<String>(
//           formControlName: field.name,
//           decoration: InputDecoration(labelText: field.properties.label),
//           onChanged: (val) => field.updateValue(val),
//         );
//       case ValueType.Integer:
//         return ReactiveTextField<int>(
//           formControlName: field.name,
//           decoration: InputDecoration(labelText: field.properties.label),
//           onChanged: (val) => field.updateValue(val),
//         );
//       case ValueType.SelectOne:
//         return ReactiveDropdownField<String>(
//             formControlName: field.name,
//             decoration: InputDecoration(labelText: field.properties.label),
//             items: _getDropdownOptions(field),
//             onChanged: (val) => field.updateValue(val));
//       default:
//         return SizedBox.shrink();
//     }
//   }
//
//   static Widget _buildSectionWidget(SectionInstance section) {
//     return Column(
//       children: section.value.map((element) {
//         return createWidget(element);
//       }).toList(),
//     );
//   }
//
//   static Widget _buildRepeatSectionWidget(RepeatSectionInstance repeatSection) {
//     return Column(children: [
//       ...repeatSection.value.map((sectionInstance) {
//         return _buildSectionWidget(sectionInstance);
//       }).toList(),
//       ElevatedButton(
//         onPressed: () {
//           repeatSection.add(SectionInstance(
//             name: 'New Section',
//             type: ValueType.Section,
//             properties: ElementProperties(disabled: false),
//           ));
//         },
//         child: Text('Add Section'),
//       ),
//     ]);
//   }
//
//  static List<DropdownMenuItem<String>> _getDropdownOptions(FieldInstance field) {
//     return field.options
//         .where((option) => option.listName == field.listName)
//         .map((option) => DropdownMenuItem(
//       value: option.name,
//       child: Text(option.name),
//     ))
//         .toList();
//   }
// }
