part of 'form_element.dart';

class FormSectionElement extends FormCollectionElement<Map<String, Object?>> {
  FormSectionElement({
    required super.name,
    super.hidden,
    super.mandatory,
    Map<String, FormElementInstance<dynamic>> elements = const {},
  }) : assert(!elements.keys.any((name) => name.contains('.')),
            'element name should not contain dot(.)') {
    addAll(elements);
    if (hidden) {
      markAsHidden();
    }
  }

  final Map<String, FormElementInstance<dynamic>> _elements = {};

  @override
  Map<String, Object?> get value => _value!;

  @override
  set value(Map<String, Object?>? value) {
    updateValue(value);
  }

  Map<String, FormElementInstance<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  @override
  bool contains(String name) {
    return _elements.containsKey(name);
  }

  @override
  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    _elements.forEach((_, element) {
      element.markAsHidden(updateParent: true);
    });
    super.markAsHidden(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    _elements.forEach((_, element) {
      element.markAsVisible();
    });
    super.markAsVisible(updateParent: updateParent, emitEvent: emitEvent);
  }

  /// Appends all [elements] to the group.
  void addAll(Map<String, FormElementInstance<dynamic>> elements) {
    _elements.addAll(elements);
    elements.forEach((name, element) {
      element.parentSection = this;
    });
    updateValueAndValidity();
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
    throw FormElementNotFoundException(this);
  }

  @override
  Map<String, Object?> get rawValue =>
      _elements.map<String, Object?>((key, element) {
        if (element is FormCollectionElement<dynamic>) {
          return MapEntry(key, element.rawValue);
        }

        return MapEntry(key, element.value);
      });

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

    // if(value == _value) {
    //   return;
    // }
    // IMap<String, Object?> newValues = value ?? IMap({});
    // for (final key in _elements.keys) {
    //   _elements[key]!.updateValue(
    //     newValues.get(key),
    //     updateParent: false,
    //     emitEvent: emitEvent,
    //   );
    // }

    updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
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

    updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
  }

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
  bool allElementsHidden() {
    if (_elements.isEmpty) {
      return false;
    }
    return _elements.values.every((element) => element.hidden);
  }

  void removeElement(String name,
      {bool updateParent = true, bool emitEvent = true}) {
    if (!_elements.containsKey(name)) {
      throw FormElementNotFoundException(this);
    }

    _elements.removeWhere((key, value) => key == name);
    updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  bool anyElements(
      bool Function(FormElementInstance<dynamic> element) condition) {
    return _elements.values
        .any((element) => element.visible && condition(element));
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
  void dispose() {
    forEachChild((element) {
      element.parentSection = null;
      element.dispose();
    });
    // closeCollectionEvents();
    super.dispose();
  }
}
