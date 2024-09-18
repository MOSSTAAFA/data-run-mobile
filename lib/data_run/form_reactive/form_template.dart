// import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
// import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
// import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
//
// class FormField {
//   String name;
//   String type;
//   bool mandatory;
//   String listName;
//   String choiceFilter;
//   dynamic value;
//
//   FormField({required this.name, required this.type, this.mandatory = false, this.listName = '', this.choiceFilter = '', this.value});
// }
//
// // Apply the choice filter logic to dynamically filter options
// void applyChoiceFilter(FormField field, Map<String, dynamic> savedData, FormTemplate template) {
//   // Example logic for applying a choice filter
//   // e.g., if "countryFilter == #{region}" -> filter options by the saved region value
//   String filterCondition = field.choiceFilter.replaceAll("#{region}", savedData['region']);
//
//   // Fetch the list of countries and filter it
//   List<String> availableOptions = fetchOptionsForListName(field.listName);
//   List<String> filteredOptions = availableOptions.where((option) {
//     // Apply the filter condition to the options (e.g., match region)
//     return optionMatchesFilter(option, filterCondition);
//   }).toList();
//
//   field.setOptions(filteredOptions);
// }
//
// // Example function to simulate fetching options (could be from API or locally cached)
// List<String> fetchOptionsForListName(String listName) {
//   // Fetch the list of options for the given list name
//   return ['option1', 'option2', 'option3'];  // Example
// }
//
// // Simulate the FormInstance which will hold form fields and values
// // class FormInstance {
// //   List<FormField> fields = [];
// //
// //   void addField(FormField field) {
// //     fields.add(field);
// //   }
// //
// //   Map<String, dynamic> getFormData() {
// //
// //   }
// // }
//
// // Rehydrate function using the saved data and the form template
// FormInstance rehydrateForm(Map<String, dynamic> savedData, FormTemplate template) {
//   FormInstance formInstance = FormInstance();
//
//   // Loop through the template fields and recreate the form controls
//   for (FormField field in template.fields) {
//     if (savedData.containsKey(field.name)) {
//       // Set the field's value from the saved data
//       field.value = savedData[field.name];
//
//       // If the field has a choice filter, resolve dependencies
//       if (field.choiceFilter.isNotEmpty) {
//         applyChoiceFilter(field, savedData, template);
//       }
//     }
//
//     formInstance.addField(field);
//   }
//
//   return formInstance;
// }
//
//
// Map<String, dynamic> extractFlatValues(Map<String, dynamic> savedData, FormDefinition formTemplate) {
//   Map<String, dynamic> flatValues = {};
//
//   for (var field in formTemplate.fields) {
//     flatValues.addAll(flattenElement(field));
//   }
//
//   return flatValues;
// }
//
// Map<String, dynamic> flattenElement(FormElementInstance element) {
//   Map<String, dynamic> result = {};
//
//   if (element is FieldInstance) {
//     // Simple field extraction
//     result[element.name!] = element.value;
//   } else if (element is SectionInstance) {
//     // Recursively flatten section fields
//     for (var field in element.value?.values ?? []) {
//       result.addAll(flattenElement(field));
//     }
//   } else if (element is RepeatableSectionInstance) {
//     // Handle repeatable sections as lists of flattened sections
//     List<Map<String, dynamic>> repeatedValues = [];
//     for (var section in element.value ?? []) {
//       repeatedValues.add(flattenElement(section));
//     }
//     result[element.name!] = repeatedValues;
//   }
//
//   return result;
// }
//
// Map<String, dynamic> flattenElementWithPrefix(Map<String, dynamic> savedData, FieldTemplate element, {String? prefix}) {
//   Map<String, dynamic> result = {};
//   String fullPrefix = prefix != null ? '$prefix.' : '';
//
//   if (!element.type.isSectionType) {
//     // Add the field to the result with a prefixed key
//     result['$fullPrefix${element.name!}'] = element.value;
//   } else if (element is SectionInstance) {
//     // Flatten section fields, applying the current section name as prefix
//     for (var field in element.value?.values ?? []) {
//       result.addAll(flattenElementWithPrefix(field, prefix: fullPrefix));
//     }
//   } else if (element is RepeatableSectionInstance) {
//     // For repeatable sections, apply the same prefixing logic
//     List<Map<String, dynamic>> repeatedValues = [];
//     for (var section in element.value ?? []) {
//       repeatedValues.add(flattenElementWithPrefix(section, prefix: fullPrefix));
//     }
//     result['$fullPrefix${element.name!}'] = repeatedValues;
//   }
//
//   return result;
// }
//
// FormInstance deserializeFlattenedData(Map<String, dynamic> flattenedData, FormDefinition formTemplate) {
//   List<FieldTemplate> formElements = [];
//
//   formTemplate.fields.forEach((field) {
//     // Handle non-repeatable sections
//     // if (!field.containsKey('repeatable')) {
//       if (!field.type.isRepeatSection) {
//       Map<String, FieldInstance> sectionFields = {};
//       for (var fieldTemplate in field['fields']) {
//         String flattenedKey = '${field['name']}.${fieldTemplate['name']}';
//         if (flattenedData.containsKey(flattenedKey)) {
//           sectionFields[fieldTemplate['name']] = FieldInstance(
//             name: fieldTemplate['name'],
//             type: ValueType.getValueType(fieldTemplate['type']),
//             value: flattenedData[flattenedKey],
//           );
//         }
//       }
//       formElements.add(SectionInstance(
//         name: field['name'],
//         type: ValueType.Section,
//         value: sectionFields,
//       ));
//     }
//
//     // Handle repeatable sections
//     else {
//       List<SectionInstance> repeatedSections = [];
//       int i = 0;
//       while (true) {
//         Map<String, FieldInstance> sectionFields = {};
//         for (var fieldTemplate in field['sections'][0]['fields']) {
//           String flattenedKey = '${field['name']}.$i.${fieldTemplate['name']}';
//           if (flattenedData.containsKey(flattenedKey)) {
//             sectionFields[fieldTemplate['name']] = FieldInstance(
//               name: fieldTemplate['name'],
//               type: ValueType.getValueType(fieldTemplate['type']),
//               value: flattenedData[flattenedKey],
//             );
//           }
//         }
//         if (sectionFields.isEmpty) break;  // No more sections, exit loop
//         repeatedSections.add(SectionInstance(
//           name: field['sections'][0]['name'],
//           type: ValueType.Section,
//           value: sectionFields,
//         ));
//         i++;
//       }
//
//       formElements.add(RepeatableSectionInstance(
//         name: field['name'],
//         type: ValueType.RepeatableSection,
//         value: repeatedSections,
//       ));
//     }
//   });
//
//   return DataFormSubmission(
//     name: formTemplate['name'],
//     uid: 'generated-uid', // Assign UID as needed
//     fields: formElements,
//     version: 1, // Version info
//     form: formTemplate, // Reference to form template
//     orgUnit: 'orgUnit1',
//     status: 'COMPLETED',
//     dirty: false,
//   );
// }
