// part of 'form_element_node.dart';
//
// class SectionNode extends FormGroupNode<Map<String, Object?>> {
//   SectionNode({
//     required super.name,
//     Map<String, FormElementNode<dynamic>> elements = const {},
//     // required super.formElementState,
//   }) : assert(!elements.keys.any((name) => name.contains('.')),
//             'element name should not contain dot(.)') {
//     addAll(elements);
//   }
//
//   /// by path
//   final Map<String, FormElementNode<dynamic>> _elements = {};
//
//   Map<String, FormElementNode<dynamic>> get elements =>
//       Map.unmodifiable(_elements);
//
//   @override
//   bool contains(String name) {
//     return _elements.containsKey(name);
//   }
//
//   @override
//   FormElementNode<dynamic> element(String name) {
//     final namePath = name.split('.');
//     if (namePath.length > 1) {
//       final element = findElementInCollection(namePath);
//       if (element != null) {
//         return element;
//       }
//     } else if (contains(name)) {
//       return _elements[name]!;
//     }
//     throw FormElementNotFoundException(null);
//   }
//   //
//   // @override
//   // Map<String, Object?> get rawValue =>
//   //     _elements.map<String, Object?>((key, element) {
//   //       if (element is FormGroupNode<dynamic>) {
//   //         return MapEntry(key, element.rawValue);
//   //       }
//   //
//   //       return MapEntry(key, element.value);
//   //     });
//   //
//   // @override
//   // void markAsHidden() {
//   //   _elements.forEach((_, element) {
//   //     element.markAsHidden();
//   //   });
//   //   super.markAsHidden();
//   // }
//   //
//   // @override
//   // void markAsVisible() {
//   //   _elements.forEach((_, element) {
//   //     element.markAsVisible();
//   //   });
//   //   super.markAsVisible();
//   // }
//   //
//   // @override
//   // void updateValue(Map<String, Object?>? value,
//   //     {bool updateParent = true, bool emitEvent = true}) {
//   //   value ??= {};
//   //   for (final key in _elements.keys) {
//   //     _elements[key]!.updateValue(
//   //       value[key],
//   //     );
//   //   }
//   // }
//   //
//   // @override
//   // Map<String, Object?>? reduceValue() {
//   //   final map = <String, Object?>{};
//   //   _elements.forEach((key, element) {
//   //     if (element.visible || hidden) {
//   //       map[key] = element.value;
//   //     }
//   //   });
//   //
//   //   return map;
//   // }
//   //
//   // Map<String, Object?>? reduceValueFlat() {
//   //   final map = <String, Object?>{};
//   //   _elements.forEach((key, element) {
//   //     if (element.visible || hidden) {
//   //       map[key] = element.value;
//   //     }
//   //   });
//   //
//   //   return map;
//   // }
//
//   @override
//   bool allElementsHidden() {
//     if (_elements.isEmpty) {
//       return false;
//     }
//     return _elements.values.every((element) => element.hidden);
//   }
//
//   void removeElement(String name) {
//     if (!_elements.containsKey(name)) {
//       throw FormElementNotFoundException(null);
//     }
//
//     _elements.removeWhere((key, value) => key == name);
//   }
//
//   @override
//   FormElementNode<dynamic>? findElement(String path) =>
//       findElementInCollection(path.split('.'));
//
//   @override
//   void forEachChild(void Function(FormElementNode<dynamic> element) callback) {
//     _elements.forEach((name, element) => callback(element));
//   }
//
//   @override
//   Iterable<FormElementNode<dynamic>> get elementsList => elements.values;
//
//   /// Appends all [elements] to the group.
//   void addAll(Map<String, FormElementNode<dynamic>> elements) {
//     _elements.addAll(elements);
//     elements.forEach((name, element) {
//       element.parentSection = this;
//     });
//   }
//
//   @override
//   void addElement(FormElementNode<dynamic> element, String path) {
//     addAll({path: element});
//   }
// }
