// part of 'form_element_control_abstract.dart';
//
// /// extended FormGroup for form Section element
// class FormSectionControl extends FormCollectionElementControl<
//     Map<String, Object?>, SectionElementModel> {
//   FormSectionControl({
//     required this.elementControl,
//     this.path,
//     required super.value,
//   });
//
//   @override
//   FormGroup elementControl;
//
//   String? path;
//
//   @override
//   bool contains(String name) {
//     return elementControl.controls.containsKey(name);
//   }
//
//   @override
//   AbstractControl<dynamic> childControl(String name) {
//     final namePath = name.split('.');
//     if (namePath.length > 1) {
//       final element = findControlInCollection(namePath);
//       if (element != null) {
//         return element;
//       }
//     } else if (contains(name)) {
//       return elementControl.controls[name]!;
//     }
//     throw FormElementControlNotFoundException(source: this);
//   }
//
//   @override
//   // TODO: implement model
//   Map<String, Object?> get model => throw UnimplementedError();
//
//   @override
//   reset(
//       {SectionElementModel? value,
//       bool updateParent = true,
//       bool emitEvent = true}) {
//     // TODO: implement reset
//     throw UnimplementedError();
//   }
//
//   @override
//   void submit(
//       {required void Function(Map<String, Object?> model) onValid,
//       void Function()? onNotValid}) {
//     // TODO: implement submit
//   }
//
//   @override
//   void toggleDisabled({bool updateParent = true, bool emitEvent = true}) {
//     // TODO: implement toggleDisabled
//   }
//
//   // @override
//   // void updateValue(FormSectionElement? value, {bool updateParent = true, bool emitEvent = true}) {
//   //   // TODO: implement updateValue
//   // }
//
//   // @override
//   // void updateValue(
//   //     SectionElementModel? value, {
//   //   bool updateParent = true,
//   //   bool emitEvent = true,
//   // }) {
//   //   return elementControl.updateValue(
//   //       FormElementControlFactory.createSectionElementControl(value).rawValue,
//   //       updateParent: updateParent,
//   //       emitEvent: emitEvent);
//   // }
//
// // @override
// // Map<String, Object?> get rawValue =>
// //     _elements.map<String, Object?>((key, element) {
// //       if (element is FormCollectionElement<dynamic>) {
// //         return MapEntry(key, element.rawValue);
// //       }
// //
// //       return MapEntry(key, element.value);
// //     });
//
// // @override
// // void updateValue(Map<String, Object?>? value,
// //     {bool updateParent = true, bool emitEvent = true}) {
// //   value ??= {};
// //
// //   for (final key in _elements.keys) {
// //     _elements[key]!.updateValue(
// //       value[key],
// //       updateParent: false,
// //       emitEvent: emitEvent,
// //     );
// //   }
// //   updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
// // }
// //
// // @override
// // void patchValue(Map<String, Object?>? value,
// //     {bool updateParent = true, bool emitEvent = true}) {
// //   value?.forEach((name, value) {
// //     if (_elements.containsKey(name)) {
// //       _elements[name]!.patchValue(
// //         value,
// //         updateParent: false,
// //         emitEvent: emitEvent,
// //       );
// //     }
// //   });
// //
// //   updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
// // }
// //
// // @override
// // Map<String, Object?>? reduceValue() {
// //   final map = <String, Object?>{};
// //   _elements.forEach((key, element) {
// //     if (element.visible || hidden) {
// //       map[key] = element.value;
// //     }
// //   });
// //
// //   return map;
// // }
// //
// // @override
// // bool allElementsHidden() {
// //   if (_elements.isEmpty) {
// //     return false;
// //   }
// //   return _elements.values.every((element) => element.hidden);
// // }
// //
// // void removeElement(String name,
// //     {bool updateParent = true, bool emitEvent = true}) {
// //   if (!_elements.containsKey(name)) {
// //     throw FormElementNotFoundException(elementName: name);
// //   }
// //
// //   _elements.removeWhere((key, value) => key == name);
// //   updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
// // }
// //
// // @override
// // bool anyElements(
// //     bool Function(FormElementControl<dynamic> element) condition) {
// //   return _elements.values
// //       .any((element) => element.visible && condition(element));
// // }
// //
// // @override
// // FormElementControl<dynamic>? findElement(String path) =>
// //     findElementInCollection(path.split('.'));
// //
// // @override
// // void forEachChild(
// //     void Function(FormElementInstance<dynamic> element) callback) {
// //   _elements.forEach((name, element) => callback(element));
// // }
// //
// // @override
// // void dispose() {
// //   forEachChild((element) {
// //     element.parentSection = null;
// //     element.dispose();
// //   });
// //   // closeCollectionEvents();
// //   super.dispose();
// // }
// }
