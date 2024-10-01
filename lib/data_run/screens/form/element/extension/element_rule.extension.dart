part of '../form_element.dart';

extension FormElementRuleEvaluation<T> on FormElementInstance<T> {
  List<Rule> rulesToEvaluate(String dependencyName) => template.rules
      .where((rule) => rule.dependencies.contains(dependencyName))
      .toList();

  Map<String, dynamic> get evalContext {
    return {
      for (final dependency in _dependencies) dependency.name: dependency.value
    };
  }

  void reEvaluate() {
    // TODO
    // Re-evaluate this field based on the values of multiple dependencies
    // Logic to aggregate dependency values and decide new state
    // the context of evaluation constructed from dependencies.
  }
}

extension FormElementEvaluation<T> on FormElementInstance<T> {}
