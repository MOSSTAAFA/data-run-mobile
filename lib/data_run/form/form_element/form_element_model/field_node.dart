// part of 'form_element_node.dart';
//
// class FieldNode<T> extends FormElementNode<T> {
//   FieldNode({
//     T? value,
//     required super.name,
//     super.hidden,
//   }) {
//     if (value != null) this._value = value;
//   }
//
//   T? _value;
//
//   @override
//   void updateValue(T? value,
//       {bool updateParent = true, bool emitEvent = true}) {
//     if (_value != value) {
//       _value = value;
//     }
//   }
//
//   @override
//   T? reduceValue() => _value;
//
//   @override
//   FormElementNode<dynamic>? findElement(String path) => this;
//
//   @override
//   void forEachChild(
//           void Function(FormElementNode<dynamic> element) callback) =>
//       <FormElementNode<dynamic>>[];
// }
