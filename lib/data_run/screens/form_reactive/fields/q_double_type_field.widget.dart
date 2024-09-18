import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element.extension.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_validator.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QDoubleTypeField extends HookWidget {
  const QDoubleTypeField({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<double?>(
      // formControl: element.elementControl,
      formControlName: element.name,
      valueAccessor: DoubleValueAccessor(),
      maxLength: element.maxLength,
      maxLines: element.maxLines,
      keyboardType: element.inputType,
      validationMessages: validationMessages(context),
      decoration: InputDecoration(labelText: element.properties.label),
    );
  }
}

class DoubleValueAccessor extends ControlValueAccessor<double?, String> {
  final int fractionDigits;

  DoubleValueAccessor({
    this.fractionDigits = 2,
  });

  @override
  String modelToViewValue(double? modelValue) {
    return modelValue == null ? '' : modelValue.toStringAsFixed(fractionDigits);
  }

  @override
  double? viewToModelValue(String? viewValue) {
    return (viewValue == '' || viewValue == null)
        ? null
        : double.tryParse(viewValue);
  }
}
