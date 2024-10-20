// part of 'form_element_model.dart';
//
// mixin ElementControl<T> on FormElementInstance<T> {
//   // AbstractControl<dynamic> updateElement(T? value);
//
//   AbstractControl<dynamic> createElement(T? savedValue);
// }
//
// mixin SectionControl on SectionInstance {
//   // AbstractControl<dynamic> updateElement(Map<String, Object?>? value);
//
//   FormElementInstance<dynamic> createControl(Map<String, Object?>? value);
// }
//
// mixin RepeatedSectionControl on RepeatSectionInstance {
//   AbstractControl<dynamic> updateElement(List<Map<String, Object?>?>? value);
//   FormElementInstance<dynamic> addElement(List<Map<String, Object?>?>? value);
//
//   AbstractControl<dynamic> createControl(
//       List<Map<String, Object?>?>? value) {
//     final Map<String, AbstractControl<dynamic>> initialGroups = {};
//
//     for (var element in elements) {
//       initialGroups[element.name] = element.createControl(element);
//     }
//     final FormGroup formGroup = FormGroup(initialGroups);
//     return FormArray<Map<String, Object?>>([formGroup]);
//   }
//
// }
//
// mixin FieldControl<T> on FieldInstance<T> {
//   // AbstractControl<dynamic> updateElement(Map<String, Object?>? value);
//
//   AbstractControl<dynamic> createControl(T? value) {
//     final element = ElementFactory.createFieldElement(form, template,
//         savedValue: value, fieldOptions: template.options.toList());
//     // final control = ;
//   }
// }
//
//
