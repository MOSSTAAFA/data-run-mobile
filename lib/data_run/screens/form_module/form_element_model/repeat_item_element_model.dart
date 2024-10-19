part of 'form_element_model.dart';
/// A section
class RepeatItemElementModel extends SectionElementModel {
  RepeatItemElementModel({
    required super.name,
    super.path,
    super.hidden,
    super.mandatory,
    super.elements
  });

  int get sectionIndex => (parentSection as RepeatElementModel)
      .sectionIndexWhere((section) => section == this);

  @override
  String get name => '$sectionIndex';

  set parentSection(FormElementModel<Object>? parent) {
    if (parent is! RepeatElementModel) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parent.runtimeType}');
    }

    _parentSection = parent;
  }

  String pathBuilder(String? pathItem) {
    if (parentSection == null) {
      throw StateError('RepeatItemInstance\'s Parent should not be null');
    }

    if (!(parentSection is RepeatElementModel)) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parentSection.runtimeType}');
    }

   return [parentSection!.elementPath, pathItem]
        .whereType<String>()
        .join('.');
  }
}
