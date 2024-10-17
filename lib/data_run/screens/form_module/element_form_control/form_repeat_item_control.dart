part of 'form_element_control_abstract.dart';

/// A section
class FormRepeatItemControl extends FormSectionControl {
  FormRepeatItemControl({
    required super.elementControl,
    super.path,
    required super.value,
  });

  int get sectionIndex => (parentSection as FormRepeatElement)
      .sectionIndexWhere((section) => section == this);

  @override
  String get name => '$sectionIndex';

  String get pathRecursive {
    if (parentSection == null) {
      throw StateError('RepeatItemInstance\'s Parent should not be null');
    }

    if (!(parentSection is FormRepeatElement)) {
      throw StateError(
          'A RepeatItemInstance\'s Parent can only be a RepeatInstance, parent: ${parentSection.runtimeType}');
    }

    String? parentPath = '${parentSection!.pathRecursive}';
    return '${parentPath}.$sectionIndex';
  }
}
