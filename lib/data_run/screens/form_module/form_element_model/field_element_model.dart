part of 'form_element_model.dart';

class FieldElementModel<T> extends FormElementModel<T> {
  FieldElementModel({
    T? value,
    required super.name,
    super.path,
    super.hidden,
    super.mandatory,
  }) {
    if (value != null) this._value = value;
  }

  T? _value;

  @override
  void updateValue(T? value,
      {bool updateParent = true, bool emitEvent = true}) {
    if (_value != value) {
      _value = value;
    }
  }

  @override
  T? reduceValue() => _value;

  @override
  FormElementModel<dynamic>? findElement(String path) => this;

  @override
  void forEachChild(
          void Function(FormElementModel<dynamic> element) callback) =>
      <FormElementModel<dynamic>>[];
}
