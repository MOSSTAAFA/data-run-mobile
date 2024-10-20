part of 'form_element.dart';

class FieldInstance<T> extends FormElementInstance<T>
    with ElementAttributesMixin {
  FieldInstance({
    T? value,
    super.properties,
    required super.form,
    required super.template,
    required super.path,
    required super.formValueMap,
    Map<String, ValidationMessageFunction> validationMessages = const {},
  }) {
    if (value != null) {
      formValueMap.setValue(path!, value);
    }
    this.validationMessages.addAll(validationMessages);
  }

  final List<FormOption> options = [];
  final Map<String, ValidationMessageFunction> validationMessages = {};

  String? get listName => template.listName;

  String? get choiceFilter => template.choiceFilter;

  dynamic get defaultValue => template.defaultValue;

  @override
  FormControl<T>? get elementControl =>
      controlExist ? form.control(elementPath) as FormControl<T> : null;

  AttributeType? get attributeType => template.attributeType;

  @override
  void updateValue(T? value,
      {bool updateParent = true, bool emitEvent = true}) {
    formValueMap.setValue(elementPath, value);
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
}
