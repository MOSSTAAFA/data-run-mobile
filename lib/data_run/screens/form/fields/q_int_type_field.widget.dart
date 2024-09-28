import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form/model/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/model/form_element_validator.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QIntTypeField extends HookWidget {
  const QIntTypeField({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<int?>(
      formControlName: element.name,
      valueAccessor: IntValueAccessor(),
      maxLength: element.maxLength,
      maxLines: element.maxLines,
      keyboardType: element.inputType,
      validationMessages: validationMessages(context),
      decoration: InputDecoration(labelText: element.properties.label),
    );
  }
}

class IntValueAccessor extends ControlValueAccessor<int?, String> {
  @override
  String modelToViewValue(int? modelValue) {
    return modelValue == null ? '' : modelValue.toString();
  }

  @override
  int? viewToModelValue(String? viewValue) {
    return (viewValue == '' || viewValue == null)
        ? null
        : int.tryParse(viewValue);
  }
}
