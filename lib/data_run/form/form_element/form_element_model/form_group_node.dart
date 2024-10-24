// part of 'form_element_node.dart';
//
// /// SectionElement is a Form Element representing the
// /// father of either a [SectionNode] element or a [RepeatSection] element
// sealed class FormGroupNode<T> extends FormElementNode<T> {
//   FormGroupNode({required super.name, required /*super.formElementState*/});
//
//   Iterable<FormElementNode<dynamic>> get elementsList;
//
//   FormElementNode<dynamic> element(String name);
//
//   /// Checks if [FormGroupNode] contains an element by a given [name].
//   ///
//   /// Returns true if collection contains the element, otherwise returns false.
//   bool contains(String name);
//
//   void addElement(FormElementNode<dynamic> element, String path);
//
//   // T get rawValue;
//
//   /// Walks the [path] to find the matching element.
//   ///
//   /// Returns null if no match is found.
//   FormElementNode<dynamic>? findElementInCollection(List<String> path) {
//     if (path.isEmpty) {
//       return null;
//     }
//
//     final result = path.fold<FormElementNode<dynamic>?>(this, (element, name) {
//       if (element != null && element is FormGroupNode<dynamic>) {
//         return element.contains(name) ? element.element(name) : null;
//       } else {
//         return null;
//       }
//     });
//
//     return result;
//   }
// }
