part of '../form_element.dart';

extension ElementDependencyHandler<T> on FormElementInstance<T> {
  Map<String, dynamic> get evalContext {
    return {
      for (final dependency in _dependencies.values)
        dependency.name: dependency.visible ? dependency.value : null
    };
  }

  void _addDependent(FormElementInstance<dynamic> dependent) {
    _dependents[dependent.name] = dependent;
  }

  void addDependency(FormElementInstance<dynamic> dependency) {
    _dependencies[dependency.name] = dependency;
    dependency._addDependent(this);
  }

  void notifyDependents() {
    logInfo(info: '$name changed, notifying: $dependencies');
    for (final dependent in _dependents.values) {
      dependent.onDependencyChanged(name, value);
    }
  }

  // @mustCallSuper
  void reEvaluateStatus() {
    if (_isEvaluating) {
      return;
    }

    _isEvaluating = true;

    try {
      elementRuleActions.map((ruleAction) => ruleAction.shouldApply(evalContext)
          ? ruleAction.apply(this)
          : ruleAction.reset(this));
    } finally {
      _isEvaluating = false;
    }
  }

  /// didUpdateElement(covariant FormElement<E> oldElement)
  /// void didChange(ViewDataType value)
  /// void didChangeDependencies()
  void onDependencyChanged(String changedDependency, value) {
    logInfo(
        info:
            '$name, $changedDependency Changed to: $value, Evaluating State...');
    reEvaluateStatus();
    notifyDependents();
  }

  /// the element use name to find the dependency in closest parent
  /// and register itself and add them to their dependencies
  FormElementInstance<dynamic>? findElementInParentSection(String name) {
    FormElementInstance<dynamic>? current = this;

    while (current?.parentSection != null) {
      current = current?.parentSection;
      final found = current?.findElement(name);
      if (found != null) return found;
    }

    return walkTreeForDependency(current!, name);
  }

  /// Recursively walk through all elements in the form tree and find a match
  FormElementInstance<dynamic>? walkTreeForDependency(
      FormElementInstance<dynamic> current, String name) {
    if (current.name == name) {
      return current;
    }

    if (current is SectionElement) {
      final childElements = current is SectionInstance
          ? current.elements.values
          : (current as RepeatInstance).elements;
      for (var nestedElement in childElements) {
        var result = walkTreeForDependency(nestedElement, name);
        if (result != null) {
          return result;
        }
      }
    }

    return null;
  }

// void setNotifiers(Map<String, FormElementInstance<dynamic>> notifiers) {
//   _unresolvedDependencies.clear();
//   _unresolvedDependencies.addAll(
//       requiredNotifiersNames.where((item) => !notifiers.keys.contains(item)));
//   if (_unresolvedDependencies.length > 0) {
//     loggerEvaluation.w({
//       'unresolved dependencies': _unresolvedDependencies,
//       'element': name,
//     });
//   }
//
//   _notifiers.addAll(notifiers);
//   // final Listenable fff = Listenable.merge(notifiers.values);
// }
}
