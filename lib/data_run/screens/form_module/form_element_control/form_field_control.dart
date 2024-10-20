// part of 'form_element_control_abstract.dart';
//
// /// extended FormControl for form Field element
// class FormFieldControl<T> extends FormElementControl<T, FieldElementModel<T>> {
//   FormFieldControl({
//     required super.value,
//     required this.path,
//     required this.elementControl,
//     this.disabled = false,
//   });
//
//   String path;
//
//   @override
//   FormControl<T> elementControl;
//
//   bool disabled;
//
//   @override
//   void toggleDisabled({bool updateParent = true, bool emitEvent = true}) {
//     if (disabled) {
//       return;
//     }
//     elementControl.markAsDisabled(
//         updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   // @override
//   // void updateValue(FieldElementModel<T>? value,
//   //         {bool updateParent = true, bool emitEvent = true}) =>
//   //     elementControl.updateValue(
//   //         FormElementControlFactory.createFieldElementControl(value).value,
//   //         updateParent: updateParent,
//   //         emitEvent: emitEvent);
//
//   // @override
//   // void reset(
//   //         {FieldElementModel<T>? value,
//   //         bool updateParent = true,
//   //         bool emitEvent = true}) =>
//   //     elementControl.reset(
//   //         value: value != null
//   //             ? FormElementControlFactory.createFieldElementControl(value).value
//   //             : null,
//   //         updateParent: updateParent,
//   //         emitEvent: emitEvent);
//
//   String pathBuilder(String? pathItem) =>
//       [path, pathItem].whereType<String>().join(".");
//
// //
// // @override
// // void updateValue(T? value,
// //     {bool updateParent = true, bool emitEvent = true}) {
// //   if (_value != value) {
// //     _value = value;
// //     updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
// //   }
// // }
// //
// // @override
// // void patchValue(T? value, {bool updateParent = true, bool emitEvent = true}) {
// //   updateValue(value, updateParent: updateParent, emitEvent: emitEvent);
// // }
// //
// // @override
// // T? reduceValue() => _value;
// //
// // @override
// // bool anyElements(
// //         bool Function(FormElementInstance<dynamic> element) condition) =>
// //     false;
// //
// // @override
// // FormElementInstance<dynamic>? findElement(String path) => this;
// //
// // @override
// // void forEachChild(
// //         void Function(FormElementInstance<dynamic> element) callback) =>
// //     <FormElementInstance<dynamic>>[];
// }
