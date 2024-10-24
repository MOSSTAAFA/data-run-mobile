// import 'package:mass_pro/data_run/form/form_element/parsing/parse_node.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element_model.dart';
//
// abstract class FormElementParser<T extends FormElementModel<dynamic>> {
//   T getInstance();
//
//   T parse(ParserNode parserNode, FormElementModel<dynamic>? parent) {
//     var element = getInstance();
//     fillProperties(element, parserNode, parent);
//     return element;
//   }
//
//   void fillProperties(
//       T element, ParserNode parserNode, FormElementModel<dynamic>? parent);
// }
//
// class SectionElementParser extends FormElementParser<SectionElementModel> {
//   @override
//   SectionElementModel getInstance() =>
//       SectionElementModel(name: '', path: '', elements: {});
//
//   @override
//   void fillProperties(SectionElementModel element, ParserNode parserNode,
//       FormElementModel<dynamic>? parent) {
//     element
//       ..name = parserNode.getPlainString('name')
//       ..path = parserNode.getPlainString('path')
//       ..fields = parserNode.getChildren('fields', element);
//   }
// }
//
// // Define parsers for other elements similarly...
