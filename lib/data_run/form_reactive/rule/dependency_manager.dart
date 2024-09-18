class DependencyManager {
  final Map<String, Set<String>> _dependencies = {};

  Map<String, Set<String>> get dependencies =>
      Map<String, Set<String>>.unmodifiable(_dependencies);

  void addDependency(String fieldPath, String dependencyPath) {
    if (!_dependencies.containsKey(fieldPath)) {
      _dependencies[fieldPath] = <String>{};
    }
    _dependencies[fieldPath]?.add(dependencyPath);
  }

  Set<String>? getDependencies(String fieldPath) {
    return _dependencies[fieldPath];
  }
}
