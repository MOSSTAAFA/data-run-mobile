// import 'dart:collection';
//
// import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
// import 'package:d2_remote/modules/datarun/form/shared/rule_action.dart';
// import 'package:expressions/expressions.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// part 'form_model.freezed.dart';
//
// @freezed
// class FormEvent with _$FormEvent {
//   const factory FormEvent.valueChange(String source, {dynamic value}) =
//       ValueChange;
//
//   const factory FormEvent.controlReset(String source) = ControlReset;
//
//   const factory FormEvent.ruleEvaluate(String source,
//       {EvaluationAction? action}) = RuleEvaluate;
// }
//
// @freezed
// class EvaluationAction with _$EvaluationAction {
//   const factory EvaluationAction.assignValue(String path, {dynamic value}) =
//       AssignValue;
//
//   const factory EvaluationAction.markAsPending(String path) = MarkAsPending;
//
//   const factory EvaluationAction.markAsHidden(String path) = MarkAsHidden;
//
//   const factory EvaluationAction.markAsVisible(String path) = MarkAsVisible;
//
//   const factory EvaluationAction.markAsMandatory(String path) = MarkAsMandatory;
//
//   const factory EvaluationAction.markAsOptional(String path) = MarkAsOptional;
//
//   const factory EvaluationAction.setError(String path,
//       {Map<String, String>? errorMessage}) = SetError;
//
//   const factory EvaluationAction.stopRepeat(String path) = StopRepeat;
//
//   const factory EvaluationAction.setCount(String path) = SetCount;
//
//   const factory EvaluationAction.showHideOptions(String path,
//       {@Default(const []) List<String> optionsToShow,
//       @Default(const []) List<String> optionsToHide}) = ShowHideOptions;
// }
//
// class EventManager {
//   final Map<String, List<String>> _fieldDependencies = {};
//   final Map<String, ObserverList<Function>> _listeners = {};
//
//   void subscribe(FormEvent event, void Function(dynamic) listener) {
//     _listeners.putIfAbsent(event.source, () => ObserverList()).add(listener);
//   }
//
//   void unsubscribeListeners(String control) {
//     _listeners.remove(control);
//   }
//
//   // Register listener for a control
//   void registerListener(String control, Function callback) {
//     _listeners.putIfAbsent(control, () => ObserverList()).add(callback);
//   }
//
//   // void notify(Event event, dynamic data)
//   // Broadcast event to all listeners
//   void broadcast(FormEvent event) {
//     if (_listeners[event.source] != null) {
//       for (var listener in _listeners[event.source]!) {
//         listener(event);
//       }
//     }
//   }
//
//   void notify(FormEvent event, {List<String> targetListeners = const []}) {
//     for (var controlName in targetListeners) {
//       if (_listeners[controlName] != null) {
//         for (var listener in _listeners[controlName]!) {
//           listener(event);
//         }
//       }
//     }
//   }
//
//   void processCascadingDependencies(String field, dynamic newValue) {
//     final Queue<String> dependencyQueue = Queue();
//
//     // Start with the changed field
//     dependencyQueue.add(field);
//
//     // Process dependencies in a cascading manner
//     while (dependencyQueue.isNotEmpty) {
//       final currentField = dependencyQueue.removeFirst();
//
//       // Notify listeners of the current field
//       _listeners[currentField]?.forEach((callback) => callback(newValue));
//
//       // Add dependent fields to the queue
//       if (dependencyGraph.containsKey(currentField)) {
//         for (var dependentField in dependencyGraph[currentField]!) {
//           dependencyQueue.add(dependentField);
//         }
//       }
//     }
//   }
// }
//
// class FormDependencyManager {
//   FormDependencyManager(
//       {required String fieldName, List<Rule> rules = const []})
//       : _fieldName = fieldName {
//     _rules.clear();
//     _rules.addAll(rules);
//
//     final dependenciesMap = Map<String, List<String>>.fromIterable(_rules,
//         key: (rule) => rule.field, value: (rule) => rule.dependencies);
//     final _rul = Map.fromIterable(_rules,
//         key: (rule) => rule.field, value: (rule) => rule.dependencies);
//
//     _dependenciesMap.clear();
//     _dependenciesMap.addAll(dependenciesMap);
//
//     for (final dependency in _dependenciesMap) {
//       final event =
//           FormEvent.valueChange(dependency, value: EventType.ValueChanged);
//       _eventManager.subscribe(event, (value) {
//         onNotify(value);
//       });
//     }
//   }
//
//   final String _fieldName;
//   final List<Rule> _rules = [];
//   final Map<String, List<String>> _rulesMap = {};
//   final Map<String, List<String>> _dependenciesMap = {};
// }
//
// class EvaluationHandler {
//   EvaluationHandler(
//       {required String fieldName,
//       required EventManager eventManager,
//       List<Rule> rules = const [],
//       required this.formGroup,
//       required ExpressionEvaluator evaluator})
//       : _evaluator = evaluator,
//         _eventManager = eventManager,
//         _fieldName = fieldName {
//     _rules.clear();
//     _rules.addAll(rules);
//
//     final dependenciesMap = Map.fromIterable(_rules,
//         key: (rule) => rule.field, value: (rule) => rule.dependencies);
//     final _rul = Map.fromIterable(_rules,
//         key: (rule) => rule.field, value: (rule) => rule.dependencies);
//
//     _dependenciesMap.clear();
//     _dependenciesMap.addAll(dependenciesMap);
//
//     for (final dependency in _dependenciesMap) {
//       final event =
//           FormEvent.valueChange(dependency, value: EventType.ValueChanged);
//       _eventManager.subscribe(event, (value) {
//         onNotify(value);
//       });
//     }
//   }
//
//   final String _fieldName;
//   final EventManager _eventManager;
//   final List<Rule> _rules = [];
//   final Map<String, List<String>> _rulesMap = {};
//   final Map<String, List<String>> _dependenciesMap = {};
//   final FormGroup formGroup;
//   final ExpressionEvaluator _evaluator;
//
//   void onNotify(EvaluationAction newValue) {
//     // formGroup.control(name)
//     _rules
//         .where((rule) => rule.dependencies.contains(newValue.path))
//         .map((rule) {
//       evaluate(_fieldName, rule);
//     });
//   }
//
//   void evaluate(String fieldName, Rule rule) {
//     if (rule.expression != null) {
//       try {
//         final expression = Expression.parse(rule.expression!);
//         final bool conditionMet = _evaluator.eval(expression, context.unlock);
//         if (conditionMet) {
//           final event =
//               Event(source: fieldName, eventType: EventType.EvaluationAction);
//           _eventManager.notify(event, evaluationAction(fieldName, rule));
//         }
//
//         // if (conditionMet) {
//         //   field = _applyAction(field, rule);
//         // } else {
//         //   field = _resetAction(field, rule);
//         // }
//       } catch (e) {
//         debugPrint('Error evaluating expression: $e');
//       }
//     }
//
//     ExpressionEvaluator;
//     bool conditionMet = true;
//   }
//
//   EvaluationAction? evaluationAction(String fieldName, Rule rule) {
//     return switch (rule.action) {
//       Action.Show => EvaluationAction.markAsVisible(fieldName),
//       Action.Hide => EvaluationAction.markAsHidden(fieldName),
//       Action.Error =>
//         EvaluationAction.setError(fieldName, errorMessage: rule.message),
//       Action.Mandatory => EvaluationAction.markAsMandatory(fieldName),
//       Action.Filter => EvaluationAction.showHideOptions(fieldName,
//           optionsToShow: rule.filterInfo?.optionsToShow ?? const [],
//           optionsToHide: rule.filterInfo?.optionsToHide ?? const []),
//       Action.StopRepeat => EvaluationAction.stopRepeat(fieldName),
//       Action.Assign =>
//         EvaluationAction.assignValue(fieldName, value: rule.assignedValue),
//       _ => null,
//     };
//   }
// }
//
//
// class FormElementModel<T> {
//   FormElementModel(
//       {required this.formElementName,
//       required this.eventManager,
//       required this.formGroup}) {
//     formGroup.valueChanges.listen((value) => eventManager.notify(
//         Event(source: formElementName, eventType: EventType.ValueChanged),
//         value));
//   }
//
//   final EventManager eventManager;
//   final FormGroup formGroup;
//   final String formElementName;
//
//   void hand() {}
//
//   onEvaluationAction(EvaluationAction evaluationAction) {}
//
//   onFormEventChanged() {}
//
//   formEventToAction(FormEvent f) {}
// }
//
// class Logger {
//   final List<String> logs = [];
//
//   void log(String message) {
//     logs.add(message);
//     debugPrint(message); // Or use a more sophisticated logging mechanism
//   }
//
//   void logAction(String controlPath, String action) {
//     log('Action: $action executed on $controlPath');
//   }
//
//   void logError(String controlPath, String error) {
//     log('Error: $error on $controlPath');
//   }
// }
