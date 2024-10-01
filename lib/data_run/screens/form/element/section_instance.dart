part of 'form_element.dart';

/// A section
class SectionInstance extends SectionElement<Map<String, Object?>> {
  SectionInstance({
    // super.parentSection,
    required super.template,
    required super.form,
    super.expanded,
    // Map<String, FormElementInstance<dynamic>> elements = const {},
  }) /*: assert(!elements.keys.any((name) => name.contains('.')),
            'element name should not contain dot(.)') */
  {
    // addAll(elements);

    // if (properties.disabled) {
    //   markAsDisabled();
    // }
    // if (properties.hidden) {
    //   markAsHidden();
    // }
  }

  final Map<String, FormElementInstance<dynamic>> _elements = {};

  Map<String, FormElementInstance<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  /// Appends all [elements] to the group.
  void addAll(Map<String, FormElementInstance<dynamic>> elements) {
        _elements.addAll(elements);
    elements.forEach((name, element) {
      element.parentSection = this;
    });
  }

  // /// build this section and all its elements
  // void buildElement(
  //   Map<String, dynamic>? value, {
  //   bool updateParent = true,
  //   bool emitEvent = true,
  // }) {
  //
  //   final controls = elements.map((name, element) => MapEntry(
  //       name,
  //       FromElementControlFactory.createTemplateControl(element.template,
  //           savedValue: element.value)));
  //   elementControl.addAll(controls);
  //
  //
  //   for (var childTemplate in template.fields) {
  //     final elementCreated = FromElementFactory.createElement(form, template,
  //         savedValue: value?[childTemplate.name]);
  //
  //     addAll({elementCreated.name: elementCreated});
  //   }
  // }

  //</editor-fold>

  //<editor-fold desc="Lookup">
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
    throw FormElementNotFoundException(elementName: name);
  }

  @override
  FormElementInstance<dynamic>? findElement(String path) =>
      findElementInCollection(path.split('.'));

  @override
  bool anyElements(
      bool Function(FormElementInstance<dynamic> element) condition) {
    return _elements.values
        .any((element) => element.enabled && condition(element));
  }

  @override
  void forEachChild(
      void Function(FormElementInstance<dynamic> element) callback) {
    _elements.forEach((name, element) => callback(element));
  }

  //</editor-fold>

  //<editor-fold desc="Update Value">
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
  void patchValue(Map<String, Object?>? value,
      {bool updateParent = true, bool emitEvent = true}) {
    value?.forEach((name, value) {
      if (_elements.containsKey(name)) {
        _elements[name]!.patchValue(
          value,
          updateParent: false,
          emitEvent: emitEvent,
        );
      }
    });
  }

//</editor-fold>

  //<editor-fold desc="Util-methods">
  @override
  bool allElementsDisabled() {
    if (_elements.isEmpty) {
      return false;
    }
    return _elements.values.every((element) => element.disabled);
  }

  @override
  void dispose() {
    forEachChild((element) {
      element.parentSection = null;
      element.dispose();
    });
    elementControl.closeCollectionEvents();
    super.dispose();
  }

  @override
  FormGroup get elementControl => form.control(elementPath) as FormGroup;

  @override
  Map<String, Object?> get rawValue => elementControl.rawValue;

  @override
  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    _elements.forEach((_, element) {
      element.markAsHidden(updateParent: true);
    });
  }

  @override
  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    _elements.forEach((_, element) {
      element.markAsVisible();
    });
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
