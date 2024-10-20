// part of '../form_element.dart';
//
// mixin ElementRuleEvaluationContext<T> on FormElementInstance<T> {
//   // String get name;
//
//   // T? get value;
//
//   // List<Rule> get rules;
//
//   // List<String> get rulesDependencies;
//   //
//   // AbstractControl<dynamic>? get elementControl;
//   //
//   // final List<ActionBehaviour> _actionBehaviours = [];
//   //
//   List<String> get unresolvedDependencies;
//   //
//   // final Map<String, FormElementInstance<dynamic>> _contextElement = {};
//   //
//   //
//   // Map<String, dynamic> get evalContext {
//   //   return {
//   //     for (final dependency in _contextElement.values)
//   //       dependency.name: dependency.value
//   //   };
//   // }
//
//   // void addUnresolvedContextElement(String notifier) {
//   //   _loggerEvaluation
//   //       .w('Unresolved ${notifier} dependencies for element: $name');
//   //   unresolvedDependencies.add(notifier);
//   // }
//   // void initElementContext(Map<String, dynamic> _contextElement) {
//   //   _contextElement.clear();
//   //   _contextElement.addAll(_contextElement);
//   // }
//
//   // void addContextElement(ElementRuleEvaluationContext<dynamic> dependency) =>
//   //     _contextElement[dependency.name] = dependency.value;
//
//   // void setActionBehaviourToEvaluate(List<ActionBehaviour> actionBehaviours) {
//   //   _actionBehaviours.clear();
//   //   _actionBehaviours.addAll(actionBehaviours);
//   // }
//
//   // List<ActionBehaviour> get actionBehaviours =>
//   //     List.unmodifiable(_actionBehaviours);
//
//   // List<Rule> rulesToEvaluate(String dependencyName) => rules
//   //     .where((rule) => rule.dependencies.contains(dependencyName))
//   //     .toList();
//
//   // @mustCallSuper
//   // void evaluateRules(String dependencyChanged, dynamic value,
//   //     {bool notify = true, RuleEvaluator? ruleEvaluator});
//
//   // bool _isEvaluating = false;
//
//   /// didUpdateElement(covariant FormElement<E> oldElement)
//   /// void didChange(ViewDataType value)
//   /// void didChangeDependencies()
//   // void onDependencyChanged(String notifierName, dynamic value,
//   //     {bool notify = true,
//   //     List<ActionBehaviour> actionsToEvaluate = const []}) {
//   //   // _contextElement[notifierName] = value;
//   //   if (_isEvaluating) {
//   //     return;
//   //   }
//   //
//   //   _isEvaluating = true;
//   //
//   //   try {
//   //     evaluateRules(notifierName, value);
//   //   } finally {
//   //     _isEvaluating = false;
//   //   }
//   // }
// }
