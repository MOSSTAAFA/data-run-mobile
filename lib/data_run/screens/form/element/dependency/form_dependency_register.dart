import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_dependency_register.g.dart';

/// Custom Event Bus:
///
/// - Event Classes: Define event classes to represent different types of events.
/// - EventBus: Create a global event bus to publish and subscribe to events.
@riverpod
FormDependencyRegistry formDependencyRegistry(FormDependencyRegistryRef ref) {
  return FormDependencyRegistry();
}

/// all elements dependencies will be loaded when the form is opened
/// it doesn't know about the type of event
class FormDependencyRegistry {
  final Map<String, FormElementInstance<dynamic>> loadedElements = {};

  void registerElement(String path, dynamic value) {
    loadedElements.putIfAbsent(element.name, () => element);
  }

  /// when an element is disposed or removed
  void unregisterElement(String elementPath) {
    loadedElements.removeWhere(
        (elementPath, element) => elementPath.startsWith(elementPath));
  }
}
