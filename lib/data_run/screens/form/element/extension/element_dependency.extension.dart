part of '../form_element.dart';

final pretty = true;
final LogPrinter logPrinter = pretty
    ? PrettyPrinter(
        colors: true,
        methodCount: 0,
        printEmojis: false,
        excludeBox: {
          Level.trace: true,
          Level.info: true,
        },
      )
    : SimplePrinter(
        colors: true, /*methodCount: 0*/
      );

final loggerEvaluation = Logger(printer: logPrinter, level: Level.debug);

extension ElementDependencyRegistration<T> on FormElementInstance<T> {
  List<String> get filteringDependencies => template.filterDependencies;

  List<String> get rulesDependencies => template.dependencies;

  List<String> get requiredNotifiersNames =>
      [...filteringDependencies, ...rulesDependencies];

  void setUnresolvedDependencies(List<String> unresolved) {
    logWarning(
        warning: 'Unresolved ${unresolved} dependencies for element: $name');
    _unresolvedDependencies.clear();
    _unresolvedDependencies.addAll(unresolved);
  }

  void notifyListeners() {
    for (final dependent in _listeners.values) {
      dependent.onDependencyChanged(name, value);
      // Future.microtask(() => dependent.onDependencyChanged(name, value));
    }
  }

  // void notifyListeners() {
  //   for (final dependent in _listeners.values) {
  //     dependent.onDependencyChanged(name, value);
  //   }
  // }

  void onDependencyChanged(String notifierName, dynamic value) {
    final toEvaluate = template.rules.map((rule) => rule.expression);
    loggerEvaluation.d({
      'Listener: $name notified: $notifierName changed to':
          '${dependencies[notifierName]?.value}',
      '${toEvaluate.isNotEmpty ? 'Evaluating Rule: $toEvaluate' : ''}${template.choiceFilter != null ? 'Evaluating Filter:' : ''}':
          '${toEvaluate.isNotEmpty ? '$toEvaluate' : ''}${template.choiceFilter != null ? '\'${template.choiceFilter}\'' : ''}',
    });

    if (_isEvaluating) {
      return;
    }

    _isEvaluating = true;

    try {
      evaluateRules(notifierName);
      elementControl?.markAsTouched(emitEvent: true, updateParent: false);
      notifyListeners();
    } finally {
      _isEvaluating = false;
    }
  }

  void setNotifiers(Map<String, FormElementInstance<dynamic>> notifiers) {
    _unresolvedDependencies.clear();
    _unresolvedDependencies.addAll(
        requiredNotifiersNames.where((item) => !notifiers.keys.contains(item)));
    if (_unresolvedDependencies.length > 0) {
      loggerEvaluation.w({
        'unresolved dependencies': _unresolvedDependencies,
        'element': name,
      });
    }

    _notifiers.addAll(notifiers);
    // final Listenable fff = Listenable.merge(notifiers.values);
  }
}

extension ElementDependencyLookup<T> on FormElementInstance<T> {
  /// the element use name to find the dependency in closest parent
  FormElementInstance<dynamic>? findElementInParentSection(String name) {
    FormElementInstance<dynamic>? current = this;

    while (current?.parentSection != null) {
      current = current?.parentSection;
      final found = current?.findElement(name);
      if (found != null) return found;
    }

    // reaching this point means current is the root Section element
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

  FormElementInstance<dynamic>? findRepeatedSectionDependency(
      String sectionName, int index) {
    if (this is RepeatInstance) {
      final section = (this as RepeatInstance);
      if (section.containsIndex(sectionName, index)) {
        return section.dependencyByIndex(sectionName, index);
      }
    }
    return null;
  }

  FormElementInstance<dynamic>? findDependencyRecursive(String path) {
    final nameParts = path.split('.');

    return nameParts.fold<FormElementInstance<dynamic>?>(this,
        (element, namePart) {
      if (element == null) return null;

      // If it's a repeated section with an index (e.g., repeatSection[0])
      final match = RegExp(r'(\w+)\[(\d+)\]').firstMatch(namePart);
      if (match != null) {
        final sectionName = match.group(1)!;
        final index = int.parse(match.group(2)!);
        return element.findRepeatedSectionDependency(sectionName, index);
      }

      // Otherwise, treat it as a regular element name
      return element.findElement(namePart);
    });
  }

  FormElementInstance<dynamic>? findDependency(String name) {
    // search logic within the current scope (e.g., section, repeat section)

    if (this is SectionElement) {
      return (this as SectionElement).contains(name)
          ? (this as SectionElement).findElementInParentSection(name)
          : null;
    }
    return null;
  }
}

extension RepeatedSectionDependency on RepeatInstance {
  bool containsIndex(String name, int index) {
    return _elements.length > index && index >= 0;
  }

  FormElementInstance<dynamic> dependencyByIndex(String name, int index) {
    return _elements[index]; // Return the element at the given index
  }
}
