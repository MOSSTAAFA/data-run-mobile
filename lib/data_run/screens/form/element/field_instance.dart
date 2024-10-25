part of 'form_element.dart';

class FieldInstance<T> extends FormElementInstance<T>
    with ElementAttributesMixin {
  FieldInstance({
    required FieldElementState<T> elementProperties,
    required super.form,
    required super.template,
    this.choiceFilter,
    Map<String, ValidationMessageFunction> validationMessages = const {},
  }) : super(elementState: elementProperties) {
    this.validationMessages.addAll(validationMessages);
  }

  final ChoiceFilter? choiceFilter;

  FieldElementState<T> get elementState =>
      _elementState as FieldElementState<T>;

  final Map<String, ValidationMessageFunction> validationMessages = {};

  String? get listName => template.listName;

  dynamic get defaultValue => template.defaultValue;

  @override
  T? reduceValue() => elementState.value;

  @override
  FormControl<T>? get elementControl =>
      controlExist ? form.control(elementPath) as FormControl<T> : null;

  AttributeType? get attributeType => template.attributeType;

  @override
  void updateValue(T? value,
      {bool updateParent = true, bool emitEvent = true}) {
    updateStatus(elementState.copyWith(value: value));
    elementControl?.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  @override
  FormElementInstance<dynamic>? findElement(String path) => this;

  @override
  void forEachChild(
          void Function(FormElementInstance<dynamic> element) callback) =>
      <FormElementInstance<dynamic>>[];

  @override
  void reset({T? value}) {
    updateStatus(elementState.copyWith(value: value));
    elementControl!.reset(value: template.defaultValue);
  }

  List<FormOption> get visibleOption => elementState.visibleOptions;

  @override
  void evaluate([String? changedDependency]) {
    super.evaluate();
    if (choiceFilter?.expression != null) {
      final context = evalContext;
      final visibleOptionsUpdate = choiceFilter!.evaluate(evalContext);
      logDebug(
          info:
              'all field options: ${choiceFilter!.options.map((o) => o.name)}');
      logDebug(
          info:
              'only visibleOptionsUpdate: ${visibleOptionsUpdate.map((o) => o.name)}');
      final oldState = elementState.copyWith(); // clone
      final newState = elementState.resetValueFromVisibleOptions(
          visibleOptions: visibleOptionsUpdate);
      logDebug(
          info:
              '$name, option changed: ${oldState.value != newState.value},  ${oldState.value} => ${newState.value}');
      updateStatus(newState /* notify: oldState.value != newState.value*/);
      elementControl?.updateValue(newState.value);
    }
  }
}

//
// class FieldWithOptionsInstance<T> extends FieldInstance<T> {
//   FieldWithOptionsInstance({
//     required FieldElementWithOptionsState<T> elementProperties,
//     required super.form,
//     super.validationMessages,
//     required super.template,
//     super.choiceFilter,
//   }) : super(elementProperties: elementProperties);
//
//   @override
//   void evaluate([String? changedDependency]) {
//     super.evaluate();
//     final visibleOptions =
//         choiceFilter?.evaluate(evalContext) ?? template.options;
//     logInfo(info: 'all field options: ${template.options.map((o) => o.name)}');
//     logInfo(info: 'only visibleOptions: ${visibleOptions.map((o) => o.name)}');
//   }
// }
