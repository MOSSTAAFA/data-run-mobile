part of 'form_element.dart';

class FieldInstance<T> extends FormElementInstance<T>
    with ElementAttributesMixin {
  // final _filterController = StreamController<List<FormOption>>.broadcast();
  //
  // Stream<List<FormOption>> get filterChanged => _filterController.stream;

  FieldInstance({
    super.hidden,
    // super.readOnly,
    required super.form,
    required super.template,
    List<FormOption> options = const [],
    Map<String, ValidationMessageFunction> validationMessages = const {},
  }) : _fieldState = FieldInstanceState(
            hidden: hidden, mandatory: template.mandatory, options: template.options) {
    // this._options.addAll(options);
    // this.validationMessages.addAll(validationMessages);
  }

  // FormControl<T>? control;

  FieldInstanceState<T> _fieldState;

  @override
  FieldInstanceState<T> get elementState => _fieldState;

  // final List<FormOption> _filteredOptions = [];
  //
  // final Map<String, ValidationMessageFunction> validationMessages = {};

  String? get listName => template.listName;

  // List<FormOption> get filteredOptions => List.unmodifiable(_filteredOptions);
  List<FormOption> get filteredOptions => _fieldState.filteredOptions.unlock;

  String? get choiceFilter => template.choiceFilter;

  dynamic get defaultValue => template.defaultValue;

  AttributeType? get attributeType => template.attributeType;

  // List<FormOption> filterOptions(String dependencyChangedName, dynamic value) {
  //   final filteredOptions = template.options.where((option) {
  //     final optionContext = option.toContext();
  //     final evaluationContext = {...optionContext, ...evalContext};
  //     return evaluationEngine.evaluateExpression(
  //         template.evalChoiceFilterExpression!, evaluationContext);
  //   }).toList();
  //   return filteredOptions;
  // }
  //
  // void updateOptions(List<FormOption> options) {
  //   _fieldState = _fieldState.copyWith(filteredOptions: options);
  // }

  @override
  FormElementInstance<dynamic>? findElement(String path) => this;

  @override
  void forEachChild(
          void Function(FormElementInstance<dynamic> element) callback) =>
      <FormElementInstance<dynamic>>[];

  void dispose() {
    // eventManager.remove(listeners)
    // _filterController.close();

    elementControl?.dispose();
    super.dispose();
  }

  List<String> get filteringDependencies => template.filterDependencies;

// FormControl<T>? get elementControl =>
//     controlExist ? form.control(elementPath) as FormControl<T> : null;
//
// @override
// void updateValue(T? value,
//     {bool updateParent = true, bool emitEvent = true}) {
//   elementControl?.updateValue(
//     value,
//     updateParent: updateParent,
//     emitEvent: emitEvent,
//   );
// }

// @override
// void patchValue(T? value, {bool updateParent = true, bool emitEvent = true}) {
//   updateValue(value, updateParent: updateParent, emitEvent: emitEvent);
// }
//
// @override
// bool anyElements(
//         bool Function(FormElementInstance<dynamic> element) condition) =>
//     false;
}
