part of 'form_element.dart';
/// SectionElement is a Form Element representing the
/// father of either a [FormSectionElement] element or a [RepeatSection] element
sealed class FormCollectionElement<T> extends FormElementInstance<T> {
  FormCollectionElement({
    required super.name,
    super.hidden,
    super.mandatory
  });

  FormElementInstance<dynamic> element(String name);

  /// Checks if [FormCollectionElement] contains an element by a given [name].
  ///
  /// Returns true if collection contains the element, otherwise returns false.
  bool contains(String name);

  T get rawValue;

  /// Walks the [path] to find the matching element.
  ///
  /// Returns null if no match is found.
  FormElementInstance<dynamic>? findElementInCollection(List<String> path) {
    if (path.isEmpty) {
      return null;
    }

    final result =
    path.fold<FormElementInstance<dynamic>?>(this, (element, name) {
      if (element != null && element is FormCollectionElement<dynamic>) {
        return element.contains(name) ? element.element(name) : null;
      } else {
        return null;
      }
    });

    return result;
  }
}