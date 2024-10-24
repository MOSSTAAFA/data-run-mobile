// part of 'form_element_node.dart';
//
// class RepeatNode extends FormGroupNode<List<Map<String, Object?>?>> {
//   RepeatNode(
//       {required super.name,
//       List<RepeatItemNode> elements = const [],
//       required super.formElementState}) {
//     this._elements.addAll(elements);
//     addAll(elements);
//   }
//
//   final List<RepeatItemNode> _elements = [];
//
//   /// Gets the list of child elements.
//   List<RepeatItemNode> get elements => List.unmodifiable(_elements);
//
//   @override
//   Iterable<FormElementNode<dynamic>> get elementsList => elements;
//
//   @override
//   bool allElementsHidden() {
//     if (_elements.isEmpty) {
//       return false;
//     }
//     return _elements.every((element) => element.hidden);
//   }
//
//   void insert(
//     int index,
//     RepeatItemNode element, {
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     _elements.insert(index, element);
//     element.parentSection = this;
//     //
//     // updateValueAndValidity(
//     //   emitEvent: emitEvent,
//     //   updateParent: updateParent,
//     // );
//   }
//
//   /// Insert a new [element] at the end of the RepeatSection.
//   void add(
//     RepeatItemNode element,
//   ) {
//     addAll([element]);
//   }
//
//   /// Appends all [elements] to the end of the RepeatSection.
//   void addAll(
//     List<RepeatItemNode> elements,
//   ) {
//     _elements.addAll(elements);
//     for (final element in elements) {
//       element.parentSection = this;
//     }
//     //
//     // updateValueAndValidity(
//     //   updateParent: updateParent,
//     //   emitEvent: emitEvent,
//     // );
//     // emitsCollectionChanged(_controls);
//   }
//
//   /// Removes and returns the child element at the given [index].
//   void remove(
//     RepeatItemNode element, {
//     bool emitEvent = true,
//     bool updateParent = true,
//   }) {
//     final index = _elements.indexOf(element);
//     if (index == -1) {
//       throw FormElementNotFoundException(null);
//     }
//     removeAt(index, emitEvent: emitEvent, updateParent: updateParent);
//   }
//
//   FormElementNode<Map<String, Object?>?> removeAt(
//     int index, {
//     bool emitEvent = true,
//     bool updateParent = true,
//   }) {
//     final removedElement = _elements.removeAt(index);
//     removedElement.parentSection = null;
//     return removedElement;
//   }
//
//   /// Removes all children elements from the repeatSection.
//   void clear({bool emitEvent = true, bool updateParent = true}) {
//     forEachChild((element) => element.parentSection = null);
//     _elements.clear();
//   }
//
//   /// Checks if repeatSection contains a element by a given [name].
//   /// The name here must be the string representation of the children index.
//   ///
//   /// `i.e repeated.element('0')`
//   @override
//   bool contains(String name) {
//     final index = int.tryParse(name);
//     if (index != null && index < _elements.length) {
//       return true;
//     }
//
//     return false;
//   }
//
//   int sectionIndexWhere(bool test(FormElementNode<dynamic> section),
//       [int start = 0]) {
//     return elements.indexWhere(test);
//   }
//
//   @override
//   FormElementNode<dynamic> element(String name) {
//     final namePath = name.split('.');
//     if (namePath.length > 1) {
//       final control = findElementInCollection(namePath);
//       if (control != null) {
//         return control;
//       }
//     } else {
//       final index = int.tryParse(name);
//       if (index == null) {
//         throw FormRepeatElementInvalidIndexException(source: null, index: name);
//       } else if (index < _elements.length) {
//         return _elements[index];
//       }
//     }
//
//     throw FormElementNotFoundException(null);
//   }
//
//   @override
//   FormElementNode<dynamic>? findElement(String path) =>
//       findElementInCollection(path.split('.'));
//
//   @override
//   void forEachChild(void Function(FormElementNode<dynamic> element) callback) =>
//       _elements.forEach(callback);
//
//   @override
//   void addElement(FormElementNode<dynamic> element, String path) {
//     if (element is! RepeatItemNode) {
//       throw FormElementException(
//           'Trying to add a FormElement that is not RepeatItemElementModel, but: ${element.runtimeType}');
//     }
//     add(element);
//   }
// }
