part of 'form_element_model.dart';

class FieldElementModel<T> extends FormElementModel<T> {
  FieldElementModel({
    required super.templatePath,
    T? value,
    super.hidden,
    super.valid,
    super.dirty,
    bool mandatory = false,
    // required super.id,
  })  : _value = value;

  T? _value;

  @override
  void accept(FormElementVisitor visitor) {
    visitor.visitField(this);
  }

  @override
  void updateValue(T? value,
      {bool updateParent = true, bool emitEvent = true}) {
    if (_value != value) {
      _value = value;
    }
  }

  @override
  bool anyElements(bool Function(FormElementModel<dynamic>) condition) => false;

  @override
  void forEachChild(
          void Function(FormElementModel<dynamic> element) callback) =>
      <FormElementModel<dynamic>>[];

  @override
  FormElementModel<dynamic>? findElement(String path) => this;

  @override
  T? reduceValue() => _value;

  @override
  FieldElementModel<T> clone(CollectionElementModel<dynamic>? parent) {
    final instance = getInstance();
    instance.setDependencies(List.from(dependencies));
    instance.parent = parent;
    return instance;
  }

  @override
  FieldElementModel<T> getInstance() => FieldElementModel(
        templatePath: templatePath,
        // id: id,
        hidden: hidden,
        value: value,
        dirty: dirty,
        valid: valid,
      );
}

class SelectFieldElementModel<T> extends FieldElementModel<T> {
  SelectFieldElementModel({
    // required super.id,
    required super.templatePath,
    super.value,
    super.hidden,
    super.valid,
    super.dirty,
    super.mandatory,
    this.choiceFilter,
    this.listName,
  });

  final ChoiceFilter? choiceFilter;
  final String? listName;
}
