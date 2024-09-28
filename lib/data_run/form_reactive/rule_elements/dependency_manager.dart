import 'package:mass_pro/data_run/screens/form/model/element/form_element.dart';

/// dependencies
///
class DependencyManager {
  final Map<String, List<FormElementInstance<dynamic>>> _dependencyMap = {};

  void addDependency(String source,
      FormElementInstance<dynamic> dependent) {
    _dependencyMap.putIfAbsent(source, () => []).add(dependent);
  }

  void notifyDependents(FormElementInstance<dynamic> element) {
    if (_dependencyMap.containsKey(element.name)) {
      for (var dependent in _dependencyMap[element]!) {
        // dependent.evaluateRules();
      }
    }
  }
}