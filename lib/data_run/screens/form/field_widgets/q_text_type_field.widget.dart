import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/section_inherited.widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QTextTypeField extends HookWidget {
  const QTextTypeField({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context) {
    final control = ReactiveForm.of(context);
    final section = SectionInheritedWidget.of(context);
    final requiredDependencies = element.requiredDependencies;
    final elementName = element.name;
    final pathR = section.pathRecursive;
    final pathBu = section.pathBuilder(element.name);
    if (requiredDependencies.length > 0) {
      final depElement = element
          .findElementInParentSection(element.requiredDependencies.first);
    }
    final pathBu2 = section.elementPath;
    final formControl = section.elementControl;

    final pathR1 = element.pathRecursive;
    final pathBu11 = element.pathBuilder(element.name);
    final pathBu21 = element.elementPath;
    final formControl1 = element.elementControl;
    final currentControl =
        (ReactiveForm.of(context) as FormGroup).control(element.name);
    final forfmControl = formControl;
    return ReactiveTextField<String>(
      // formControl: element.elementControl,
      formControlName: element.name,
      maxLength: element.maxLength,
      maxLines: element.maxLines,
      keyboardType: element.inputType,
      validationMessages: validationMessages(context),
      decoration: InputDecoration(
        labelText: element.properties.label,
      ),
    );
  }
}
