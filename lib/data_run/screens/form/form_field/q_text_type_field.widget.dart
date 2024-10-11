import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/element_field_inherited.widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

// created by a static factory method
class QReactiveTextTypeField extends HookWidget {
  const QReactiveTextTypeField({
    super.key,
    required this.element,
  });

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context) {
    /// the element reference to the form control [disable, value properties are coming from it]
    /// and also encapsulate other properties not available in the reactive library
    /// form control such as visibility
    /// other properties not available in reactive form
    /// control
    // final element = FieldElementInheritedWidget.of(context);
    /// visibility
    // if (element.hidden) {
    //   return SizedBox.shrink();
    // }

    /// a reactive_form widget, its control is coming from the element,
    return ReactiveTextField<String>(
      // formControlName: element.name,
      formControl: element.elementControl as FormControl<String>,
      maxLength: element.maxLength,
      maxLines: element.maxLines,
      keyboardType: element.inputType,
      validationMessages: validationMessages(context),
      decoration: InputDecoration(
          labelText: element.label,
          enabled: (element.elementControl?.enabled ?? false)),
    );
  }
}
