// import 'package:flutter/material.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_element_model.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// FormGroup buildForm(FormElementInstance element) {
//   final controls = <String, AbstractControl>{};
//
//   if (element is SectionInstance) {
//     for (var child in element.value) {
//       controls[child.name] = _createControlForElement(child);
//     }
//   } else if (element is RepeatSectionInstance) {
//     final dd =  element.value.map((e) => buildForm(e)).toList();
//     controls[element.name] = FormArray(
//       element.value.map((e) => buildForm(e).controls).toList(),
//     );
//   } else if (element is FieldInstance) {
//     controls[element.name] = FormControl<T>(
//       value: element.value,
//       disabled: element.disabled,
//       validators: _buildValidators(element),
//     );
//   }
//
//   return FormGroup(controls);
// }
//
// AbstractControl _createControlForElement(FormElementInstance element) {
//   if (element is FieldInstance) {
//     return FormControl(
//       value: element.value,
//       validators: _buildValidators(element),
//     );
//   } else if (element is SectionInstance) {
//     return buildForm(element);
//   } else if (element is RepeatSectionInstance) {
//     return FormArray(
//       element.value.map((e) => buildForm(e).control).toList(),
//     );
//   }
//   throw Exception("Unsupported element type");
// }
//
// Widget buildFormWidget(FormElementInstance element, FormGroup form) {
//   if (element is FieldInstance<String>) {
//     return ReactiveTextField<String>(
//       formControlName: element.name,
//       decoration: InputDecoration(
//         labelText: element.properties.label,
//         hintText: element.properties.placeholder,
//       ),
//     );
//   } else if (element is SectionInstance) {
//     return Column(
//       children: element.value.map((e) => buildFormWidget(e, form)).toList(),
//     );
//   } else if (element is RepeatSectionInstance) {
//     return Column(
//       children: [
//         ...form.control(element.name).controls.map((control) {
//           return buildFormWidget(element, control as FormGroup);
//         }),
//         ElevatedButton(
//           onPressed: () {
//             // Logic to add a new repeat section
//             (form.control(element.name) as FormArray).add(buildForm(element).control);
//           },
//           child: Text("Add ${element.name}"),
//         ),
//       ],
//     );
//   }
//   return Container();
// }
//
// void addRepeatSectionItem(RepeatSectionInstance section, FormArray formArray) {
//   final newSection = SectionInstance(
//     name: section.name,
//     type: section.type,
//     properties: section.properties,
//   );
//   section.add(newSection);
//   formArray.add(buildForm(newSection).controls);
// }
