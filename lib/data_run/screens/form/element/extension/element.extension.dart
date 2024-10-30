part of '../form_element.dart';

extension FormFieldModelExtensions<T> on FieldInstance<T> {
  TextInputType? get inputType {
    return switch (type) {
      ValueType.Text => TextInputType.text,
      ValueType.LongText => TextInputType.multiline,
      ValueType.Letter => TextInputType.text,
      ValueType.Number =>
        const TextInputType.numberWithOptions(decimal: true, signed: true),
      ValueType.UnitInterval =>
        const TextInputType.numberWithOptions(decimal: true),
      ValueType.Percentage => TextInputType.number,
      ValueType.IntegerNegative ||
      ValueType.Integer =>
        const TextInputType.numberWithOptions(signed: true),
      ValueType.IntegerPositive ||
      ValueType.IntegerZeroOrPositive =>
        TextInputType.number,
      ValueType.PhoneNumber => TextInputType.phone,
      ValueType.Email => TextInputType.emailAddress,
      ValueType.URL => TextInputType.url,
      _ => TextInputType.text
    };
  }

  TextInputAction? get inputAction {
    return TextInputAction.none;
    // return when(
    //     keyboardActionType, <KeyboardActionType, TextInputAction Function()>{
    //   KeyboardActionType.NEXT: () => TextInputAction.next,
    //   KeyboardActionType.DONE: () => TextInputAction.done,
    //   KeyboardActionType.ENTER: () => TextInputAction.none,
    // });
  }

  int? get maxLength {
    switch (type) {
      case ValueType.Text:
        return 255;
      case ValueType.LongText:
      case ValueType.Letter:
        return 500;
      default:
        return null;
    }
  }

  int get maxLines {
    switch (type) {
      case ValueType.LongText:
      case ValueType.Letter:
        return 2;
      default:
        return 1;
    }
  }

  //
  TextInputAction? get textInputAction {
    // if (keyboardActionType != null) {
    //   return when(
    //       keyboardActionType, <KeyboardActionType, TextInputAction Function()>{
    //     KeyboardActionType.NEXT: () => TextInputAction.next,
    //     KeyboardActionType.DONE: () => TextInputAction.done,
    //     KeyboardActionType.ENTER: () => TextInputAction.none
    //   });
    // }
    return null;
  }
}

extension FormElementMain<T> on FormElementInstance<T> {}

