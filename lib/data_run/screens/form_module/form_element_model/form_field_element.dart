part of 'form_element.dart';

class FormFieldElement<T> extends FormElementInstance<T> {
  FormFieldElement({
    T? value,
    required super.name,
    super.hidden,
    super.mandatory,
  }) {
    if (value != null) this._value = value;
  }

  @override
  void updateValue(T? value,
      {bool updateParent = true, bool emitEvent = true}) {
    if (_value != value) {
      _value = value;
      updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
    }
  }

  @override
  void patchValue(T? value, {bool updateParent = true, bool emitEvent = true}) {
    updateValue(value, updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  T? reduceValue() => _value;

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
}
