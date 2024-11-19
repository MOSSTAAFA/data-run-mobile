part of 'form_element_model.dart';

class FieldElementModel<T> extends FormElementModel<T> {
  FieldElementModel({
    required super.templatePath,
  });

  @override
  void accept(FormElementVisitor visitor) {
    visitor.visitField(this);
  }

  @override
  FormElementModel<dynamic>? findElement(String path) => this;

  @override
  FieldElementModel<T> clone(CollectionElementModel<dynamic>? parent) {
    final instance = getInstance();
    instance.setDependencies(List.from(dependencies));
    instance.parent = parent;
    return instance;
  }

  @override
  FieldElementModel<T> getInstance() =>
      FieldElementModel(templatePath: templatePath);

  @override
  List<FormElementModel<dynamic>> get children => [];
}

class SelectFieldElementModel<T> extends FieldElementModel<T> {
  SelectFieldElementModel(
      {required super.templatePath, this.choiceFilter, this.listName});

  final ChoiceFilter? choiceFilter;
  final String? listName;
}
