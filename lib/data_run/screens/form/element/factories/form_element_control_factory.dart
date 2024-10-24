// import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// /// from template without values, use [FromElementControlFactory]
// /// for adding new control with no value but the defaultValue
// extension FromElementControlFactory<T> on FormElementInstance<T?> {
//   static AbstractControl<dynamic> createTemplateControl(
//       FieldTemplate fieldTemplate,
//       {savedValue}) {
//     if (fieldTemplate.type.isSection) {
//       return createSectionFormGroup(fieldTemplate, savedValue: savedValue);
//     } else if (fieldTemplate.type.isRepeatSection) {
//       return createRepeatFormArray(fieldTemplate, savedValue: savedValue);
//     } else {
//       return createFieldFormControl(fieldTemplate, savedValue: savedValue);
//     }
//   }
//
//   static FormGroup createSectionFormGroup<T>(FieldTemplate fieldTemplate,
//       {dynamic savedValue}) {
//     final Map<String, AbstractControl<dynamic>> controls = {};
//     fieldTemplate.fields.sort((a, b) => (a.order).compareTo(b.order));
//
//     for (var childTemplate in fieldTemplate.fields) {
//       controls[childTemplate.name] = createTemplateControl(childTemplate,
//           savedValue: savedValue?[childTemplate.name]);
//     }
//     return FormGroup(controls);
//   }
//
//   static FormArray<Map<String, Object?>> createRepeatFormArray(
//       FieldTemplate fieldTemplate,
//       {dynamic savedValue}) {
//     final formArray = FormArray<Map<String, Object?>>((savedValue ?? [])
//         .map<FormGroup>(
//             (e) => createSectionFormGroup(fieldTemplate, savedValue: e))
//         .toList());
//
//     return formArray;
//   }
//
//   static AbstractControl<dynamic> createFieldFormControl(
//       FieldTemplate fieldTemplate,
//       {savedValue}) {
//     switch (fieldTemplate.type) {
//       case ValueType.Text:
//       case ValueType.OrganisationUnit:
//         return FormControl<String>(
//           value: savedValue ?? fieldTemplate.defaultValue,
//           validators: FieldValidators.getValidators(fieldTemplate),
//         );
//       case ValueType.LongText:
//       case ValueType.Letter:
//         return FormControl<String>(
//           value: savedValue ?? fieldTemplate.defaultValue,
//           validators: FieldValidators.getValidators(fieldTemplate),
//         );
//       case ValueType.FullName:
//         return FormControl<String>(
//           value: savedValue ?? fieldTemplate.defaultValue,
//           validators: FieldValidators.getValidators(fieldTemplate),
//         );
//       case ValueType.Email:
//         return FormControl<String>(
//           value: savedValue ?? fieldTemplate.defaultValue,
//           validators: FieldValidators.getValidators(fieldTemplate),
//         );
//       case ValueType.Boolean:
//       case ValueType.TrueOnly:
//       case ValueType.YesNo:
//         return FormControl<bool>(
//           value: savedValue ?? fieldTemplate.defaultValue,
//           validators: FieldValidators.getValidators(fieldTemplate),
//         );
//       case ValueType.Date:
//       case ValueType.DateTime:
//         return FormControl<String>(
//           value: savedValue ?? fieldTemplate.defaultValue,
//           validators: FieldValidators.getValidators(fieldTemplate),
//         );
//       case ValueType.Integer:
//       case ValueType.IntegerPositive:
//       case ValueType.IntegerNegative:
//       case ValueType.IntegerZeroOrPositive:
//         return FormControl<int>(
//           value: savedValue ?? fieldTemplate.defaultValue,
//           validators: FieldValidators.getValidators(fieldTemplate),
//         );
//       case ValueType.Number:
//       case ValueType.Age:
//       case ValueType.Percentage:
//         return FormControl<double>(
//           value: savedValue ?? fieldTemplate.defaultValue,
//           validators: FieldValidators.getValidators(fieldTemplate),
//         );
//       case ValueType.SelectOne:
//         return FormControl<String>(
//           value: savedValue ?? fieldTemplate.defaultValue,
//           validators: FieldValidators.getValidators(fieldTemplate),
//         );
//       case ValueType.SelectMulti:
//         return FormControl<List<String>>(value: savedValue ?? []);
//       default:
//         throw UnsupportedError(
//             'Template: ${fieldTemplate.name}, unsupported element type: ${fieldTemplate.type}');
//     }
//   }
// }
//
// //
// // /// from template wit value, use [FromTemplateControlFactory]
// // /// for adding new control with saved value
// // extension FromElementControlFactory<T> on FormElementInstance<T?> {
// //   static AbstractControl<dynamic> createElementControl(
// //       FormElementInstance<dynamic> element) {
// //     return switch (element) {
// //       FieldInstance() => createFieldControl(element),
// //       SectionInstance() => createSectionControl(element),
// //       RepeatInstance() => createRepeatSectionControl(element),
// //     };
// //   }
// //
// //   static FormGroup createSectionControl<T>(SectionInstance section) {
// //     final Map<String, AbstractControl<dynamic>> controls = {};
// //     for (var element in section.elements.values) {
// //       controls[element.name] = createElementControl(element);
// //     }
// //     return FormGroup(controls);
// //   }
// //
// //   static FormArray<Map<String, Object?>> createRepeatSectionControl(
// //       RepeatInstance section) {
// //     final Map<String, AbstractControl<dynamic>> initialGroups = {};
// //
// //     for (var element in section.elements) {
// //       initialGroups[element.name] = createElementControl(element);
// //     }
// //     final FormGroup formGroup = FormGroup(initialGroups);
// //     return FormArray<Map<String, Object?>>([formGroup]);
// //   }
// //
// //   static AbstractControl<dynamic> createFieldControl(
// //       FieldInstance<dynamic> element) {
// //     switch (element.type) {
// //       case ValueType.Text:
// //       case ValueType.LongText:
// //       case ValueType.Letter:
// //       case ValueType.FullName:
// //       case ValueType.Email:
// //       case ValueType.OrganisationUnit:
// //         return FormControl<String>(
// //           value: element.value ?? element.defaultValue,
// //           validators: FieldValidators.getValidators(element),
// //         );
// //       case ValueType.Boolean:
// //       case ValueType.TrueOnly:
// //       case ValueType.YesNo:
// //         return FormControl<bool>(
// //           value: element.value ?? element.defaultValue,
// //           validators: FieldValidators.getValidators(element),
// //         );
// //       case ValueType.Date:
// //       case ValueType.Time:
// //       case ValueType.DateTime:
// //         return FormControl<String?>(
// //           value: element.value ?? element.defaultValue,
// //           validators: FieldValidators.getValidators(element),
// //         );
// //       case ValueType.Integer:
// //       case ValueType.IntegerPositive:
// //       case ValueType.IntegerNegative:
// //       case ValueType.IntegerZeroOrPositive:
// //         return FormControl<int?>(
// //           value: element.value ?? element.defaultValue,
// //           validators: FieldValidators.getValidators(element),
// //         );
// //       case ValueType.Number:
// //       case ValueType.Age:
// //       case ValueType.Percentage:
// //         return FormControl<double?>(
// //           value: element.value ?? element.defaultValue,
// //           validators: FieldValidators.getValidators(element),
// //         );
// //       case ValueType.SelectOne:
// //         return FormControl<String>(
// //           value: element.value ?? element.defaultValue,
// //           validators: FieldValidators.getValidators(element),
// //         );
// //       case ValueType.SelectMulti:
// //         // return FormArray<String>(
// //         //   fieldTemplate.options.map((option) => FormControl<String>()).toList(),
// //         // );
// //         return FormControl<List<String>>(
// //           value:
// //               element.value is String ? [element.value] : element.value ?? [],
// //         );
// //       default:
// //         throw UnsupportedError('Unsupported element type: ${element}');
// //     }
// //   }
// // }
