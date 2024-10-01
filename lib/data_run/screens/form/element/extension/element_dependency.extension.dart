part of '../form_element.dart';

//<editor-fold desc="dependencies">
extension ElementDependencyLookup<T> on FormElementInstance<T> {
  // Extend findElement to handle searching by name
  FormElementInstance<dynamic>? findDependency(String name) {
    // Implement search logic within the current scope (e.g., section, repeat section)

    if (this is SectionElement) {
      return (this as SectionElement).contains(name)
          ? (this as SectionElement).element(name)
          : null;
    }
    return null; // Return null if no match is found in the current scope
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

    return null;
  }

  // Add method to locate an element inside a repeated section by index
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
}

extension ElementDependencyRegistration<T> on FormElementInstance<T> {
  List<String> get requiredDependencies =>
      [...template.dependencies, ...template.filterDependencies];

  void registerDependency(String dependencyName) {
    final dependency = findElementInParentSection(dependencyName);
    if (dependency != null) {
      addDependency(dependency);
      dependency.addDependent(this);
    }
  }

  void registerDependencies() {
    for (final dependencyName in requiredDependencies) {
      final dependency = findElementInParentSection(dependencyName);
      if (dependency != null) {
        dependency.addDependent(this);
        this.addDependency(dependency);
      } else {
        _unresolvedDependencies.add(dependencyName);
      }
    }
  }

  void addDependent(FormElementInstance<dynamic> dependent) {
    _dependents.add(dependent);
  }

  void addDependency(FormElementInstance<dynamic> dependency) {
    if (hasCircularDependency(dependency)) {
      throw CircularDependencyException(elementName: dependency.name);
    }

    _dependencies.add(dependency);
    dependency.addDependent(this);
  }

  void notifyDependents() {
    for (final dependent in _dependents) {
      dependent.onDependencyChanged(name, value);
    }
  }

  void onDependencyChanged(String dependencyName, T? value) {
    debugPrint(
        'onDependencyChanged, FormElement: $name\'s Dependency: $dependencyName changed: $value');
    final toEvaluate = rulesToEvaluate(dependencyName);
    final contextEval = evalContext;

    if (_isEvaluating) {
      return;
    }

    _isEvaluating = true;

    try {
      //<editor-fold desc="Lazy Loading of Dependencies">
      // for (var dependencyName in _requiredDependencies) {
      //   if (!isDependencyResolved(dependencyName)) {
      //     resolveDependency(dependencyName);
      //   }
      // }
      //</editor-fold>

      reEvaluate();

      notifyDependents();
    } finally {
      _isEvaluating = false;
    }
  }

  bool hasCircularDependency(FormElementInstance<dynamic> dependency) {
    FormElementInstance<dynamic> current = this;
    while (current.parentSection != null) {
      if (current == dependency) {
        return true;
      }
      current = current.parentSection!;
    }
    return false;
  }

//
// bool isDependencyResolved(String dependencyName) {
//   return _dependencies.any((dep) => dep.name == dependencyName);
// }

// void resolveDependencies() {
//   final List<String> resolved = [];
//   _unresolvedDependencies.removeWhere((dependencyName) {
//     final dependency = findElementInParentSection(dependencyName);
//     if (dependency != null) {
//       dependency.addDependent(this);
//       this.addDependency(dependency);
//       resolved.add(dependencyName);
//       return true;
//     } else {
//       return false;
//     }
//   });
//   for (final toRemove in resolved) {
//     _unresolvedDependencies.remove(toRemove);
//   }
// }
}

//</editor-fold>

extension RepeatedSectionDependency on RepeatInstance {
// Extend RepeatSectionInstance to allow finding elements by index
  bool containsIndex(String name, int index) {
    return _elements.length > index && index >= 0;
  }

  FormElementInstance<dynamic> dependencyByIndex(String name, int index) {
    return _elements[index]; // Return the element at the given index
  }
}
