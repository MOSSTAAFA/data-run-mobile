part of 'form_element.dart';

/// A section
class RepeatItemInstance extends SectionInstance {
  RepeatItemInstance(
      {required super.template,
      required super.form,
      super.elements,
      String? uid,
      this.selected = false})
      : _uid = uid;

  bool selected;

  String? _uid;

  String? get uid => _uid;

  void setUid(String value) {
    if (_uid != null) {
      throw StateError('A RepeatItemInstance\'s uid cannot be changed');
    }
    _uid = value;
  }

  int get sectionIndex => (parentSection as RepeatInstance)
      .sectionIndexWhere((section) => section == this);

  @override
  String get name => '$sectionIndex';

  set parentSection(SectionElement<dynamic>? parent) {
    if (parent is! RepeatInstance?) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parent.runtimeType}');
    }

    _parentSection = parent;
  }

  String pathBuilder(String pathItem) {
    if (parentSection == null) {
      throw StateError('RepeatItemInstance\'s Parent should not be null');
    }

    return [parentSection?.elementPath, pathItem].whereType<String>().join('.');
  }
}
