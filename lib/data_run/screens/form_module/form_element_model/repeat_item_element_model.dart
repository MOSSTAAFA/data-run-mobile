part of 'form_element_model.dart';

/// A section but it has special processing for name and path, name as the
/// index in the repeated list (it represent a row in a table)
class RepeatItemElementModel extends SectionElementModel {
  RepeatItemElementModel({
    super.templatePath,
    required String uid,
    super.elements,
  }) : _uid = uid;

  @override
  List<Object?> get props => [...super.props, _uid];

  final String _uid;

  String get uid => _uid;

  String get index =>
      '${parent.RepeatItemIndexWhere((section) => section.uid == this.uid)}';

  @override
  String get templatePath => pathBuilder(name);

  Map<String, String> get context => {
        'uid': uid,
        'index': index,
        'parent': parent.path!,
      };

  RepeatElementModel get parent => _parent as RepeatElementModel;

  @override
  String get name => uid;

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
