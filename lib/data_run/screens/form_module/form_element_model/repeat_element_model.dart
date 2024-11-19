part of 'form_element_model.dart';

class RepeatElementModel
    extends CollectionElementModel<List<Map<String, Object?>?>> {
  RepeatElementModel({
    required super.templatePath,
    List<RepeatItemElementModel> elements = const [],
  }) {
    addAll(elements);
  }

  final List<RepeatItemElementModel> _elements = [];

  /// Gets the list of child elements.
  List<RepeatItemElementModel> get elements => List.unmodifiable(_elements);

  @override
  void accept(FormElementVisitor visitor) {
    visitor.visitRepeatSection(this);
  }

  void insert(
    int index,
    RepeatItemElementModel element, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    _elements.insert(index, element);
    element.parent = this;
  }

  /// Insert a new [element] at the end of the RepeatSection.
  void add(
    RepeatItemElementModel element,
  ) {
    addAll([element]);
  }

  /// Appends all [elements] to the end of the RepeatSection.
  void addAll(
    List<RepeatItemElementModel> elements, {
    bool emitEvent = true,
    bool updateParent = true,
  }) {
    _elements.addAll(elements);
    for (final element in elements) {
      element.parent = this;
    }
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
    removedElement.parent = null;

    return removedElement;
  }

  /// Removes all children elements from the repeatSection.
  void clear({bool emitEvent = true, bool updateParent = true}) {
    forEachChild((element) => element.parent = null);
    _elements.clear();
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

  int RepeatItemIndexWhere(bool test(RepeatItemElementModel item),
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

  void forEachChild(
          void Function(FormElementModel<dynamic> element) callback) =>
      _elements.forEach(callback);

  @override
  RepeatElementModel getInstance() =>
      RepeatElementModel(templatePath: templatePath);

  @override
  RepeatElementModel clone(CollectionElementModel<dynamic>? parent) {
    final instance = getInstance();
    instance.parent = parent;
    final elements =
        _elements.map((element) => element.clone(instance)).toList();
    instance.setDependencies(List.from(dependencies));
    instance.addAll(elements);
    return instance;
  }

  @override
  List<AbstractTreeNode> get children => elements;
}
