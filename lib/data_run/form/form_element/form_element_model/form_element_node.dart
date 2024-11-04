// import 'package:equatable/equatable.dart';
// import 'package:mass_pro/data_run/form/form_element/form_element_model/element.dart';
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
// abstract class Element<T> {
//   String get name;
//   T? get value;
// }
//
// abstract class ContainerElement<T> implements Element {
//   List<Element> get elements;
// }
//
// abstract class Element<T> {
//   String get name;
//
//   String get pathRecursive;
//
//   Element<Object>? get parentSection;
//
//   T? get value;
// }
//
// sealed class FormElement<T> with EquatableMixin implements Element {
//   FormElement({required this.name});
//
//   final List<String> dependencies;
//
//   final FormElement<Object>? _parent;
//
//   @override
//   FormElement<Object>? get parent => _parent;
//
//   final String name;
//
//   // // <path, elementState>
//   // final FormElementState<T> formElementState;
//
//   final bool hidden;
//
//   //
//   final bool visible;
//
//   // FormElement<Object>? get parentSection => _parentSection;
//   //
//   // set parent(FormElement<Object>? parent) {
//   //   _parentSection = parent;
//   // }
//   //
//   // String get elementPath => pathBuilder(name);
//   //
//   // String pathBuilder(String? pathItem) => [
//   //       parentSection != null ? parentSection!.elementPath : null,
//   //       pathItem
//   //     ].whereType<String>().join('.');
//   //
//   // // T? reduceValue();
//   //
//   // // bool allElementsHidden() => formElementState.hidden;
//   //
//   // void forEachChild(void Function(FormElement<dynamic> element) callback);
//   //
//   // FormElement<dynamic>? findElement(String path);
//   //
//   // Map<String, dynamic> flattenElements(
//   //     Map<String, dynamic> formMap, String prefix) {
//   //   final flatMap = <String, dynamic>{};
//   //   formMap.forEach((key, value) {
//   //     if (value is Map<String, dynamic>) {
//   //       flatMap.addAll(flattenElements(value, '$prefix.$key'));
//   //     } else {
//   //       flatMap['$key'] = value;
//   //     }
//   //   });
//   //   return flatMap;
//   // }
// }
