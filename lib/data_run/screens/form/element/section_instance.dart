part of 'form_element.dart';

/// A section
class SectionInstance extends SectionElement<Map<String, Object?>> {
  SectionInstance({
    required super.template,
    required super.form,
    Map<String, FormElementInstance<dynamic>> elements = const {},
  }) : assert(!elements.keys.any((name) => name.contains('.')),
            'element name should not contain dot(.)') {
    addAll(elements);
  }

  final Map<String, FormElementInstance<dynamic>> _elements = {};

  Map<String, FormElementInstance<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  // @override
  // FormGroup get elementControl =>
  //     name.isEmpty ? form : (form.control(elementPath) as FormGroup);

  @override
  FormGroup get elementControl => form.control(elementPath) as FormGroup;

  /// Appends all [elements] to the group.
  void addAll(Map<String, FormElementInstance<dynamic>> elements) {
    _elements.addAll(elements);
    elements.forEach((name, element) {
      element.parentSection = this;
    });
  }

  @override
  bool contains(String name) {
    return _elements.containsKey(name);
  }

  @override
  FormElementInstance<dynamic> element(String name) {
    final namePath = name.split('.');
    if (namePath.length > 1) {
      final element = findElementInCollection(namePath);
      if (element != null) {
        return element;
      }
    } else if (contains(name)) {
      return _elements[name]!;
    }
    throw FormElementNotFoundException(null);
  }

  @override
  FormElementInstance<dynamic>? findElement(String path) =>
      findElementInCollection(path.split('.'));

  @override
  void forEachChild(
      void Function(FormElementInstance<dynamic> element) callback) {
    _elements.forEach((name, element) => callback(element));
  }

  @override
  void updateValue(Map<String, Object?>? value,
      {bool updateParent = true, bool emitEvent = true}) {
    value ??= {};

    for (final key in _elements.keys) {
      _elements[key]!.updateValue(
        value[key],
        updateParent: false,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  bool allElementsHidden() {
    if (_elements.isEmpty) {
      return false;
    }
    return _elements.values.every((element) => element.hidden);
  }

  @override
  Map<String, Object?> get rawValue =>
      _elements.map<String, Object?>((key, element) {
        if (element is SectionElement<dynamic>) {
          return MapEntry(key, element.rawValue);
        }

        return MapEntry(key, element.value);
      });

  @override
  Map<String, Object?>? reduceValue() {
    final map = <String, Object?>{};
    _elements.forEach((key, element) {
      if (element.visible || hidden) {
        map[key] = element.value;
      }
    });

    return map;
  }

  @override
  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    _elements.forEach((_, element) {
      element.markAsHidden(updateParent: true);
    });
    super.markAsHidden();
  }

  @override
  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    _elements.forEach((_, element) {
      element.markAsVisible();
    });
    super.markAsVisible();
  }

  @override
  void reset({Map<String, Object?>? value}) {
    updateValue(value);
    elementControl.reset(value: value);
  }

  @override
  void dispose() {
    // forEachChild((element) {
    //   element.parentSection = null;
    //   element.dispose();
    // });
    // elementControl.closeCollectionEvents();
    super.dispose();
  }
// void updateSectionValue(
//   Map<String, Object?>? value, {
//   bool updateParent = true,
//   bool emitEvent = true,
// }) {
//   elementControl.updateValue(
//     value,
//     updateParent: updateParent,
//     emitEvent: emitEvent,
//   );
// }

//<editor-fold desc="Mark">
// @override
// void markAsDisabled({bool updateParent = true, bool emitEvent = true}) {
//   _elements.forEach((_, element) {
//     element.markAsDisabled(updateParent: true);
//   });
//   super.markAsDisabled(updateParent: updateParent, emitEvent: emitEvent);
// }
//
// @override
// void markAsEnabled({bool updateParent = true, bool emitEvent = true}) {
//   _elements.forEach((_, element) {
//     element.markAsEnabled(updateParent: true);
//   });
//   super.markAsEnabled(updateParent: updateParent, emitEvent: emitEvent);
// }
//

//</editor-fold>
// @override
// Map<String, Object?> get rawValue =>
//     _elements.map<String, Object?>((key, element) {
//       if (element is SectionElement<dynamic>) {
//         return MapEntry(key, element.rawValue);
//       }
//
//       return MapEntry(key, element.value);
//     });

// @override
// Map<String, Object?>? reduceValue() {
//   final map = <String, Object?>{};
//   _elements.forEach((key, element) {
//     if (element.enabled || disabled) {
//       map[key] = element.value;
//     }
//   });
//
//   return map;
// }
}
