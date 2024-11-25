part of 'form_element.dart';

/// SectionElement is a Form Element representing the
/// father of either a [SectionInstance] element or a [RepeatSection] element
sealed class SectionElement<T> extends FormElementInstance<T> {
  SectionElement({required super.template, required super.form})
      : super(elementState: FormElementState(mandatory: template.mandatory));

  FormElementInstance<dynamic> element(String name);

  /// Checks if [SectionElement] contains an element by a given [name].
  ///
  /// Returns true if collection contains the element, otherwise returns false.
  bool contains(String name);

  /// Walks the [path] to find the matching element.
  ///
  /// Returns null if no match is found.
  FormElementInstance<dynamic>? findElementInCollection(List<String> path) {
    if (path.isEmpty) {
      return null;
    }

    final result =
        path.fold<FormElementInstance<dynamic>?>(this, (element, name) {
      if (element != null && element is SectionElement<dynamic>) {
        return element.contains(name) ? element.element(name) : null;
      } else {
        return null;
      }
    });

    return result;
  }
}
