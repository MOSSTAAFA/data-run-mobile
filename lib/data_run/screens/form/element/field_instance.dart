part of 'form_element.dart';

class FieldInstance<T> extends FormElementInstance<T>
    with ElementAttributesMixin {
  FieldInstance({
    super.properties,
    required super.form,
    required super.template,
    List<FormOption> options = const [],
    Map<String, ValidationMessageFunction> validationMessages = const {},
  }) {
    this.options.addAll(options);
    this.validationMessages.addAll(validationMessages);
  }

  final List<FormOption> options = [];
  final Map<String, ValidationMessageFunction> validationMessages = {};

  String? get listName => template.listName;

  String? get choiceFilter => template.choiceFilter;

  dynamic get defaultValue => template.defaultValue;

  AttributeType? get attributeType => template.attributeType;

  @override
  void updateValue(T? value,
      {bool updateParent = true, bool emitEvent = true}) {
    elementControl?.updateValue(
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
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

// /// stockItemsControl
// FormControl<T>? get elementControl =>
//     form.control(elementPath) as FormControl<T>?;
}
