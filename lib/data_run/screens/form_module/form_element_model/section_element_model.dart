part of 'form_element_model.dart';

class SectionElementModel extends CollectionElementModel<Map<String, Object?>> {
  SectionElementModel({
    super.templatePath,
    Map<String, FormElementModel<dynamic>> elements = const {},
  }) : assert(!elements.keys.any((name) => name.contains('.')),
            'element name should not contain dot(.)') {
    addAll(elements);
  }

  /// by path
  final Map<String, FormElementModel<dynamic>> _elements = {};

  Map<String, FormElementModel<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  @override
  void accept(FormElementVisitor visitor) {
    visitor.visitSection(this);
  }

  @override
  bool contains(String name) {
    return _elements.containsKey(name);
  }

  @override
  FormElementModel<dynamic> element(String name) {
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
  FormElementModel<dynamic>? findElement(String path) =>
      findElementInCollection(path.split('.'));

  /// Appends all [elements] to the group.
  void addAll(Map<String, FormElementModel<dynamic>> elements) {
    _elements.addAll(elements);
    elements.forEach((name, element) {
      element.parent = this;
    });
  }

  @override
  SectionElementModel getInstance() =>
      SectionElementModel(templatePath: templatePath);

  @override
  SectionElementModel clone(CollectionElementModel<dynamic>? parent) {
    final instance = getInstance();
    instance.parent = parent;
    final elements =
        _elements.map((key, element) => MapEntry(key, element.clone(instance)));
    instance.setDependencies(List.from(dependencies));
    instance.addAll(elements);
    return instance;
  }

  @override
  List<AbstractTreeNode> get children => elements.values.toList();
}
