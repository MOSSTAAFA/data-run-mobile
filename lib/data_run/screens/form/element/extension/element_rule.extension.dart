part of '../form_element.dart';

abstract class ElementRuleEvaluationContext<T> {
  // String get name;

  // T? get value;

  // IList<Rule> get rules;

  // IList<String> get rulesDependencies;

  // AbstractControl<dynamic>? get elementControl;

  // final List<ActionBehaviour> _actionBehaviours = [];

  // IList<String> get unresolvedDependencies;

  // final Map<String, ElementRuleEvaluationContext<dynamic>> _contextElement = {};
  // final Map<String, dynamic> _contextElement = {};

  // void addUnresolvedContextElement(String notifier) {
  //   _loggerEvaluation
  //       .w('Unresolved ${notifier} dependencies for element: $name');
  //   unresolvedDependencies.add(notifier);
  // }

  // Map<String, dynamic> get evalContext {
  //   return _contextElement;
  //   // return {
  //   //   for (final dependency in _contextElement.values)
  //   //     dependency.name: dependency.value
  //   // };
  // }

  // void initElementContext(Map<String, dynamic> _contextElement) {
  //   _contextElement.clear();
  //   _contextElement.addAll(_contextElement);
  // }

  // void addContextElement(ElementRuleEvaluationContext<dynamic> dependency) =>
  //     _contextElement[dependency.name] = dependency.value;

  // void setActionBehaviourToEvaluate(List<ActionBehaviour> actionBehaviours) {
  //   _actionBehaviours.clear();
  //   _actionBehaviours.addAll(actionBehaviours);
  // }

  // List<ActionBehaviour> get actionBehaviours =>
  //     List.unmodifiable(_actionBehaviours);

  // List<Rule> rulesToEvaluate(String dependencyName) => rules
  //     .where((rule) => rule.dependencies.contains(dependencyName))
  //     .toList();

  // @mustCallSuper
  // void evaluateRules(String dependencyChanged, dynamic value,
  //     {bool notify = true, RuleEvaluator? ruleEvaluator});

  // bool _isEvaluating = false;

  /// didUpdateElement(covariant FormElement<E> oldElement)
  /// void didChange(ViewDataType value)
  /// void didChangeDependencies()
  // void onDependencyChanged(String notifierName, dynamic value,
  //     {bool notify = true,
  //     List<ActionBehaviour> actionsToEvaluate = const []}) {
  //   // _contextElement[notifierName] = value;
  //   if (_isEvaluating) {
  //     return;
  //   }
  //
  //   _isEvaluating = true;
  //
  //   try {
  //     evaluateRules(notifierName, value);
  //   } finally {
  //     _isEvaluating = false;
  //   }
  // }
}
