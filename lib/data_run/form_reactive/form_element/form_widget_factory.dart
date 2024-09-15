// import 'package:flutter/material.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_element_control_factory.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_element_model.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class FormElementWidgetFactory {
//   static Widget createWidget(FormElementInstance<dynamic> element) {
//     return switch (element) {
//       FieldInstance() => FieldWidget(element: element),
//       SectionInstance() => SectionWidget(element: element),
//       RepeatSectionInstance() => RepeatSectionWidget(element: element),
//     };
//   }
// }
//
// class SectionWidget extends StatelessWidget {
//   final SectionInstance element;
//
//   SectionWidget({required this.element});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: element.elements.values.map((childElement) {
//         // Recursively build child elements
//         return FormElementWidgetFactory.createWidget(childElement);
//       }).toList(),
//     );
//   }
// }
//
// class RepeatSectionWidget extends StatelessWidget {
//   final RepeatSectionInstance element;
//
//   RepeatSectionWidget({required this.element});
//
//   @override
//   Widget build(BuildContext context) {
//     final formArray = element.repeatSectionControl;
//
//     return Column(
//       children: [
//         // Dynamically render all repeated sections
//         for (int i = 0; i < element.elements.length; i++)
//           Column(
//             children: [
//               SectionWidget(element: element.elements[i] as SectionInstance),
//               IconButton(
//                 icon: Icon(Icons.remove_circle),
//                 onPressed: () {
//                   element.removeRepeatSectionItemAtIndex(i);
//                   // Update FormArray when section is removed
//                   formArray.removeAt(i);
//                 },
//               ),
//             ],
//           ),
//         IconButton(
//           icon: Icon(Icons.add),
//           onPressed: () {
//             element.addRepeatSectionItem(i);
//
//             element.addElements();
//             // Add a new FormGroup to the FormArray
//             formArray.add(FromElementControlFactory.createSectionControl(
//                 (element.template)));
//           },
//         ),
//       ],
//     );
//   }
// }
//
// class FieldWidget extends StatelessWidget {
//   final FieldInstance<dynamic> element;
//
//   FieldWidget({required this.element});
//
//   @override
//   Widget build(BuildContext context) {
//     return ReactiveTextField<String>(
//       formControlName: element.name,
//       decoration: InputDecoration(labelText: element.properties.label),
//     );
//   }
// }
