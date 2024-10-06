// import 'dart:collection';
//
// import 'package:flutter/foundation.dart';
// import 'package:mass_pro/data_run/screens/form/element/dependency/form_event.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'event_manager.g.dart';
//
// @riverpod
// FormEventManager formEventManager(FormEventManagerRef ref) {
//   return FormEventManager();
// }
//
// class FormEventManager {
//   FormEventManager();
//
//   // final Map<String, Set<String>> _dependencyGraph = {};
//   final Map<String, Set<FormElementInstance<dynamic>>> _listeners = {};
//
//   void subscribeAll(
//       FormElementInstance<dynamic> listener, List<String> notifierNames) {
//     for (final notifier in notifierNames) {
//       subscribe(notifier, listener);
//       // _dependencyGraph.putIfAbsent(listener.name, () => Set()).add(notifier);
//     }
//   }
//
//   void subscribe(String notifierName, FormElementInstance<dynamic> listener) {
//     _listeners.putIfAbsent(notifierName, () => Set()).add(listener);
//
//     // to notify elements that might be listening to but was missing
//     notifyCascading(listener);
//   }
//
//   void removeListener(String listenerName) {
//     _listeners.remove(listenerName);
//
//     // Optional: Cascading dependency cleanup,
//     // if _dependencyGraph contains the listener as a notifier for other elements
//     // if (_dependencyGraph.containsKey(listenerName)) {
//     //   for (final notifierOfRemovedListener
//     //       in _dependencyGraph.remove(listenerName)!) {
//     //     _listeners[notifierOfRemovedListener]
//     //         ?.removeWhere((listener) => listener.name == listenerName);
//     //     if (_listeners[notifierOfRemovedListener]!.isEmpty) {
//     //       _listeners.remove(notifierOfRemovedListener);
//     //     }
//     //   }
//     // }
//   }
//
//   // void broadcastMyChange(FormElementInstance<dynamic> changedElement) {
//   //   // contain changedElement as notifier, notify listeners
//   //   if (_listeners.containsKey(changedElement.name)) {
//   //     for (var dependent in _listeners[changedElement.name]!) {
//   //       notifyCascading(dependent.name, dependent.value); // using queue
//   //       // _processField(changedElement); // using sorting
//   //     }
//   //   }
//   // }
//
//   void notifyCascading(FormElementInstance<dynamic> changedSourceElement) {
//     final Queue<String> dependencyQueue = Queue();
//
//     // Start with the changed field
//     dependencyQueue.add(changedSourceElement.name);
//
//     // Process dependencies in a cascading manner
//     while (dependencyQueue.isNotEmpty) {
//       final currentField = dependencyQueue.removeFirst();
//
//       // Notify listeners of the current field
//       _listeners[currentField]?.forEach(
//           (listener) => listener.onDependencyChanged(currentField, value));
//
//       // Add dependent fields to the queue
//       // if (_listeners.containsKey(currentField)) {
//       for (var dependentField in _listeners[currentField] ?? Set()) {
//         dependencyQueue.add(dependentField.name);
//       }
//       // }
//     }
//   }
// }
