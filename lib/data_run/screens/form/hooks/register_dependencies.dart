import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';

void useRegisterDependencies(FormElementInstance<dynamic> element) {
  final resolvedDependencies = useMemoized(() {
    final List<FormElementInstance<dynamic>> resolved = [];
    final List<String> unresolved = [];

    for (final dependencyName in element.requiredDependencies) {
      final dependency = element.findElementInParentSection(dependencyName);
      if (dependency != null) {
        resolved.add(dependency);
      } else {
        unresolved.add(dependencyName);
      }
    }

    if (unresolved.isNotEmpty) {
      element.setUnresolvedDependencies(unresolved);
    }
    return resolved;
  }, [element.requiredDependencies]);

  useEffect(() {
    for (final dependency in resolvedDependencies) {
      element.registerDependency(dependency);
    }
  }, [resolvedDependencies]);
}
