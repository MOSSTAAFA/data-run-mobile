// import 'package:d2_remote/modules/datarun/form/entities/form_version.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_element_model/element_state_model/form_element_state.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element_model.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element_model_factory.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_template/form_element_template.dart';
//
// class FormStateManager {
//   Map<String, FormElementState> flatMap; // For quick lookups using paths
//   SectionElementModel rootNode; // For scoping and contextual evaluation
//   final FormTemplateRoot formTemplate;
//
//   FormStateManager({Map<String,
//       FormElementState>? flatMap, SectionElementModel? rootNode,
//     required FormTemplateV formTemplate})
//       : this.flatMap = flatMap ?? {},
//         rootNode = SectionElementModel(
//             name: '',
//             elements: FromElementModelFactory.formElementsModels(
//                 formTemplate.fields, flatMap)),
//         formTemplate = FormTemplateRoot.fromEntity(formTemplate);
//
//   // Method to get a field state by path
//   FormElementState? getElementByPath(String path) {
//     return flatMap[path];
//   }
//
//   // Method to get a node by path in the hierarchy
//   FormElementModel<dynamic>? getElementInHierarchy(String path) {
//     return rootNode.element(path);
//   }
//
//   // Add new form element to both flatMap and hierarchy
//   void addElement(String path, FormElementState element,
//       CollectionElementModel<dynamic> parent) {
//     flatMap[path] = element;
//     if (parent is SectionElementModel) {
//       parent.addElement(element)
//     }
//     switch (parent) {
//       case SectionElementModel():
//         parent.addChild(path, element);
//     // TODO: Handle this case.
//       case RepeatElementModel():
//       // TODO: Handle this case.
//     };
//   }
// }
//
//
// // Helper to get default values based on type
// dynamic defaultValue(String type) {
//   switch (type) {
//     case 'Text':
//       return '';
//     case 'Integer':
//       return 0;
//     case 'SelectOne':
//       return null; // or a default option
//     default:
//       return null;
//   }
// }
//
// class FormValueMap {
//   Map<String, dynamic> _values = {};
//
//   // Get the value for a specific path
//   dynamic getValue(String path) {
//     return _values[path];
//   }
//
//   // Set the value for a specific path
//   void setValue(String path, dynamic value) {
//     _values[path] = value;
//   }
//
//   Map<String, dynamic> toHierarchical(Map<String, dynamic> template,
//       FormValueMap valueMap) {
//     Map<String, dynamic> hierarchicalData = {};
//     for (var field in template['fields']) {
//       String path = field['path'];
//       if (field['type'] == 'Section' || field['type'] == 'RepeatSection') {
//         // Recursively call to construct sub-structure
//         hierarchicalData[field['name']] = toHierarchical(field, valueMap);
//       } else {
//         // Direct assignment from flat map
//         hierarchicalData[field['name']] = valueMap.getValue(path);
//       }
//     }
//     return hierarchicalData;
//   }
//
// }
