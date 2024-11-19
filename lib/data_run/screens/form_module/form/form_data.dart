import 'package:datarun/data_run/form/dependencies/dependencies_processing.dart';
import 'package:datarun/data_run/screens/form_module/form_builder/form_dependency_manager.dart';
import 'package:datarun/data_run/screens/form_module/form_element_model/form_element_model.dart';
import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';

class FormData {
  FormData({
    required this.formFlatTemplate,
    required this.formDependencyManager,
    Map<String, dynamic> formValueMap = const {},
  }) {
    _formValueMap.addAll(formValueMap);
    formDependencyManager.initializeGraph(formFlatTemplate);
  }

  final FormFlatTemplate formFlatTemplate;
  final FormDependencyManager formDependencyManager;
  final Map<String, dynamic> _formValueMap = {};

  Map<String, dynamic> get formValueMap => Map.unmodifiable(_formValueMap);

  Map<String, List<String>> buildReverseDependencyMap(
      List<FormElementModel<dynamic>> elements) {
    final Map<String, List<String>> dependencyGraph = {};
    for (var element in elements) {
      for (var dependency in element.dependencies) {
        dependencyGraph.putIfAbsent(dependency, () => []).add(element.path!);
      }
    }
    return dependencyGraph;
  }

  // void removeElement(String elementId) {
  //   var element = formElementCache.getElementById(elementId);
  //   if (element == null) return;
  //
  //   // Remove from parent's children list
  //   if (element.parent != null && element.parent is RepeatElementModel) {
  //     (element.parent as RepeatElementModel)
  //         .remove(element as RepeatItemElementModel);
  //   }
  //
  //   // Recursively remove from cache
  //   void removeFromCache(FormElementModel<dynamic> element) {
  //     formElementCache.removeFromCache(element);
  //   }
  //
  //   removeFromCache(element);
  //   final dependents = dependencyGraph[elementId] ?? [];
  //   propagateChange(element.name, dependencyGraph);
  //   // Handle dependencies (e.g., notify or update dependent elements)
  // }
  //
  // Iterable<TFormElement>
  //     dependencyOrderedIterator<TFormElement extends FormElementModel<dynamic>>(
  //         Map<TFormElement, Set<TFormElement>> reverseDependencyMap) sync* {
  //   // Step 1: Sort elements in topological order based on reverse dependencies
  //   final orderedElements =
  //       getTopologicallySortedElements(reverseDependencyMap);
  //
  //   // Step 2: Yield elements in this topologically sorted order
  //   for (var element in orderedElements) {
  //     yield element;
  //   }
  // }

// void propagateChange<TFormElement extends FormElementModel<dynamic>>(
//     TFormElement changedElement,
//     Map<TFormElement, Set<TFormElement>> reverseDependencyMap) {
//   final affectedElements = reverseDependencyMap[changedElement] ?? {};
//   final orderedIterator = dependencyOrderedIterator(reverseDependencyMap);
//
//   for (var element in orderedIterator) {
//     if (affectedElements.contains(element)) {
//       for (final affectedElement in affectedElements) {}
//       element.evaluate(changedElement, changedElement.value);
//     }
//   }
// }

// void updateElement(FormElementCache cache, FormElementModel<dynamic> updatedElement) {
//   // Update the element in the cache
//   cache.addElement(updatedElement);
//
//   // Handle dependencies
//   for (var dependency in updatedElement.dependencies) {
//     var dependentElement = cache.getElementById(dependency);
//     if (dependentElement != null) {
//       // Update dependent element based on new data
//       // This can include re-evaluating conditions or recalculating values
//       // dependentElement.updateBasedOnDependency(updatedElement);
//     }
//   }
// }
}
