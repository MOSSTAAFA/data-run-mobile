// import 'package:equatable/equatable.dart';
// import 'package:mass_pro/data_run/screens/form/element/exceptions/form_element_exception.dart';
//
// part 'field_node.dart';
//
// part 'form_group_node.dart';
//
// part 'section_node.dart';
//
// part 'repeat_node.dart';
//
// part 'repeat_item_node.dart';
//
// sealed class FormElementNode<T> with EquatableMixin {
//   FormElementNode({required this.name, required this.formElementState});
//
//   // @override
//   // List<Object> get props => [formElementState];
//
//   FormElementNode<Object>? _parentSection;
//
//   final String name;
//
//   // // <path, elementState>
//   // final FormElementState<T> formElementState;
//
//   // bool get hidden => formElementState.hidden;
//   //
//   // bool get visible => !hidden;
//
//   FormElementNode<Object>? get parentSection => _parentSection;
//
//   set parentSection(FormElementNode<Object>? parent) {
//     _parentSection = parent;
//   }
//
//   String get elementPath => pathBuilder(name);
//
//   String pathBuilder(String? pathItem) => [
//         parentSection != null ? parentSection!.elementPath : null,
//         pathItem
//       ].whereType<String>().join('.');
//
//   // T? reduceValue();
//
//   // bool allElementsHidden() => formElementState.hidden;
//
//   void forEachChild(void Function(FormElementNode<dynamic> element) callback);
//
//   FormElementNode<dynamic>? findElement(String path);
//
//   Map<String, dynamic> flattenElements(
//       Map<String, dynamic> formMap, String prefix) {
//     final flatMap = <String, dynamic>{};
//     formMap.forEach((key, value) {
//       if (value is Map<String, dynamic>) {
//         flatMap.addAll(flattenElements(value, '$prefix.$key'));
//       } else {
//         flatMap['$key'] = value;
//       }
//     });
//     return flatMap;
//   }
// }
