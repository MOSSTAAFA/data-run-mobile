part of 'form_element.dart';

/// A section
class RepeatItemInstance extends SectionInstance {
  RepeatItemInstance({
    required super.template,
    required super.form,
    super.elements,
    super.expanded,
  });

  int get sectionIndex => (parentSection as RepeatInstance)
      .sectionIndexWhere((section) => section == this);

  @override
  String get name => '$sectionIndex';

  String get pathRecursive {
    if (parentSection == null) {
      throw StateError('RepeatItemInstance\'s Parent should not be null');
    }

    if (!(parentSection is RepeatInstance)) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parentSection.runtimeType}');
    }

    String? parentPath = '${parentSection!.pathRecursive}';
    return '${parentPath}.$sectionIndex';
  }
}
