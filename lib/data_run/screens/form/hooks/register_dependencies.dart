import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';

void useRegisterDependencies(FormElementInstance<dynamic> element) {
  final resolvedDependencies = useMemoized(() {
    return element.requiredDependencies
        .map((name) => element.findDependency(name))
        .toList();
  }, [element.requiredDependencies]);

  useEffect(() {
    for (final dependency in resolvedDependencies) {
      if (dependency != null) {
        element.addDependency(dependency);
        dependency.addDependent(element);
      }
    }
  }, [resolvedDependencies]);
}
