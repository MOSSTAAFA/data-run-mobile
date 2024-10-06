// import 'dart:collection';
//
// import 'package:d2_remote/modules/datarun/form/shared/rule/rule.dart';
// import 'package:flutter/foundation.dart';
// import 'package:mass_pro/data_run/form_reactive/rule/dependency_manager.dart';
// import 'package:mass_pro/data_run/form_reactive/rule_elements/dependency_manager.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
//
// /// dependencies
// ///
// class EventDispatcher {
//   EventDispatcher({required this.dependencyManager});
//
//   /// <changed element, dependants>
//   /// dependents: elements having changed field in their expressions
//   final Map<String, ObserverList<FormElementInstance<dynamic>>>
//       dependencyGraph = {};
//   void _buildDependencyGraph() {
//     // Create a directed graph of field dependencies
//     Map<String, Set<String>> dependencyGraph = {};
//     for (var field in form.fields) {
//       dependencyGraph[field.name] = Set<String>();
//       for (var rule in field.rules) {
//         dependencyGraph[field.name]!.addAll(rule.dependencies);
//       }
//       if (field.choiceFilter != null) {
//         dependencyGraph[field.name]!.addAll(field.choiceFilter!.split(' == '));
//       }
//     }
//
//     // Topologically sort the graph to determine processing order
//     List<String> processingOrder = topologicalSort(dependencyGraph);
//
//     // Process fields in the correct order
//     for (var fieldName in processingOrder) {
//       _processField(form.fields.firstWhere((f) => f.name == fieldName));
//     }
//   }
//
//   void addListener(
//     FormElementInstance<dynamic> dependent,
//     List<String> sources,
//   ) {
//     for (final source in sources) {
//       addDependency(source, dependent);
//     }
//   }
//
//   void broadcastMyChange(FormElementInstance<dynamic> changedElement) {
//     if (dependencyGraph.containsKey(changedElement.name)) {
//       for (var dependent in dependencyGraph[changedElement.name]!) {
//         processCascadingDependencies(changedElement); // using queue
//         // _processField(changedElement); // using sorting
//       }
//     }
//   }
//
//   void processCascadingDependencies(FormElementInstance<dynamic> changedElement) {
//     final Queue<String> dependencyQueue = Queue();
//
//     // Start with the changed field
//     dependencyQueue.add(changedElement.name);
//
//     // Process dependencies in a cascading manner
//     while (dependencyQueue.isNotEmpty) {
//       final currentField = dependencyQueue.removeFirst();
//
//       // Notify listeners of the current field
//       dependencyGraph[currentField]?.forEach(
//               (dependant) => _processField(dependant));
//
//
//       // Add dependent fields to the queue
//       if (dependencyGraph.containsKey(currentField)) {
//         for (var dependentField in dependencyGraph[currentField]!) {
//           dependencyQueue.add(dependentField);
//         }
//       }
//     }
//   }
//
//   void _processField(FormElementInstance<dynamic> field) {
//     // Evaluate rules and apply actions
//     for (var rule in field.rules) {
//       if (_evaluateRule(rule)) {
//         _applyAction(rule);
//       }
//     }
//
//     // Apply choice filter and update options
//     if (field.choiceFilter != null) {
//       _applyChoiceFilter(field);
//     }
//   }
//
//   bool _evaluateRule(Rule rule) {
//     // Implement rule evaluation logic here
//     // ...
//     return true; // Placeholder
//   }
//
//   void _applyAction(Rule rule) {
//     // Implement action application logic here
//     // ...
//   }
//
//   void _applyChoiceFilter(FormField field) {
//     // Implement choice filter application logic here
//     // ...
//   }
// }
//
