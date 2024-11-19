import 'dart:collection';

/// Returns the [transitive closure][] of [graph].
///
/// [transitive closure]: https://en.wikipedia.org/wiki/Transitive_closure
Map<T, Set<T>> transitiveClosure<T>(Map<T, Iterable<T>> graph) {
  var result = <T, Set<T>>{};
  for (var vertex in graph.keys) {
    result[vertex] = Set<T>.from(graph[vertex] ?? <T>[]);
  }

  for (var k in graph.keys) {
    for (var i in graph.keys) {
      for (var j in graph.keys) {
        if (result[i]!.contains(k) && result[k]!.contains(j)) {
          result[i]!.add(j);
        }
      }
    }
  }

  return result;
}

Map<T, Set<T>> buildReverseDependencyMap<T>(Map<T, Iterable<T>> dependencyMap) {
  final reverseDependencyMap = <T, Set<T>>{};
  for (var element in dependencyMap.keys) {
    for (var dependency in dependencyMap[element] ?? <T>[]) {
      reverseDependencyMap.putIfAbsent(dependency, () => {}).add(element);
    }
  }

  return transitiveClosure(reverseDependencyMap);
}

List<T> topologicalSort<T>(Map<T, Iterable<T>> graph) {
  final result = <T>[];
  final visited = <T>{};
  final temporaryMark = <T>{};

  void visit(T node) {
    if (temporaryMark.contains(node)) {
      // Cycle detected, skip this node
      return;
    }
    if (!visited.contains(node)) {
      temporaryMark.add(node);
      for (var neighbor in graph[node] ?? <T>[]) {
        visit(neighbor);
      }
      visited.add(node);
      temporaryMark.remove(node);
      result.add(node);
    }
  }

  for (var node in graph.keys) {
    if (!visited.contains(node)) {
      visit(node);
    }
  }

  return result.reversed.toList();
}

Iterable<T> propagateChange<T>(
    T changedElement, Map<T, Set<T>> reverseDependencyMap) sync* {
  final queue = Queue<T>();
  final visited = <T>{};
  queue.add(changedElement);

  while (queue.isNotEmpty) {
    final element = queue.removeFirst();
    if (visited.contains(element)) {
      print('Circular dependency detected: $element');
      continue;
    }
    ;
    visited.add(element);

    yield element;

    for (var affected in reverseDependencyMap[element] ?? <T>[]) {
      if (!visited.contains(affected)) {
        queue.add(affected);
      }
    }
  }
}

void main() {
  final dependencies = <String, Set<String>>{
    'warehouse': {'country'},
    'country': {'continent', 'transaction'},
    'continent': {},
    'transaction': {'warehouse', 'country'},
    'fieldE': {'fieldF'},
    'fieldF': {'transaction'},
  };

  final reverseDependencyMap = buildReverseDependencyMap(dependencies);
  final sortedElements = topologicalSort(dependencies);

  print('Topologically sorted elements: $sortedElements');

  print('\nPropagating change for "country":');
  for (var element in propagateChange('country', reverseDependencyMap)) {
    print('Evaluate: $element');
  }
}
