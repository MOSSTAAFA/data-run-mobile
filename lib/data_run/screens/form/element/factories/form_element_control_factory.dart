import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

/// from template wit value, use [FromTemplateControlFactory]
/// for adding new control with saved value
extension FormElementControlFactory<T> on FormElementInstance<T?> {
  static AbstractControl<dynamic> createElementControl(
      FormElementInstance<dynamic> element) {
    return switch (element) {
      FormFieldElement() => createFieldElementControl(element),
      FormSectionElement() => createSectionElementControl(element),
      FormRepeatElement() => createRepeatElementControl(element),
    };
  }

  static FormGroup createSectionElementControl<T>(FormSectionElement? section) {
    final Map<String, AbstractControl<dynamic>> controls = {};
    for (var element in section?.elements.values.toList() ?? []) {
      controls[element.name] = createElementControl(element);
    }
    return FormGroup(controls);
  }

  static FormArray<Map<String, Object?>> createRepeatElementControl(
      FormRepeatElement section) {
    final Map<String, AbstractControl<dynamic>> initialGroups = {};

    for (var element in section.elements) {
      initialGroups[element.name] = createElementControl(element);
    }
    final FormGroup formGroup = FormGroup(initialGroups);
    return FormArray<Map<String, Object?>>([formGroup]);
  }

  static AbstractControl<E> createFieldElementControl<T extends FormElementInstance<E>, E>(
      T? element) {
    switch (element.type) {
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.FullName:
      case ValueType.Email:
      case ValueType.OrganisationUnit:
        return FormControl<E>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.Boolean:
      case ValueType.TrueOnly:
      case ValueType.YesNo:
        return FormControl<bool>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return FormControl<String?>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FormControl<int?>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.Number:
      case ValueType.Age:
      case ValueType.Percentage:
        return FormControl<double?>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.SelectOne:
        return FormControl<String>(
          value: element.value ?? element.defaultValue,
          validators: FieldValidators.getValidators(element),
        );
      case ValueType.SelectMulti:
        // return FormArray<String>(
        //   fieldTemplate.options.map((option) => FormControl<String>()).toList(),
        // );
        return FormControl<List<String>>(
          value: element.value?.value is String
              ? [element.value!.value]
              : element.value?.value ?? [],
        );
      default:
        throw UnsupportedError('Unsupported element type: ${element}');
    }
  }
}


// /// from template without values, use [FromElementControlFactory]
// /// for adding new control with no value but the defaultValue
// extension FromElementControlFactory<T> on FormElementInstance<T?> {
//   static AbstractControl<dynamic> createTemplateControl(
//       FormElementTemplate fieldTemplate,
//       {savedValue}) {
//     if (fieldTemplate.type.isSection) {
//       return createSectionFormGroup((fieldTemplate as SectionTemplate),
//           savedValue: savedValue);
//     } else if (fieldTemplate.type.isRepeatSection) {
//       return createRepeatFormArray((fieldTemplate as SectionTemplate),
//           savedValue: savedValue);
//     } else {
//       return createFieldFormControl((fieldTemplate as FieldTemplate),
//           savedValue: savedValue);
//     }
//   }
//
//   static FormGroup createSectionFormGroup<T>(SectionTemplate fieldTemplate,
//       {dynamic savedValue}) {
//     final Map<String, AbstractControl<dynamic>> controls = {};
//     fieldTemplate.fields.sort((a, b) => (a.order).compareTo(b.order));
//     // final s = savedValue?[fieldTemplate.name];
//
//     for (var childTemplate in fieldTemplate.fields) {
//       controls[childTemplate.name] = createTemplateControl(childTemplate,
//           savedValue: savedValue?[childTemplate.name]);
//     }
//     return FormGroup(controls);
//   }
//
//   static FormArray<Map<String, Object?>> createRepeatFormArray(
//       SectionTemplate fieldTemplate,
//       {dynamic savedValue}) {
//     final formArray = FormArray<Map<String, Object?>>((savedValue ?? [])
//         .map<FormGroup>(
//             (e) => createSectionFormGroup(fieldTemplate, savedValue: e))
//         .toList());
//
//     return formArray;
//     // for (var element in fieldTemplate.fields) {
//     //   initialGroups[element.name] =
//     //       createTemplateControl(element, savedValue: savedValue?[element.name]);
//     // }
//     // final FormGroup formGroup = FormGroup(initialGroups);
//     // return FormArray<Map<String, Object?>>([formGroup]);
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
