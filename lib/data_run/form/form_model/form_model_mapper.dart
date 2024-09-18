import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/form/model/option_configuration.dart';

// // class FormMapper {
// //   // Maintain the tree structure
// //   QSectionFieldModel formRootSection = ...;
// //
// //   // Flattened map for quick access
// //   Map<String, QFieldModel> allFieldsMap = {};
// //
// //   void flattenFields(QSectionFieldModel section, String parentPath) {
// //     for (var field in section.fields) {
// //       String currentPath = parentPath.isEmpty ? field.name : '$parentPath.${field.name}';
// //       field.path = currentPath;
// //       allFieldsMap[currentPath] = field;
// //
// //       if (field is QSectionFieldModel) {
// //         flattenFields(field, currentPath);
// //       }
// //     }
// //   }
// //
// //   flattenFields(formRootSection, '');
//
//   Map<String, dynamic> mapFromSubmissionData(Map<String, dynamic> formData) {
//     Map<String, dynamic> mappedFields = {};
//
//     for (var fieldConfig in formData['fields']) {
//       String fieldName = fieldConfig['name'];
//       String fieldType = fieldConfig['type'];
//
//       // Check field visibility
//       if (!isVisible(fieldConfig)) {
//         continue;
//       }
//
//       // Map field based on type
//       if (fieldType == 'section') {
//         mappedFields[fieldName] = mapFromSubmissionData(fieldConfig);
//       } else if (fieldType == 'text') {
//         mappedFields[fieldName] = fieldConfig['value'] ?? '';
//       } else if (fieldType == 'checkbox') {
//         mappedFields[fieldName] = fieldConfig['value'] ?? false;
//       }
//       // ... other field types
//
//       // Apply field properties (e.g., validation, default values)
//       // ...
//     }
//
//     return mappedFields;
//   }
//
// // Function to check field visibility
//   bool isVisible(Map<String, dynamic> fieldConfig) {
//     // Implement your visibility logic here based on the configuration
//     // ...
//     return true;
//   }
// }

// QFieldModel mapToQFieldModel(
//     {required FieldTemplate field,
//     dynamic value,
//     IList<FormOption>? options}) {
//   final ValueType valueType = field.type;
//   final FieldValueRenderingType renderingType =
//       FieldValueRenderingUtil.getFieldValueRendering(
//           field.fieldValueRenderingType);
//
//   return QFieldModel(
//       name: field.name,
//       isEditable: true,
//       isMandatory: field.mandatory,
//       label: field.label,
//       value: value is String ? value : value?.toString(),
//       valueType: valueType,
//       optionConfiguration: field.type.isWithOptions
//           ? _getOptionConfiguration(field, options)
//           : null,
//       rules: field.rules,
//       keyboardActionType: switch (valueType) {
//         ValueType.LongText => KeyboardActionType.ENTER,
//         _ => KeyboardActionType.NEXT
//       },
//       section: field.section,
//       path: field.path,
//       defaultValue: field.defaultValue);
// }

OptionConfiguration? _getOptionConfiguration(
    FieldTemplate field, IList<FormOption>? options) {
  return OptionConfiguration(
      options: options?.toList(), optionsToShow: [], optionsToHide: []);
}
