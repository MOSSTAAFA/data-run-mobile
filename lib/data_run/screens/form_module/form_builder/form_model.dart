import 'package:datarun/data_run/screens/form_module/form_element_model/form_element_model.dart';

class FormModel {
  /// full list of form elements, for elements can be one of [FieldElementModel],
  /// [SectionElementModel], [RepeatElementModel], or [RepeatItemElementModel]
  List<FormElementModel<dynamic>> elements = [];

  /// For Selective Validation: to validate only elements directly
  /// affected by a change. This is where we access the precomputed
  /// paths and dependency graph to avoid traversing unrelated nodes.
  Map<String, List<String>> dependencyGraph = {}; // Dependency mappings

  void addDependency(String elementId, String dependencyId) {
    dependencyGraph.putIfAbsent(dependencyId, () => []).add(elementId);
  }

  void buildDependencies() {
    for (var element in elements) {
      for (var dependency in element.dependencies) {
        addDependency(element.elementPath, dependency);
      }
    }
  }
}
