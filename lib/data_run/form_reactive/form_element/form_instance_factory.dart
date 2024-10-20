// import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_element_members.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_element_model.dart';
// import 'package:mass_pro/data_run/form_reactive/form_element/form_instance.dart';
// import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
// import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
//
// class FormInstanceFactory {
//   FormInstanceFactory(
//       {required this.template})
//       : formOptionsMap = Map.fromIterable(template.options,
//             key: (option) => option.listName,
//             value: (option) => template.options
//                 .where((o) => o.listName == option.listName)
//                 .toList());
//
//   final FormVersion template;
//   final Map<String, List<FormOption>> formOptionsMap;
//
//   /// Initialize the form elements based on the template or previously saved data
//   FormInstance initializeForm(FormGroup form,
//       [Map<String, dynamic> savedData = const {}]) {
//     form = FormGroup({});
//     return FormInstance(
//         form: form,
//         elements: template.fields.asMap().map((k, templateElement) {
//           return MapEntry(
//               templateElement.name,
//               _createFormElementModel(
//                   form, templateElement, savedData[templateElement.name]));
//         }));
//   }
//
//   SectionInstance createSectionInstance(
//       FormGroup form, FieldTemplate templateElement,
//       [dynamic savedValue]) {
//     final Map<String, FormElementInstance<dynamic>> elements = {};
//
//     for (var element in templateElement.fields) {
//       elements[element.name] =
//           _createFormElement(form, templateElement, savedValue?[element.name]);
//     }
//
//     return SectionInstance(
//         form: form,
//         template: templateElement,
//         name: templateElement.name,
//         type: templateElement.type,
//         properties: elementProperties(templateElement),
//         elements: elements);
//   }
//
//   RepeatSectionInstance createRepeatSectionInstance(
//       FormGroup form, FieldTemplate fieldTemplates,
//       [Map<String, Object?>? savedValue]) {
//     final List<SectionInstance> items = [];
//     final Map<String, FormElementInstance<dynamic>> initialGroups = {};
//
//     if (savedValue != null) {
//       final items = savedValue
//               .map((value) => initSection(form, templateElement, value)) ??
//           <SectionInstance>[];
//     }
//
//     if (savedValue != null) {
//       for (var element in fieldTemplates.fields) {
//         initialGroups[element.name] =
//             _createFormElement(form, element, savedValue);
//       }
//     }
//
//     // for (var element in fieldTemplates.fields) {
//     //   initialGroups[element.name] =
//     //       _createFormElement(form, element, savedValue);
//     // }
//     SectionInstance(
//       form: form,
//       name: '',
//       type: templateElement.type,
//       properties: elementProperties(templateElement),
//       elements: templateElement.fields.asMap().map((_, childTemplate) =>
//           MapEntry(
//               childTemplate.name,
//               _createFormElementModel(
//                   form, childTemplate, value?[childTemplate.name]))),
//     );
//
//     if (savedValue != null) {
//       final items = savedValue
//               .map((value) => initSection(form, templateElement, value)) ??
//           <SectionInstance>[];
//     }
//
//     final SectionInstance sectionInstance = SectionInstance(
//         elements: initialGroups,
//         template: fieldTemplates,
//         form: form,
//         name: '',
//         type: fieldTemplates.type,
//         properties: elementProperties(fieldTemplates));
//
//     return RepeatSectionInstance(
//         form: form,
//         name: fieldTemplates.name,
//         type: fieldTemplates.type,
//         template: fieldTemplates,
//         sectionTemplate: initSection(form, fieldTemplates),
//         properties: elementProperties(fieldTemplates),
//         elements: [sectionInstance]);
//   }
//
//   SectionInstance initSection(FormGroup form, FieldTemplate templateElement,
//       [value]) {
//     return SectionInstance(
//       form: form,
//       name: '',
//       template: templateElement,
//       type: templateElement.type,
//       properties: elementProperties(templateElement),
//       elements: templateElement.fields.asMap().map((_, childTemplate) =>
//           MapEntry(
//               childTemplate.name,
//               _createFormElementModel(
//                   form, childTemplate, value?[childTemplate.name]))),
//     );
//   }
//
//   FormElementInstance<dynamic> _createFormElement(
//       FormGroup form, FieldTemplate templateElement,
//       [dynamic savedValue]) {
//     if (templateElement.type.isSection) {
//       return createSectionInstance(form, templateElement, savedValue);
//     } else if (templateElement.type.isRepeatSection) {
//       return createRepeatSectionInstance(form, templateElement, savedValue);
//     } else {
//       final fieldOptions = templateElement.type.isSelectType
//           ? formOptionsMap[templateElement.listName] ?? []
//           : <FormOption>[];
//       return createFormField(form, templateElement, savedValue);
//     }
//   }
//
//   FormElementInstance<dynamic> createFormField(
//       FormGroup form, FieldTemplate templateElement,
//       [dynamic savedValue]) {
//     switch (templateElement.type) {
//       case ValueType.Text:
//       case ValueType.LongText:
//       case ValueType.Letter:
//         return FieldInstance<String?>(
//             form: form,
//             name: templateElement.name,
//             type: templateElement.type,
//             template: templateElement,
//             properties: ElementProperties(),
//             defaultValue: templateElement.defaultValue,
//             value: savedValue ?? templateElement.defaultValue,
//             listName: templateElement.listName);
//
//       case ValueType.Integer:
//       case ValueType.IntegerPositive:
//       case ValueType.IntegerNegative:
//       case ValueType.IntegerZeroOrPositive:
//         return FieldInstance<int>(
//             form: form,
//             name: templateElement.name,
//             type: templateElement.type,
//             template: templateElement,
//             properties: elementProperties(templateElement),
//             defaultValue: templateElement.defaultValue,
//             value: savedValue ?? templateElement.defaultValue,
//             listName: templateElement.listName);
//
//       case ValueType.Number:
//       case ValueType.UnitInterval:
//       case ValueType.Percentage:
//         return FieldInstance<double?>(
//             form: form,
//             name: templateElement.name,
//             type: templateElement.type,
//             properties: elementProperties(templateElement),
//             defaultValue: templateElement.defaultValue,
//             template: templateElement,
//             listName: templateElement.listName,
//             value: savedValue ?? templateElement.defaultValue);
//
//       case ValueType.SelectOne:
//         return FieldInstance<String?>(
//           form: form,
//           name: templateElement.name,
//           type: templateElement.type,
//           properties: elementProperties(templateElement),
//           template: templateElement,
//           defaultValue: templateElement.defaultValue,
//           listName: templateElement.listName,
//           choiceFilter: templateElement.choiceFilter,
//           value: savedValue ?? templateElement.defaultValue,
//           options: options(templateElement),
//         );
//       case ValueType.SelectMulti:
//         return FieldInstance(
//           form: form,
//           name: templateElement.name,
//           type: templateElement.type,
//           properties: elementProperties(templateElement),
//           defaultValue: templateElement.defaultValue,
//           choiceFilter: templateElement.choiceFilter,
//           listName: templateElement.listName,
//           template: templateElement,
//           value: savedValue ?? templateElement.defaultValue,
//           options: options(templateElement),
//         );
//
//       case ValueType.Section:
//         return SectionInstance(
//           form: form,
//           name: templateElement.name,
//           type: templateElement.type,
//           properties: elementProperties(templateElement),
//           template: templateElement,
//           elements: templateElement.fields.asMap().map((_, childTemplate) =>
//               MapEntry(
//                   childTemplate.name,
//                   _createFormElementModel(
//                       form, childTemplate, savedValue?[childTemplate.name]))),
//         );
//       case ValueType.RepeatableSection:
//         final elements = savedValue
//                 ?.map((value) => initSection(form, templateElement, value)) ??
//             <SectionInstance>[];
//
//         return RepeatSectionInstance(
//             form: form,
//             name: templateElement.name,
//             type: templateElement.type,
//             template: templateElement,
//             // sectionTemplate: initSection(form, templateElement),
//             properties: elementProperties(templateElement),
//             elements: elements);
//       default:
//         throw Exception('Unsupported element type');
//     }
//   }
//
//   /// Helper method to create form elements (FieldInstance, SectionInstance, RepeatSectionInstance)
//   FormElementInstance<dynamic> _createFormElementModel(
//       FormGroup form, FieldTemplate templateElement,
//       [dynamic savedValue]) {
//     switch (templateElement.type) {
//       case ValueType.Text:
//       case ValueType.LongText:
//       case ValueType.Letter:
//         return FieldInstance<String?>(
//             form: form,
//             name: templateElement.name,
//             type: templateElement.type,
//             properties: ElementProperties(),
//             defaultValue: templateElement.defaultValue,
//             listName: templateElement.listName,
//             template: templateElement,
//             value: savedValue ?? templateElement.defaultValue);
//
//       case ValueType.Integer:
//       case ValueType.IntegerPositive:
//       case ValueType.IntegerNegative:
//       case ValueType.IntegerZeroOrPositive:
//         return FieldInstance<int>(
//             form: form,
//             name: templateElement.name,
//             type: templateElement.type,
//             properties: elementProperties(templateElement),
//             defaultValue: templateElement.defaultValue,
//             listName: templateElement.listName,
//             template: templateElement,
//             value: savedValue ?? templateElement.defaultValue);
//
//       case ValueType.Number:
//       case ValueType.UnitInterval:
//       case ValueType.Percentage:
//         return FieldInstance<double?>(
//           form: form,
//           name: templateElement.name,
//           type: templateElement.type,
//           properties: elementProperties(templateElement),
//           listName: templateElement.listName,
//           defaultValue: templateElement.defaultValue,
//           template: templateElement,
//           value: savedValue ?? templateElement.defaultValue,
//         );
//
//       case ValueType.SelectOne:
//         return FieldInstance<String?>(
//           form: form,
//           name: templateElement.name,
//           type: templateElement.type,
//           properties: elementProperties(templateElement),
//           defaultValue: templateElement.defaultValue,
//           listName: templateElement.listName,
//           choiceFilter: templateElement.choiceFilter,
//           template: templateElement,
//           value: savedValue ?? templateElement.defaultValue,
//           options: options(templateElement),
//         );
//       case ValueType.SelectMulti:
//         return FieldInstance(
//           form: form,
//           name: templateElement.name,
//           type: templateElement.type,
//           properties: elementProperties(templateElement),
//           defaultValue: templateElement.defaultValue,
//           listName: templateElement.listName,
//           choiceFilter: templateElement.choiceFilter,
//           template: templateElement,
//           value: savedValue ?? templateElement.defaultValue,
//           options: options(templateElement),
//         );
//
//       case ValueType.Section:
//         return SectionInstance(
//           form: form,
//           name: templateElement.name,
//           type: templateElement.type,
//           properties: elementProperties(templateElement),
//           template: templateElement,
//           elements: templateElement.fields.asMap().map((_, childTemplate) =>
//               MapEntry(
//                   childTemplate.name,
//                   _createFormElementModel(
//                       form, childTemplate, savedValue?[childTemplate.name]))),
//         );
//       case ValueType.RepeatableSection:
//         final elements = savedValue
//                 ?.map((value) => initSection(form, templateElement, value)) ??
//             <SectionInstance>[];
//
//         return RepeatSectionInstance(
//             form: form,
//             name: templateElement.name,
//             type: templateElement.type,
//             template: templateElement,
//             // sectionTemplate: initSection(form, templateElement),
//             properties: elementProperties(templateElement),
//             elements: elements);
//       default:
//         throw Exception('Unsupported element type');
//     }
//   }
//
//
//   List<FormOption> options(FieldTemplate templateElement) {
//     return formOptionsMap[templateElement.listName] ?? [];
//   }
//
//   ElementProperties elementProperties(FieldTemplate templateElement) {
//     return ElementProperties(
//         mandatory: templateElement.mandatory,
//         label: getItemLocalString(templateElement.label,
//             defaultString: templateElement.name));
//   }
// // static AbstractControl<dynamic> buildFormControl(
// //     FormElementInstance<dynamic> element) {
// //   return switch (element) {
// //     FieldInstance() => buildFieldControl(element),
// //     SectionInstance() => buildSectionControl(element),
// //     RepeatSectionInstance() => buildRepeatSectionControl(element),
// //   };
// // }
// //
// // static AbstractControl<dynamic> buildFieldControl(FieldInstance<dynamic> element) {
// //   switch (element.type) {
// //     case ValueType.Text:
// //       return FormControl<String>(
// //         value: element.value ?? element.defaultValue,
// //         disabled: element.properties.disabled,
// //         validators: FieldValidators.getValidators(element),
// //       );
// //     case ValueType.LongText:
// //     case ValueType.Letter:
// //       return FormControl<String>(
// //         value: element.value ?? element.defaultValue,
// //         disabled: element.properties.disabled,
// //         validators: FieldValidators.getValidators(element),
// //       );
// //     case ValueType.FullName:
// //       return FormControl<String>(
// //         value: element.value ?? element.defaultValue,
// //         disabled: element.properties.disabled,
// //         validators: FieldValidators.getValidators(element),
// //       );
// //     case ValueType.Email:
// //       return FormControl<String>(
// //         value: element.value ?? element.defaultValue,
// //         disabled: element.properties.disabled,
// //         validators: FieldValidators.getValidators(element),
// //       );
// //     case ValueType.Boolean:
// //     case ValueType.TrueOnly:
// //     case ValueType.YesNo:
// //       return FormControl<bool>(
// //         value: element.value ?? element.defaultValue,
// //         disabled: element.properties.disabled,
// //         validators: FieldValidators.getValidators(element),
// //       );
// //     case ValueType.Date:
// //     case ValueType.DateTime:
// //       return FormControl<DateTime>(
// //         value: element.value ?? element.defaultValue,
// //         disabled: element.properties.disabled,
// //         validators: FieldValidators.getValidators(element),
// //       );
// //     case ValueType.Integer:
// //     case ValueType.IntegerPositive:
// //     case ValueType.IntegerNegative:
// //     case ValueType.IntegerZeroOrPositive:
// //       return FormControl<int>(
// //         value: element.value ?? element.defaultValue,
// //         disabled: element.properties.disabled,
// //         validators: FieldValidators.getValidators(element),
// //       );
// //     case ValueType.Number:
// //     case ValueType.Age:
// //     case ValueType.Percentage:
// //       return FormControl<double>(
// //         value: element.value ?? element.defaultValue,
// //         disabled: element.properties.disabled,
// //         validators: FieldValidators.getValidators(element),
// //       );
// //     case ValueType.SelectOne:
// //       return FormControl<String>(
// //         value: element.value ?? element.defaultValue,
// //         disabled: element.properties.disabled,
// //         validators: FieldValidators.getValidators(element),
// //       );
// //     case ValueType.SelectMulti:
// //       return FormArray<String>(
// //         disabled: element.properties.disabled,
// //         element.options.map((option) => FormControl<String>()).toList(),
// //       );
// //     default:
// //       throw UnsupportedError('Unsupported element type: ${element}');
// //   }
// // }
// //
// // static FormGroup buildSectionControl(SectionInstance section) {
// //   final Map<String, AbstractControl<dynamic>> controls = {};
// //
// //   for (var element in section.elements.values) {
// //     controls[element.name] = buildFormControl(element);
// //   }
// //   return FormGroup(controls);
// // }
// //
// // static FormArray<Map<String, Object?>> buildRepeatSectionControl(RepeatSectionInstance repeatableSection) {
// //   final Map<String, AbstractControl<dynamic>> initialGroups = {};
// //
// //   for (var element in repeatableSection.elements) {
// //     initialGroups[element.name] = buildFormControl(element);
// //   }
// //   final FormGroup formGroup = FormGroup(initialGroups);
// //   return FormArray<Map<String, Object?>>([formGroup]);
// // }
// }
