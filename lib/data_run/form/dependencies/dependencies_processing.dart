import 'package:collection/collection.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';

Map<T, Set<T>> buildReverseDependencyMap<T>(Map<T, Iterable<T>> dependencyMap) {
  // Invert the dependency graph
  final reverseDependencyMap = <T, Set<T>>{};
  dependencyMap.forEach((element, dependencies) {
    for (var dependency in dependencies) {
      reverseDependencyMap.putIfAbsent(dependency, () => {}).add(element);
    }
  });

  // Compute transitive closure on the reversed graph
  return transitiveClosure(reverseDependencyMap);
}

List<T> topologicalSort<T>(Map<T, Iterable<T>> dependencyMap) {
  final visited = <T>{};
  final List<T> sortedOrder = [];

  void visit(T node) {
    if (!visited.add(node)) return; // Skip already visited nodes
    dependencyMap[node]?.forEach(visit);
    sortedOrder.add(node); // Add node after processing dependencies
  }

  dependencyMap.keys.forEach(visit);
  return sortedOrder.reversed.toList(); // Reverse to get correct order
}

List<T> getTopologicallySortedElements<T>(Map<T, Iterable<T>> dependencyMap) {
  return topologicalSort(dependencyMap);
}

Iterable<TFormElement> dependencyOrderedIterator<TFormElement extends FormElementInstance<dynamic>>(
    Map<TFormElement, Set<TFormElement>> reverseDependencyMap) sync* {

  // Step 1: Sort elements in topological order based on reverse dependencies
  final orderedElements = getTopologicallySortedElements(reverseDependencyMap);

  // Step 2: Yield elements in this topologically sorted order
  for (var element in orderedElements) {
    yield element;
  }
}

void propagateChange<TFormElement extends FormElementInstance<dynamic>>(
    TFormElement changedElement, Map<TFormElement, Set<TFormElement>> reverseDependencyMap) {

  final affectedElements = reverseDependencyMap[changedElement] ?? {};
  final orderedIterator = dependencyOrderedIterator(reverseDependencyMap);

  for (var element in orderedIterator) {
    if (affectedElements.contains(element)) {
      element.evaluate(); // Update element based on its expression, etc.
    }
  }
}


final dependencies = {
  'fieldA': ['fieldB', 'fieldC'],
  'fieldB': ['fieldD'],
  'fieldC': ['fieldD', 'fieldE'],
  'fieldD': [],
  'fieldE': ['fieldF'],
  'fieldF': ['fieldC'],  // This creates a circular dependency for demonstration
};

void main() {

  final reverseDepMap3 = buildReverseDependencyMap(dependencies);
  ///Step 2: Compute the Transitive Closure
  final closure = transitiveClosure(dependencies);
  print(closure);
  // Output: {
  //   'fieldA': {'fieldB', 'fieldC', 'fieldD', 'fieldE', 'fieldF'},
  //   'fieldB': {'fieldD'},
  //   'fieldC': {'fieldD', 'fieldE', 'fieldF'},
  //   'fieldD': {},
  //   'fieldE': {'fieldF', 'fieldC', 'fieldD', 'fieldE'}, // Circular reference
  //   'fieldF': {'fieldC', 'fieldD', 'fieldE'},
  // }

  /// Step 3: Identify Strongly Connected Component
  final scc = stronglyConnectedComponents(dependencies);
  print(scc);
  // Output: [{'fieldA'}, {'fieldB'}, {'fieldD'}, {'fieldE', 'fieldF', 'fieldC'}]

  final sccc= topologicalSort(dependencies);
  print(sccc);

}