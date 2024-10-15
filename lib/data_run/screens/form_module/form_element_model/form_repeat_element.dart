part of 'form_element.dart';

class FormRepeatElement
    extends FormCollectionElement<List<Map<String, Object?>?>> {
  FormRepeatElement(
      {required super.name,
      super.hidden,
      super.mandatory,
      required this.itemBuilder,
      List<FormRepeatItemElement> elements = const []}) {
    this._elements.addAll(elements);
    addAll(elements);
    if (hidden) {
      markAsHidden();
    }
  }

  final FormRepeatItemElement Function() itemBuilder;

  final List<FormRepeatItemElement> _elements = [];

  /// Gets the list of child elements.
  List<FormRepeatItemElement> get elements => List.unmodifiable(_elements);

  @override
  List<Map<String, Object?>?> get rawValue =>
      _elements.map<Map<String, Object?>?>((control) {
        if (control is FormControlCollection<Map<String, Object?>?>) {
          return (control as FormControlCollection<Map<String, Object?>?>)
              .rawValue;
        }

        return control.value;
      }).toList();

  @override
  List<Map<String, Object?>?>? reduceValue() {
    return _elements
        .where((element) => element.visible || hidden)
        .map((element) => element.value)
        .toList();
  }

  @override
  set value(List<Map<String, Object?>?>? value) {
    updateValue(value);
  }

  @override
  bool allElementsHidden() {
    if (_elements.isEmpty) {
      return false;
    }
    return _elements.every((element) => element.hidden);
  }

  @override
  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    for (final element in _elements) {
      element.markAsHidden(updateParent: true);
    }
    super.markAsHidden(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    forEachChild((element) {
      element.markAsVisible(updateParent: true);
    });
    super.markAsVisible(updateParent: updateParent, emitEvent: emitEvent);
  }

  void insert(
    int index,
    FormRepeatItemElement element, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    _elements.insert(index, element);
    element.parentSection = this;

    updateValueAndValidity(
      emitEvent: emitEvent,
      updateParent: updateParent,
    );
  }

  /// Insert a new [element] at the end of the RepeatSection.
  void add(FormRepeatItemElement element,
      {bool updateParent = true, bool emitEvent = true}) {
    addAll([element], emitEvent: emitEvent, updateParent: updateParent);
  }

  /// Appends all [elements] to the end of the RepeatSection.
  void addAll(List<FormRepeatItemElement> elements,
      {bool updateParent = true, bool emitEvent = true}) {
    _elements.addAll(elements);
    for (final element in elements) {
      element.parentSection = this;
    }

    updateValueAndValidity(
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
    // emitsCollectionChanged(_controls);
  }

  /// Removes and returns the child element at the given [index].
  void remove(
    FormRepeatItemElement element, {
    bool emitEvent = true,
    bool updateParent = true,
  }) {
    final index = _elements.indexOf(element);
    if (index == -1) {
      throw FormControlNotFoundException();
    }
    removeAt(index, emitEvent: emitEvent, updateParent: updateParent);
  }

  FormElementInstance<Map<String, Object?>?> removeAt(
    int index, {
    bool emitEvent = true,
    bool updateParent = true,
  }) {
    final removedElement = _elements.removeAt(index);
    removedElement.parentSection = null;
    updateValueAndValidity(
      emitEvent: emitEvent,
      updateParent: updateParent,
    );

    // if (emitEvent) {
    //   emitsCollectionChanged(_controls);
    // }

    return removedElement;
  }

  /// Removes all children elements from the repeatSection.
  void clear({bool emitEvent = true, bool updateParent = true}) {
    forEachChild((element) => element.parentSection = null);
    _elements.clear();
    updateValueAndValidity(
      emitEvent: emitEvent,
      updateParent: updateParent,
    );

    // if (emitEvent) {
    //   emitsCollectionChanged(_controls);
    // }
  }

  /// Checks if repeatSection contains a element by a given [name].
  /// The name here must be the string representation of the children index.
  ///
  /// `i.e repeated.element('0')`
  @override
  bool contains(String name) {
    final index = int.tryParse(name);
    if (index != null && index < _elements.length) {
      return true;
    }

    return false;
  }

  int sectionIndexWhere(bool test(FormElementInstance<dynamic> section),
      [int start = 0]) {
    return elements.indexWhere(test);
  }

  @override
  FormElementInstance<dynamic> element(String name) {
    final namePath = name.split('.');
    if (namePath.length > 1) {
      final control = findElementInCollection(namePath);
      if (control != null) {
        return control;
      }
    } else {
      final index = int.tryParse(name);
      if (index == null) {
        throw FormRepeatElementInvalidIndexException(this, name);
      } else if (index < _elements.length) {
        return _elements[index];
      }
    }

    throw FormElementNotFoundException(this);
  }

  @override
  bool anyElements(
      bool Function(FormElementInstance<dynamic> element) condition) {
    return _elements.any((element) => element.visible && condition(element));
  }

  @override
  FormElementInstance<dynamic>? findElement(String path) =>
      findElementInCollection(path.split('.'));

  @override
  void forEachChild(
          void Function(FormElementInstance<dynamic> element) callback) =>
      _elements.forEach(callback);

  @override
  void patchValue(
    List<Map<String, Object?>?>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    for (var i = 0; i < _elements.length; i++) {
      if (value == null || i < value.length) {
        _elements[i].updateValue(
          value?.elementAt(i),
          updateParent: false,
          emitEvent: emitEvent,
        );
      }
    }

    updateValueAndValidity(updateParent: updateParent);
  }

  @override
  void updateValue(List<Map<String, Object?>?>? value,
      {bool updateParent = true, bool emitEvent = true}) {
    for (var i = 0; i < _elements.length; i++) {
      if (value == null || i < value.length) {
        _elements[i].updateValue(
          value?.elementAt(i),
          updateParent: false,
          emitEvent: emitEvent,
        );
      }
    }

    if (value != null && value.length > _elements.length) {
      final newElements = value
          .toList()
          .asMap()
          .entries
          .where((MapEntry<int, Map<String, Object?>?> entry) =>
              entry.key >= _elements.length)
          .map((MapEntry<int, Map<String, Object?>?> entry) => itemBuilder())
          .toList();

      addAll(
        newElements,
        updateParent: updateParent,
      );
    } else {
      updateValueAndValidity(
        updateParent: updateParent,
      );
    }
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
