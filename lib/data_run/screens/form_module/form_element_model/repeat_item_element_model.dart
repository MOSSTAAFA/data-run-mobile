part of 'form_element_model.dart';

/// A section but it has special processing for name and path, name as the
/// index in the repeated list (it represent a row in a table)
class RepeatItemElementModel extends SectionElementModel {
  RepeatItemElementModel({
    required super.templatePath,
    // required super.id,
    super.hidden,
    super.elements,
    required String uid,
  }) : _uid = uid;

  @override
  List<Object?> get props => [...super.props, _uid];

  final String _uid;

  String get uid => _uid;

  int get sectionIndex => (parent as RepeatElementModel)
      .RepeatItemIndexWhere((section) => section.uid == this.uid);

  @override
  String get name => '$sectionIndex';

  @override
  void accept(FormElementVisitor visitor) {
    visitor.visitRepeatItem(this);
  }

  set parent(CollectionElementModel<dynamic>? parent) {
    if (parent is! RepeatElementModel) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parent.runtimeType}');
    }

    _parent = parent;
  }

  String? get path {
    if (parent is! RepeatElementModel) {
      throw StateError(
          'RepeatItemInstance\'s Parent should not be null, and can only be a RepeatElementModel, parent: ${parent.runtimeType}');
    }

    return pathBuilder(name);
  }

  @override
  RepeatItemElementModel getInstance() => RepeatItemElementModel(
      templatePath: templatePath, uid: CodeGenerator.generateCompositeUid());

  @override
  RepeatItemElementModel clone(CollectionElementModel<dynamic>? parent) {
    final instance = getInstance();
    instance.parent = parent;
    final elements =
        _elements.map((key, element) => MapEntry(key, element.clone(instance)));
    instance.setDependencies(List.from(dependencies));
    instance.addAll(elements);
    return instance;
  }
}
