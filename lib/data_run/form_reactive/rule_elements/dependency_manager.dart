import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';

/// dependencies
///
class DependencyManager {
  /// <changed field, (element) register me to it>
  final Map<String, List<FormElementInstance<dynamic>>> dependencyGraph = {};

  void addMeAsDependant(
    FormElementInstance<dynamic> dependent,
    List<String> sources,
  ) {
    for (final source in sources) {
      dependencyGraph.putIfAbsent(source, () => []).add(dependent);
    }
  }

  void addDependency(String source, FormElementInstance<dynamic> dependent) {
    dependencyGraph.putIfAbsent(source, () => []).add(dependent);
  }

  void notifyDependentsOfMyChange(FormElementInstance<dynamic> me) {
    if (dependencyGraph.containsKey(me.name)) {
      for (var dependent in dependencyGraph[me]!) {
        // dependent.evaluateRules();
      }
    }
  }
}

class EventManager {
  final Map<String, List<String>> dependencyGraph = {};
  final Map<String, ObserverList<Function>> _listeners = {};

  // Register listener for a control
  void registerListener(String control, Function callback) {
    _listeners.putIfAbsent(control, () => ObserverList()).add(callback);
  }

  // // void notify(Event event, dynamic data)
  // // Broadcast event to all listeners
  // void broadcast(FormEvent event) {
  //   if (_listeners[event.source] != null) {
  //     for (var listener in _listeners[event.source]!) {
  //       listener(event);
  //     }
  //   }
  // }
  //
  // void notify(FormEvent event, {List<String> targetListeners = const []}) {
  //   for (var controlName in targetListeners) {
  //     if (_listeners[controlName] != null) {
  //       for (var listener in _listeners[controlName]!) {
  //         listener(event);
  //       }
  //     }
  //   }
  // }

  void processCascadingDependencies(String field, dynamic newValue) {
    final dependencyQueue = Queue<String>.from([]);

    // Start with the changed field
    dependencyQueue.add(field);

    // Process dependencies in a cascading manner
    while (dependencyQueue.isNotEmpty) {
      final currentField = dependencyQueue.removeFirst();

      // Notify listeners of the current field
      _listeners[currentField]?.forEach((callback) => callback(newValue));

      // Add dependent fields to the queue
      if (dependencyGraph.containsKey(currentField)) {
        for (var dependentField in dependencyGraph[currentField]!) {
          dependencyQueue.add(dependentField);
        }
      }
    }
  }
}
