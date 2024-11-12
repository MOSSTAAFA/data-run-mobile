import 'package:datarun/data_run/screens/form_module/form_element_model/form_element_model.dart';

class FormData {
  FormData({
    Map<String, FormElementModel<dynamic>> formElementsMap = const {},
    Map<String, Object> validations = const {},
    Map<String, List<String>> dependencyGraph = const {},
    required this.form,
  }) {
    _formElementsMap.addAll(formElementsMap);
    _validationMessages.addAll(validations);
    _dependencyGraph.addAll(dependencyGraph);
  }

  final FormElementModel<dynamic> form;
  final Map<String, FormElementModel<dynamic>> _formElementsMap = {};
  final Map<String, Object> _validationMessages = {};

  /// For Selective Validation: to validate only elements directly
  /// affected by a change. This is where we access the precomputed
  /// paths and dependency graph to avoid traversing unrelated nodes.
  final Map<String, List<String>> _dependencyGraph = {}; // Dependency mappings
  Map<String, List<String>> get dependencyGraph =>
      Map.unmodifiable(_dependencyGraph); // Dependency mappings

  void addDependency(String elementId, String dependencyId) {
    _dependencyGraph.putIfAbsent(dependencyId, () => []).add(elementId);
  }

  Map<String, FormElementModel<dynamic>> get formElementsMap =>
      Map.unmodifiable(_formElementsMap);

  Map<String, Object> get validationMessages =>
      Map.unmodifiable(_validationMessages);

  void setValidationMessages(Map<String, Object> validationMessages) {
    _validationMessages.clear();
    _validationMessages.addAll(validationMessages);
  }

  void addElement(FormElementModel<dynamic> element) {
    _formElementsMap[element.pathRecursive] = element;
  }

  void removeElement(String key) {
    _formElementsMap.remove(key);
  }
}

class FormDependencyGraph {
  final Map<String, List<String>> _dependencyGraph = {}; // Dependency mappings
  Map<String, List<String>> get dependencyGraph =>
      Map.unmodifiable(_dependencyGraph);

  void addDependency(String elementId, String dependencyId) {
    dependencyGraph.putIfAbsent(dependencyId, () => []).add(elementId);
  }

  Map<String, List<String>> buildDependencies(
      List<FormElementModel<dynamic>> elements) {
    final Map<String, List<String>> dependencyGraph = {};
    for (var element in elements) {
      for (var dependency in element.dependencies) {
        dependencyGraph
            .putIfAbsent(dependency, () => [])
            .add(element.elementPath);
      }
    }
    return dependencyGraph;
  }
}
