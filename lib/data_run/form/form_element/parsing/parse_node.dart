// import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element_model.dart';
//
// class ParserNode {
//   final Map<String, dynamic> json;
//
//   ParserNode(this.json);
//
//   String getPlainString(String key) {
//     return json[key] as String;
//   }
//
//   List<FormElementModel<dynamic>> getChildren(String key, FormElementModel<dynamic> parent) {
//     var childrenJson = json[key] as List;
//     return childrenJson.map((childJson) {
//       var childNode = ParserNode(childJson);
//       var childElement = FormElement.fromTemplate(childJson);
//       childElement.parentProperty = parent;
//       return childElement;
//     }).toList();
//   }
// }
