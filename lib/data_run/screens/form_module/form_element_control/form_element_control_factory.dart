// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element_model.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_template/form_element_template.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// /// from template wit value, use [FromTemplateControlFactory]
// /// for adding new control with saved value
// extension FormElementControlFactory<T> on FormElementModel<T> {
//   static AbstractControl<dynamic> createElementControl(
//       FormElementModel<dynamic> element, FormElementTemplate template) {
//     return switch (element) {
//       FieldElementModel() => createFieldElementControl(element, template),
//       SectionElementModel() => createSectionElementControl(element),
//       RepeatElementModel() => createRepeatElementControl(element),
//     };
//   }
//
//   static FormGroup createSectionElementControl<T>(
//       SectionElementModel? section, FormElementTemplate template) {
//     template as SectionElementTemplate;
//     final Map<String, AbstractControl<dynamic>> controls = {};
//     for (var element in section?.elements.values.toList() ?? []) {
//       controls[element.name] = createElementControl(element);
//     }
//     return FormGroup(controls);
//   }
//
//   static FormArray<Map<String, Object?>> createRepeatElementControl(
//       RepeatElementModel section, FormElementTemplate template) {
//     final Map<String, AbstractControl<dynamic>> initialGroups = {};
//
//     for (var element in section.elements) {
//       initialGroups[element.name] = createElementControl(element, template);
//     }
//     final FormGroup formGroup = FormGroup(initialGroups);
//     return FormArray<Map<String, Object?>>([formGroup]);
//   }
//
//   static AbstractControl<dynamic> createFieldElementControl<T>(
//       FieldElementModel<T>? element, FormElementTemplate template) {
//     template as FieldElementTemplate;
//     switch (template.type) {
//       case ValueType.Text:
//       case ValueType.LongText:
//       case ValueType.Letter:
//       case ValueType.FullName:
//       case ValueType.Email:
//       case ValueType.OrganisationUnit:
//         return FormControl<T>(
//           value: element?.value ?? template.defaultValue,
//           validators: FieldValidators.getValidators(template),
//         );
//       case ValueType.Boolean:
//       case ValueType.TrueOnly:
//       case ValueType.YesNo:
//         return FormControl<T>(
//           value: element?.value ?? template.defaultValue,
//           validators: FieldValidators.getValidators(template),
//         );
//       case ValueType.Date:
//       case ValueType.Time:
//       case ValueType.DateTime:
//         return FormControl<T>(
//           value: element?.value ?? template.defaultValue,
//           validators: FieldValidators.getValidators(template),
//         );
//       case ValueType.Integer:
//       case ValueType.IntegerPositive:
//       case ValueType.IntegerNegative:
//       case ValueType.IntegerZeroOrPositive:
//         return FormControl<T>(
//           value: element?.value ?? template.defaultValue,
//           validators: FieldValidators.getValidators(template),
//         );
//       case ValueType.Number:
//       case ValueType.Age:
//       case ValueType.Percentage:
//         return FormControl<T>(
//           value: element?.value ?? template.defaultValue,
//           validators: FieldValidators.getValidators(template),
//         );
//       case ValueType.SelectOne:
//         return FormControl<T>(
//           value: element?.value ?? template.defaultValue,
//           validators: FieldValidators.getValidators(template),
//         );
//       case ValueType.SelectMulti:
//         // return FormArray<String>(
//         //   fieldTemplate.options.map((option) => FormControl<String>()).toList(),
//         // );
//         return FormControl<List<T>>(
//           value: (element?.value is T)
//               ? <T>[element!.value!]
//               : element?.value as List<T>? ?? [],
//         );
//       default:
//         throw UnsupportedError('Unsupported element type: ${element}');
//     }
//   }
// }
