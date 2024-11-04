class DependencyManager {
  final Map<String, Set<String>> _dependencies = {};

  void addDependency(String target, String dependency) {
    _dependencies.putIfAbsent(target, () => {}).add(dependency);
  }

  Set<String> getDependents(String field) {
    return _dependencies.entries
        .where((entry) => entry.value.contains(field))
        .map((entry) => entry.key)
        .toSet();
  }
}