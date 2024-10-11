import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/element_field_inherited.widget.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/field_widgets.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QReactiveDoubleTypeField extends HookWidget {
  const QReactiveDoubleTypeField({
    super.key,
    required this.element,
  });

  final FieldInstance<double> element;

  @override
  Widget build(BuildContext context) {
    // final element = FieldElementInheritedWidget.of(context);

    return QReactiveTextField<double>(
      // formControlName: element.name,
      element: element,
      valueAccessor: DoubleValueAccessor(),
      keyboardType: element.inputType,
      validationMessages: validationMessages(context),
      decoration: InputDecoration(labelText: element.label),
    );
  }
}

class DoubleValueAccessor extends ControlValueAccessor<double, String> {
  DoubleValueAccessor({
    this.fractionDigits = 2,
  });

  final int fractionDigits;

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
