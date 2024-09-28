part of 'form_element.dart';

extension FormElementDependencyResolve<T> on FormElementInstance<T> {
  //<editor-fold desc="resolve dependencies">
  void registerDependenciesDeferred() {
    for (final dependencyName in _requiredDependencies) {
      final dependency = findElementInParentSection(dependencyName);
      if (dependency != null) {
        dependency.addDependent(this);
        this.addDependency(dependency);
      } else {
        _unresolvedDependencies.add(dependencyName);
      }
    }
  }

  void resolveDependencies() {
    final List<String> resolved = [];
    _unresolvedDependencies.removeWhere((dependencyName) {
      final dependency = findElementInParentSection(dependencyName);
      if (dependency != null) {
        dependency.addDependent(this);
        this.addDependency(dependency);
        resolved.add(dependencyName);
        return true;
      } else {
        return false;
      }
    });
    for (final toRemove in resolved) {
      _unresolvedDependencies.remove(toRemove);
    }
  }

  //</editor-fold>

  //<editor-fold desc="dependencies management">
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
      dependent.onDependencyChanged(name);
    }
  }

  List<Rule> rulesToEvaluate(String dependencyName) => template.rules
      .where((rule) => rule.dependencies.contains(dependencyName))
      .toList();

  void onDependencyChanged(String dependencyName) {
    debugPrint(
        'onDependencyChanged, FormElement: $name\'s Dependency: $dependencyName changed');
    final toEvaluate = rulesToEvaluate(dependencyName);
    final contextEval = evalContext;

    if (_isEvaluating) {
      return;
    }

    _isEvaluating = true;

    final previousValue = _value;
    try {
      //<editor-fold desc="Lazy Loading of Dependencies">
      // for (var dependencyName in _requiredDependencies) {
      //   if (!isDependencyResolved(dependencyName)) {
      //     resolveDependency(dependencyName);
      //   }
      // }
      //</editor-fold>

      reEvaluate();

      if (_value != previousValue) {
        notifyDependents();
      }
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
//</editor-fold>
}

extension FormElementEvaluation<T> on FormElementInstance<T> {
  List<String> get requiredDependencies =>
      List.unmodifiable(_requiredDependencies);

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
}

extension FormFieldModelExtensions<T> on FieldInstance<T> {
  TextInputType? get inputType {
    return switch (type) {
      ValueType.Text => TextInputType.text,
      ValueType.LongText => TextInputType.multiline,
      ValueType.Letter => TextInputType.text,
      ValueType.Number =>
        const TextInputType.numberWithOptions(decimal: true, signed: true),
      ValueType.UnitInterval =>
        const TextInputType.numberWithOptions(decimal: true),
      ValueType.Percentage => TextInputType.number,
      ValueType.IntegerNegative ||
      ValueType.Integer =>
        const TextInputType.numberWithOptions(signed: true),
      ValueType.IntegerPositive ||
      ValueType.IntegerZeroOrPositive =>
        TextInputType.number,
      ValueType.PhoneNumber => TextInputType.phone,
      ValueType.Email => TextInputType.emailAddress,
      ValueType.URL => TextInputType.url,
      _ => TextInputType.text
    };
  }

  TextInputAction? get inputAction {
    return TextInputAction.none;
    // return when(
    //     keyboardActionType, <KeyboardActionType, TextInputAction Function()>{
    //   KeyboardActionType.NEXT: () => TextInputAction.next,
    //   KeyboardActionType.DONE: () => TextInputAction.done,
    //   KeyboardActionType.ENTER: () => TextInputAction.none,
    // });
  }

  int? get maxLength {
    switch (type) {
      case ValueType.Text:
        return 255;
      case ValueType.LongText:
      case ValueType.Letter:
        return 2000;
      default:
        return null;
    }
  }

  int get maxLines {
    switch (type) {
      case ValueType.LongText:
      case ValueType.Letter:
        return 8;
      default:
        return 1;
    }
  }

  //
  TextInputAction? get textInputAction {
    // if (keyboardActionType != null) {
    //   return when(
    //       keyboardActionType, <KeyboardActionType, TextInputAction Function()>{
    //     KeyboardActionType.NEXT: () => TextInputAction.next,
    //     KeyboardActionType.DONE: () => TextInputAction.done,
    //     KeyboardActionType.ENTER: () => TextInputAction.none
    //   });
    // }
    return null;
  }
}
