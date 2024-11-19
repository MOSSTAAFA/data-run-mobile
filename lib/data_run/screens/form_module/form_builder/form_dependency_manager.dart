import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:datarun/data_run/screens/form_module/form_template/template_extension.dart';
import 'package:datarun/data_run/form/processing_dependencies.dart';

class FormDependencyManager {
  late Map<String, List<String>> _dependencyGraph;
  late Map<String, Set<String>> _reverseDependencyGraph;
  late List<String> _sortedElementPaths;

  void initializeGraph(FormFlatTemplate formFlatTemplate) {
    _dependencyGraph = formFlatTemplate.flatFields.map(
        (path, FormElementTemplate field) =>
            MapEntry(path, _buildDependencyGraph(field, formFlatTemplate)));

    _reverseDependencyGraph = buildReverseDependencyMap(_dependencyGraph);
    _sortedElementPaths = topologicalSort(_dependencyGraph);
  }

  List<String> _buildDependencyGraph(
      FormElementTemplate element, FormFlatTemplate flatTemplate) {
    final dependenciesPaths = <String>[];
    for (var dependency in element.dependencies) {
      final dependencyPath =
          flatTemplate.getScopedDependencyByName(dependency, element.path!);
      if (dependencyPath != null) {
        dependenciesPaths.add(dependencyPath.path!);
      }
    }
    return dependenciesPaths;
  }

  // void updateElement(String elementPath, List<String> newDependencies) {
  //   // Update the dependency graph
  //   dependencyGraph[elementPath] = newDependencies;
  //
  //   // Update the reverse dependency graph
  //   for (var dep in newDependencies) {
  //     reverseDependencyGraph.putIfAbsent(dep, () => {}).add(elementPath);
  //   }
  //
  //   // Re-sort if necessary
  //   // Note: For efficiency, you might want to check if re-sorting is actually needed
  //   sortedElementPaths = _dependencyBuilder.topologicalSort(dependencyGraph);
  // }


  /// returns an Iterator of affected elements paths
  Iterable<String> propagateElementChange(String elementPath) {
    return propagateChange('country', _reverseDependencyGraph);
  }
}
