part of 'form_element.dart';

/// SectionElement is a Form Element representing the
/// father of either a [SectionInstance] element or a [RepeatSection] element
sealed class SectionElement<T> extends FormElementInstance<T> {
  SectionElement({
    required super.template,
    bool expanded = true,
    // super.value,
    // super.parentSection,
    required super.form,
  }) : _expanded = expanded;

  bool _expanded;

  bool get expanded => _expanded;

  // void set expanded(bool expanded) => _expanded = expanded;

  void toggleExpansion() {
    if (expanded) {
      _expanded = false;
    } else {
      _expanded = true;
    }
  }

  FormElementInstance<dynamic> element(String name);

  /// Checks if [SectionElement] contains an element by a given [name].
  ///
  /// Returns true if collection contains the element, otherwise returns false.
  bool contains(String name);

  // T get rawValue => (elementControl as FormControlCollection).rawValue;

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
