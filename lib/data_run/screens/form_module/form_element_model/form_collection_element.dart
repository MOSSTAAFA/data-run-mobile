part of 'form_element_model.dart';

/// SectionElement is a Form Element representing the
/// father of either a [SectionElementModel] element or a [RepeatSection] element
sealed class CollectionElementModel<T> extends FormElementModel<T> {
  CollectionElementModel({super.hidden, super.templatePath});

  Iterable<FormElementModel<dynamic>> get elementsList;

  FormElementModel<dynamic> element(String name);

  /// Checks if [CollectionElementModel] contains an element by a given [name].
  ///
  /// Returns true if collection contains the element, otherwise returns false.
  bool contains(String name);

  T get rawValue;

  /// Walks the [path] to find the matching element.
  ///
  /// Returns null if no match is found.
  FormElementModel<dynamic>? findElementInCollection(List<String> path) {
    if (path.isEmpty) {
      return null;
    }

    final result = path.fold<FormElementModel<dynamic>?>(this, (element, name) {
      if (element != null && element is CollectionElementModel<dynamic>) {
        return element.contains(name) ? element.element(name) : null;
      } else {
        return null;
      }
    });

    return result;
  }
}
