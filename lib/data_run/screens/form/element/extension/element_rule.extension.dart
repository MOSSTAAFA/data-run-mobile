part of '../form_element.dart';

extension FormElementRuleEvaluation<T> on FormElementInstance<T> {
  Map<String, dynamic> get evalContext {
    return {
      for (final dependency in _notifiers.values)
        dependency.name: dependency.value
    };
  }

  List<Rule> rulesToEvaluate(String dependencyName) => template.rules
      .where((rule) => rule.dependencies.contains(dependencyName))
      .toList();

  void evaluateRules(String dependencyChanged) {
    try {
      final ruleEvaluator = RuleEvaluator(actionsBehaviours);
      ruleEvaluator.evaluateAndApply(this);
      if (filteringDependencies.contains(dependencyChanged) &&
          this is FieldInstance) {
        (this as FieldInstance).filterOptions(
            dependencyChanged, dependencies[dependencyChanged]?.value);
      }
    } catch (e) {
      logError(
          error: 'Error evaluating: ${name}, notifier: ${dependencyChanged}');
    }
  }
}
