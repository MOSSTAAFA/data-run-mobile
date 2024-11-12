part of 'form_element_model.dart';

/// A section
class RepeatItemElementModel extends SectionElementModel {
  RepeatItemElementModel(
      {
      super.hidden,
      super.elements,
      required super.templatePath});

  int get sectionIndex => (parent as RepeatElementModel)
      .sectionIndexWhere((section) => section == this);

  @override
  String get name => '$sectionIndex';

  set parent(FormElementModel<Object>? parent) {
    if (parent is! RepeatElementModel) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parent.runtimeType}');
    }

    _parent = parent;
  }

  String pathBuilder(String? pathItem) {
    if (parent == null) {
      throw StateError('RepeatItemInstance\'s Parent should not be null');
    }

    if (!(parent is RepeatElementModel)) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parent.runtimeType}');
    }

    return [parent!.elementPath, pathItem].whereType<String>().join('.');
  }

  @override
  RepeatItemElementModel clone() {
    final result = RepeatItemElementModel(
        hidden: hidden,
        // value: value,
        // dirty: dirty,
        // valid: valid,
        templatePath: templatePath,
        elements:
            _elements.map((key, element) => MapEntry(key, element.clone())));
    result.setDependencies(List.from(dependencies));

    if (dirty && !hidden) {
      result.markAsDirty();
    }

    result.parent = parent;
    return result;
  }
}
