// part of 'form_element_node.dart';
//
// /// A section
// class RepeatItemNode extends SectionNode {
//   RepeatItemNode({
//     required super.name,
//     super.elements,
//     required super.formElementState,
//   });
//
//   int get sectionIndex => (parentSection as RepeatNode)
//       .sectionIndexWhere((section) => section == this);
//
//   @override
//   String get name => '$sectionIndex';
//
//   set parentSection(FormElementNode<Object>? parent) {
//     if (parent is! RepeatNode) {
//       throw StateError(
//           'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parent.runtimeType}');
//     }
//
//     _parentSection = parent;
//   }
//
//   String pathBuilder(String? pathItem) {
//     if (parentSection == null) {
//       throw StateError('RepeatItemInstance\'s Parent should not be null');
//     }
//
//     if (!(parentSection is RepeatNode)) {
//       throw StateError(
//           'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parentSection.runtimeType}');
//     }
//
//     return [parentSection!.elementPath, pathItem].whereType<String>().join('.');
//   }
// }
