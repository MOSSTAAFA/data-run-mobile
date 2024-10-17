import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/element_field_inherited.widget.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_element_inherited.widget.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/q_reactive_text_type_field.widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QReactiveIntTypeField extends HookWidget {
  const QReactiveIntTypeField({
    super.key,
    required this.element,
  });

  final FormFieldElement<int> element;

  @override
  Widget build(BuildContext context) {
    // final element = FieldElementInheritedWidget.of(context);

    return QReactiveTextField<int>(
      // formControlName: element.name,
      element: element,
      valueAccessor: IntValueAccessor(),
      keyboardType: element.inputType,
      validationMessages: validationMessages(context),
      decoration: InputDecoration(
          labelText: element.label,
          enabled: (element.elementControl?.enabled ?? false)),
    );
  }
}

class IntValueAccessor extends ControlValueAccessor<int, String> {
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
