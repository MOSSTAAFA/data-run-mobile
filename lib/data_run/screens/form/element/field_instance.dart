part of 'form_element.dart';

class FieldInstance<T> extends FormElementInstance<T>
    with ElementAttributesMixin {
  final _filterController = StreamController<List<FormOption>>.broadcast();

  Stream<List<FormOption>> get filterChanged => _filterController.stream;

  FieldInstance({
    super.hidden,
    required super.form,
    required super.template,
    // List<FormOption> options = const [],
    Map<String, ValidationMessageFunction> validationMessages = const {},
  }) {
    // this._options.addAll(options);
    this.validationMessages.addAll(validationMessages);
  }

  // final List<FormOption> _options = [];
  final Map<String, ValidationMessageFunction> validationMessages = {};

  String? get listName => template.listName;

  // List<FormOption> get options => List.unmodifiable(_options);

  String? get choiceFilter => template.choiceFilter;

  dynamic get defaultValue => template.defaultValue;

  AttributeType? get attributeType => template.attributeType;

  void filterOptions(String dependencyChangedName, dynamic value) {
    loggerEvaluation.d({
      'Listener: $name notified: $dependencyChangedName changed to':
          '${dependencies[dependencyChangedName]?.value}',
      'Evaluating Filter:':
          '${template.choiceFilter != null ? '\'${template.choiceFilter}\'' : ''}',
    });
    if (filteringDependencies.contains(dependencyChangedName)) {
      final filteredOptions = template.options.where((option) {
        final optionContext = option.toContext();
        final evaluationContext = {...optionContext, ...evalContext};
        return evaluationEngine.evaluateExpression(
            template.evalChoiceFilterExpression!, evaluationContext);
      }).toList();

      // _options.clear();
      // _options.addAll(filteredOptions);
      _filterController.add(filteredOptions);
      notifyListeners(); // which will mare this as dirty which emit statusChanged
    }
  }

  @override
  void updateValue(T? value,
      {bool updateParent = true, bool emitEvent = true}) {
    elementControl?.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
    notifyListeners();
  }

  @override
  void patchValue(T? value, {bool updateParent = true, bool emitEvent = true}) {
    updateValue(value, updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  bool anyElements(
          bool Function(FormElementInstance<dynamic> element) condition) =>
      false;

  @override
  FormElementInstance<dynamic>? findElement(String path) => this;

  @override
  void forEachChild(
          void Function(FormElementInstance<dynamic> element) callback) =>
      <FormElementInstance<dynamic>>[];

  void get fieldFocus => form.focus(elementPath);

  void dispose() {
    // eventManager.remove(listeners)
    _filterController.close();
    elementControl?.dispose();
    super.dispose();
  }
}