// class FormSection extends SectionElement<Map<String, Object?>> {
//   FormSection({
//     // super.parentSection,
//     // super.template = FieldTemplate(),
//     required super.form,
//     // super.expanded,
//     // super.path,
//     Map<String, FormElementInstance<dynamic>> elements = const {},
//   })  : assert(!elements.keys.any((name) => name.contains('.')),
//   'element name should not contain dot(.)'),
//         super(
//           template: FieldTemplate(
//               mandatory: false,
//               mainField: false,
//               type: ValueType.Unknown,
//               name: '')) {
//
//     addAll(elements);
//
//     if (properties.disabled) {
//       markAsDisabled();
//     }
//     if (properties.hidden) {
//       markAsHidden();
//     }
//   }
//
//   final Map<String, FormElementInstance<dynamic>> _elements = {};
//
//   @override
//   Map<String, Object?> get value => Map.unmodifiable(_value!);
//
//   // @override
//   // set value(Map<String, Object?>? value) {
//   //   updateValue(value);
//   // }
//
//   Map<String, FormElementInstance<dynamic>> get elements =>
//       Map.unmodifiable(_elements);
//
//   @override
//   bool contains(String name) {
//     return _elements.containsKey(name);
//   }
//
//   @override
//   void markAsDisabled({bool updateParent = true, bool emitEvent = true}) {
//     _elements.forEach((_, element) {
//       element.markAsDisabled(updateParent: true);
//     });
//     form.markAsDisabled(updateParent: updateParent, emitEvent: emitEvent);
//     super.markAsDisabled(updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   @override
//   void markAsEnabled({bool updateParent = true, bool emitEvent = true}) {
//     _elements.forEach((_, element) {
//       element.markAsEnabled(updateParent: true);
//     });
//     form.markAsEnabled(updateParent: updateParent, emitEvent: emitEvent);
//     super.markAsEnabled(updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   @override
//   void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
//     _elements.forEach((_, element) {
//       element.markAsHidden(updateParent: true);
//     });
//     form.markAsDisabled(updateParent: updateParent, emitEvent: emitEvent);
//     super.markAsHidden(updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   @override
//   void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
//     _elements.forEach((_, element) {
//       element.markAsVisible();
//     });
//     form.markAsEnabled(updateParent: updateParent, emitEvent: emitEvent);
//     super.markAsVisible(updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   /// Appends all [elements] to the group.
//   void addAll(Map<String, FormElementInstance<dynamic>> elements) {
//     _elements.addAll(elements);
//     elements.forEach((name, element) {
//       element.parentSection = this;
//     });
//     updateValueAndValidity();
//     // updateTouched();
//     // updatePristine();
//     // emitsCollectionChanged(_controls.values.toList());
//   }
//
//   @override
//   FormElementInstance<dynamic> element(String name) {
//     final namePath = name.split('.');
//     if (namePath.length > 1) {
//       final element = findElementInCollection(namePath);
//       if (element != null) {
//         return element;
//       }
//     } else if (contains(name)) {
//       return _elements[name]!;
//     }
//     throw FormElementNotFoundException(elementName: name);
//   }
//
//   @override
//   Map<String, Object?> get rawValue =>
//       _elements.map<String, Object?>((key, element) {
//         if (element is SectionElement<dynamic>) {
//           return MapEntry(key, element.rawValue);
//         }
//
//         return MapEntry(key, element.value);
//       });
//
//   @override
//   void updateValue(Map<String, Object?>? value,
//       {bool updateParent = true, bool emitEvent = true}) {
//     value ??= {};
//
//     for (final key in _elements.keys) {
//       _elements[key]!.updateValue(
//         value[key],
//         updateParent: false,
//         emitEvent: emitEvent,
//       );
//     }
//     updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   @override
//   void patchValue(Map<String, Object?>? value,
//       {bool updateParent = true, bool emitEvent = true}) {
//     value?.forEach((name, value) {
//       if (_elements.containsKey(name)) {
//         _elements[name]!.patchValue(
//           value,
//           updateParent: false,
//           emitEvent: emitEvent,
//         );
//       }
//     });
//
//     updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   @override
//   Map<String, Object?>? reduceValue() {
//     final map = <String, Object?>{};
//     _elements.forEach((key, element) {
//       if (element.enabled || disabled) {
//         map[key] = element.value;
//       }
//     });
//
//     return map;
//   }
//
//   @override
//   bool allElementsDisabled() {
//     if (_elements.isEmpty) {
//       return false;
//     }
//     return _elements.values.every((element) => element.disabled);
//   }
//
//   void removeElement(String name,
//       {bool updateParent = true, bool emitEvent = true}) {
//     if (!_elements.containsKey(name)) {
//       throw FormElementNotFoundException(elementName: name);
//     }
//
//     _elements.removeWhere((key, value) => key == name);
//     updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
//   }
//
//   @override
//   bool anyElements(
//       bool Function(FormElementInstance<dynamic> element) condition) {
//     return _elements.values
//         .any((element) => element.enabled && condition(element));
//   }
//
//   @override
//   FormElementInstance<dynamic>? findElement(String path) =>
//       findElementInCollection(path.split('.'));
//
//   @override
//   void forEachChild(
//       void Function(FormElementInstance<dynamic> element) callback) {
//     _elements.forEach((name, element) => callback(element));
//   }
//
//   @override
//   void dispose() {
//     forEachChild((element) {
//       element.parentSection = null;
//       // element.dispose();
//     });
//     // closeCollectionEvents();
//     super.dispose();
//   }
//
//   AbstractControl<dynamic> get currentForm {
//     return path == null ? form : form.control(path!);
//   }
//
//   void addElement(FormElementInstance<dynamic> element) {
//     addAll({element.name: element});
//     elementControl.addAll({
//       element.name: FromElementControlFactory.createElementControl(element)
//     });
//   }
//
//   void addElements(Map<String, FormElementInstance<dynamic>> elements) {
//     elements.mapValues((e) => addElement(e.value));
//   }
//
//   void get sectionFocus => form.focus(elementPath);
//
//   void updateSectionValue(
//       SectionInstance value, {
//         bool updateParent = true,
//         bool emitEvent = true,
//       }) {
//     updateValue(value.rawValue,
//         updateParent: updateParent, emitEvent: emitEvent);
//
//     elementControl.updateValue(
//       value.rawValue,
//       updateParent: updateParent,
//       emitEvent: emitEvent,
//     );
//   }
//
//   @override
//   FormGroup get elementControl => form.control(elementPath) as FormGroup;
//
//   bool get repeatParent => (parentSection is RepeatSectionInstance);
//
//   @override
//   String get name => repeatParent ? '' : template.name;
//
//   @override
//   ValueType get type => repeatParent ? ValueType.Section : template.type;
//
//   String get pathRecursive {
//     String? parentPath;
//     if (parentSection != null) {
//       parentPath = '${parentSection!.pathRecursive}';
//       if (repeatParent) {
//         int sectionIndex = (parentSection as RepeatSectionInstance)
//             .sectionIndexWhere((section) => section == this);
//         return '${parentPath}.$sectionIndex';
//       }
//       return '${parentSection!.pathRecursive}.${name}';
//     }
//     return name;
//   }
//
//   @override
//   String get elementPath => repeatParent ? pathRecursive : pathBuilder(name);
// }
