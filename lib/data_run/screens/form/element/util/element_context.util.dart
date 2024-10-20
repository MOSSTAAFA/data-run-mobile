// import 'package:mass_pro/data_run/screens/form/element/form_element_model.dart';
//
// class FieldValueObject<T> {
//   FieldValueObject({required this.id, required this.path, required this.value});
//
//   String id;
//   String path;
//   T? value;
// }
//
// /// evaluation context from formElements
// class FieldValuesMapUtil {
//   static fromFieldInstances<T>(List<FormElementInstance<T>> formElements) {
//     Map<String, FieldValueObject<T>> entities = {};
//
//     formElements.forEach((fieldInstance) {
//       entities[fieldInstance.name] = FieldValueObject(
//           id: fieldInstance.name,
//           path: fieldInstance.pathRecursive,
//           value: fieldInstance.value);
//     });
//     return entities;
//   }
// }
