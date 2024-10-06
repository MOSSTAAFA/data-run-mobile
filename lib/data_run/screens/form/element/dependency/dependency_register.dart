import 'dart:collection';

import 'package:mass_pro/data_run/screens/form/element/form_element.dart';

class DependencyRegistry {
  Map<String, Set<FormElementInstance<dynamic>>> elementListeners = {};
  Map<String, Set<FormElementInstance<dynamic>>> elementNotifiers = {};

  final Map<String, FormElementInstance<dynamic>> _registeredNotifiers = {};
  final Map<String, List<FormElementInstance<dynamic>>> _pendingListeners = {};

  // Register a notifier and resolve any pending listeners waiting for it
  void registerNotifier(String name, FormElementInstance<dynamic> element) {
    _registeredNotifiers[name] = element;

    if (_pendingListeners.containsKey(name)) {
      for (var listener in _pendingListeners[name]!) {
        listener.addNotifier(element);
        listener.onDependencyChanged(name, element.value);
      }
      _pendingListeners.remove(name); // Clean up after resolving
    }
  }

  // Add a listener that depends on a notifier that may not yet be registered
  void addPendingListener(String dependencyName, FormElementInstance<dynamic> listener) {
    if (_registeredNotifiers.containsKey(dependencyName)) {
      // If notifier is already available, register it immediately
      elementNotifiers.putIfAbsent(dependencyName, () => {}).add(listener);

    } else {
      // Otherwise, track this listener as pending
      _pendingListeners.putIfAbsent(dependencyName, () => []).add(listener);
    }
  }

  // Unregister a notifier
  void unregisterNotifier(String name) {
    _registeredNotifiers.remove(name);
    _pendingListeners.remove(name); // Clean up any unresolved dependencies related to this notifier
  }

  void notifyChange(String changedElementName, dynamic value) {
    if (elementListeners.containsKey(changedElementName)) {
      for (var listener in elementListeners[changedElementName]!) {
        listener.onDependencyChanged(changedElementName, value);
      }
    }
  }

  void deregisterElement(FormElementInstance<dynamic> element) {
    element.requiredNotifiersNames.forEach((notifierName) {
      elementNotifiers[notifierName]?.remove(element);
      unregisterNotifier(notifierName);
    });
  }
}

class DependencyRegistry2 {
  Map<String, Set<FormElementInstance<dynamic>>> elementListeners = {};
  Map<String, Set<FormElementInstance<dynamic>>> elementNotifiers = {};

  /// Register element and track its notifiers
  void registerElement(FormElementInstance<dynamic> element) {
    element.requiredNotifiersNames.forEach((notifierName) {
      elementNotifiers.putIfAbsent(notifierName, () => {}).add(element);
    });

    // Register listeners if the element itself is a notifier for others
    if (elementListeners.containsKey(element.name)) {
      for (var listener in elementListeners[element.name]!) {
        // listener.onNotifierAvailable(element);
        listener.onDependencyChanged(element.name, element.value);
      }
    }
  }

  /// Notify listeners when an element changes
  void notifyChange(String elementName, dynamic value) {
    if (elementListeners.containsKey(elementName)) {
      for (var listener in elementListeners[elementName]!) {
        listener.onDependencyChanged(elementName, value);
      }
    }
  }

  /// De-register an element and clean up its listeners/notifiers
  void deregisterElement(FormElementInstance<dynamic> element) {
    element.requiredNotifiersNames.forEach((notifierName) {
      elementNotifiers[notifierName]?.remove(element);
    });
    elementListeners.remove(element.name);
  }

  // void removeListener(String listenerName) {
  //   elementListeners.remove(listenerName);
  //
  //   // Optional: Cascading dependency cleanup,
  //   // if _dependencyGraph contains the listener as a notifier for other elements
  //   if (_dependencyGraph.containsKey(listenerName)) {
  //     for (final notifierOfRemovedListener
  //     in _dependencyGraph.remove(listenerName)!) {
  //       _listeners[notifierOfRemovedListener]
  //           ?.removeWhere((listener) => listener.name == listenerName);
  //       if (_listeners[notifierOfRemovedListener]!.isEmpty) {
  //         _listeners.remove(notifierOfRemovedListener);
  //       }
  //     }
  //   }
  // }

  /// Handle deferred registration when dependencies are not yet available
  void addDeferredListener(String notifierName, FormElementInstance<dynamic> listener) {
    elementListeners.putIfAbsent(notifierName, () => {}).add(listener);
  }
  //   void deregisterElement(FormElementInstance<dynamic> element) {
//     element.requiredNotifiersNames.forEach((notifierName) {
//       elementNotifiers[notifierName]?.remove(element);
//       unregisterNotifier(notifierName);
//     });
//   }

}
