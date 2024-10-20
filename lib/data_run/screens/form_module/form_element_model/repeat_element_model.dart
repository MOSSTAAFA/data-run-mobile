part of 'form_element_model.dart';

class RepeatElementModel
    extends CollectionElementModel<List<Map<String, Object?>?>> {
  RepeatElementModel(
      {required super.name,
      super.path,
      super.hidden,
      super.mandatory,
      List<RepeatItemElementModel> elements = const []}) {
    this._elements.addAll(elements);
    addAll(elements);
    if (hidden) {
      markAsHidden();
    }
  }

  final List<RepeatItemElementModel> _elements = [];

  /// Gets the list of child elements.
  List<RepeatItemElementModel> get elements => List.unmodifiable(_elements);

  @override
  Iterable<FormElementModel<dynamic>> get elementsList => elements;

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
  bool allElementsHidden() {
    if (_elements.isEmpty) {
      return false;
    }
    return _elements.every((element) => element.hidden);
  }

  @override
  void markAsHidden() {
    for (final element in _elements) {
      element.markAsHidden();
    }
    super.markAsHidden();
  }

  @override
  void markAsVisible() {
    forEachChild((element) {
      element.markAsVisible();
    });
    super.markAsVisible();
  }

  void insert(
    int index,
    RepeatItemElementModel element, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    _elements.insert(index, element);
    element.parentSection = this;
    //
    // updateValueAndValidity(
    //   emitEvent: emitEvent,
    //   updateParent: updateParent,
    // );
  }

  /// Insert a new [element] at the end of the RepeatSection.
  void add(
    RepeatItemElementModel element,
  ) {
    addAll([element]);
  }

  /// Appends all [elements] to the end of the RepeatSection.
  void addAll(
    List<RepeatItemElementModel> elements,
  ) {
    _elements.addAll(elements);
    for (final element in elements) {
      element.parentSection = this;
    }
    //
    // updateValueAndValidity(
    //   updateParent: updateParent,
    //   emitEvent: emitEvent,
    // );
    // emitsCollectionChanged(_controls);
  }

  /// Removes and returns the child element at the given [index].
  void remove(
    RepeatItemElementModel element, {
    bool emitEvent = true,
    bool updateParent = true,
  }) {
    final index = _elements.indexOf(element);
    if (index == -1) {
      throw FormControlNotFoundException();
    }
    removeAt(index, emitEvent: emitEvent, updateParent: updateParent);
  }

  FormElementModel<Map<String, Object?>?> removeAt(
    int index, {
    bool emitEvent = true,
    bool updateParent = true,
  }) {
    final removedElement = _elements.removeAt(index);
    removedElement.parentSection = null;
    // updateValueAndValidity(
    //   emitEvent: emitEvent,
    //   updateParent: updateParent,
    // );

    // if (emitEvent) {
    //   emitsCollectionChanged(_controls);
    // }

    return removedElement;
  }

  /// Removes all children elements from the repeatSection.
  void clear({bool emitEvent = true, bool updateParent = true}) {
    forEachChild((element) => element.parentSection = null);
    _elements.clear();
    // updateValueAndValidity(
    //   emitEvent: emitEvent,
    //   updateParent: updateParent,
    // );

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

  int sectionIndexWhere(bool test(FormElementModel<dynamic> section),
      [int start = 0]) {
    return elements.indexWhere(test);
  }

  @override
  FormElementModel<dynamic> element(String name) {
    final namePath = name.split('.');
    if (namePath.length > 1) {
      final control = findElementInCollection(namePath);
      if (control != null) {
        return control;
      }
    } else {
      final index = int.tryParse(name);
      if (index == null) {
        throw FormRepeatElementInvalidIndexException(source: this, index: name);
      } else if (index < _elements.length) {
        return _elements[index];
      }
    }

    throw FormElementNotFoundException(this);
  }

  @override
  FormElementModel<dynamic>? findElement(String path) =>
      findElementInCollection(path.split('.'));

  @override
  void forEachChild(
          void Function(FormElementModel<dynamic> element) callback) =>
      _elements.forEach(callback);

  @override
  void updateValue(
    List<Map<String, Object?>?>? value,
  ) {
    // for (var i = 0; i < _elements.length; i++) {
    //   if (value == null || i < value.length) {
    //     _elements[i].updateValue(
    //       value?.elementAt(i),
    //     );
    //   }
    // }
    //
    // if (value != null && value.length > _elements.length) {
    //   final newElements = value
    //       .toList()
    //       .asMap()
    //       .entries
    //       .where((MapEntry<int, Map<String, Object?>?> entry) =>
    //           entry.key >= _elements.length)
    //       .map((MapEntry<int, Map<String, Object?>?> entry) => itemBuilder())
    //       .toList();
    //
    //   addAll(
    //     newElements,
    //   );
    // } else {
    //   updateValueAndValidity(
    //     updateParent: updateParent,
    //   );
    // }
  }

  @override
  void addElement(FormElementModel<dynamic> element, String path) {
    if (element is! RepeatItemElementModel) {
      throw FormElementException(
          'Trying to add a FormElement that is not RepeatItemElementModel, but: ${element.runtimeType}');
    }
    add(element);
  }
}
