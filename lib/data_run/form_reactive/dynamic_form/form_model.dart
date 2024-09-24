import 'package:reactive_forms/reactive_forms.dart';

class FormTemplateModel {
  FormTemplateModel(this.formGroup);

  final FormGroup formGroup;

  // Method to get the model's data
  Map<String, dynamic> get model {
    return formGroup.value as Map<String, dynamic>;
  }

  // Method to update the form value
  void updateValue(Map<String, dynamic>? value,
      {bool updateParent = true, bool emitEvent = true}) {
    formGroup.patchValue(value ?? {},
        updateParent: updateParent, emitEvent: emitEvent);
  }

  // Method to submit the form
  void submit({
    required void Function(Map<String, dynamic> model) onValid,
    void Function()? onNotValid,
  }) {
    if (formGroup.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }
}
