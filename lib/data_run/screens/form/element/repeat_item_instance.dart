part of 'form_element.dart';

/// A section
class RepeatItemInstance extends SectionInstance {
  RepeatItemInstance(
      {required super.template,
      required super.form,
      // required super.path,
      // required super.formValueMap,
      super.elements});

  int get sectionIndex => (parentSection as RepeatInstance)
      .sectionIndexWhere((section) => section == this);

  @override
  String get name => '$sectionIndex';

  set parentSection(FormElementInstance<Object>? parent) {
    if (parent is! RepeatInstance?) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parent.runtimeType}');
    }

    _parentSection = parent;
  }

  String pathBuilder(String? pathItem) {
    if (parentSection == null) {
      throw StateError('RepeatItemInstance\'s Parent should not be null');
    }

    return [parentSection!.elementPath, pathItem].whereType<String>().join('.');
  }
}
