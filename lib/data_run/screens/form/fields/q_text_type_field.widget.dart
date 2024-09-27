import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form/model/form_element.extension.dart';
import 'package:mass_pro/data_run/screens/form/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form/model/form_element_validator.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QTextTypeField extends HookWidget {
  const QTextTypeField({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context) {
    // final control = ReactiveForm.of(context);
    // final section = SectionInheritedWidget.of(context);
    // final pathR = section.pathRecursive;
    // final pathBu = section.pathBuilder(element.name);
    // final pathBu2 = section.elementPath;
    // final formControl = section.elementControl;

    // final pathR1 = element.pathRecursive;
    // final pathBu11 = element.pathBuilder(element.name);
    // final pathBu21 = element.elementPath;
    // final formControl1 = element.elementControl;
    // final elementName = element.name;
    // final currentControl = (ReactiveForm.of(context) as FormGroup).control(element.name);
    // final forfmControl = formControl;
    return ReactiveTextField<String>(
      // formControl: element.elementControl,
      formControlName: element.name,
      maxLength: element.maxLength,
      maxLines: element.maxLines,
      keyboardType: element.inputType,
      validationMessages: validationMessages(context),
      decoration: InputDecoration(labelText: element.properties.label),
    );
  }
}
