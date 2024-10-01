import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dependency_resolver.g.dart';

@riverpod
DependencyResolver dependencyResolver(DependencyResolverRef ref) {
  return DependencyResolver();
}

class DependencyResolver {
  Map<String, List<FormElementInstance<dynamic>>> _pendingDependencies = {};

  void registerDependencyDeferred(
      FormElementInstance<dynamic> dependent, List<String> dependenciesNames) {
    for (final dependencyName in dependenciesNames) {
      final dependency = dependent.findElementInParentSection(dependencyName);
      if (dependency != null) {
        dependency.addDependent(dependent);
        dependent.addDependency(dependency);
      } else {
        _pendingDependencies
            .putIfAbsent(dependencyName, () => [])
            .add(dependent);
      }
    }
  }

  void resolvePendingDependencies() {
    _pendingDependencies.forEach((dependencyName, dependents) {
      dependents.removeWhere((dependent) {
        final dependency = dependent.findElementInParentSection(dependencyName);
        if (dependency != null) {
          dependent.addDependency(dependency);
          return true;
        }
        return false;
      });
    });
  }
}
