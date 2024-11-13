// import 'package:datarun/data_run/screens/form_module/form_element_model/form_element_model.dart';
//
// class FormElementCache {
//   final Map<String, FormElementModel<dynamic>> _cache = {};
//
//   void addElement(FormElementModel<dynamic> element) {
//     _cache[element.id] = element;
//     if (element is SectionElement || element is RepeatElement) {
//       for (var child in element.children) {
//         addElement(child);
//       }
//     }
//   }
//
//   FormElement? getElementById(String id) {
//     return _cache[id];
//   }
// }
