import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QTextTypeField<T> extends HookConsumerWidget {
  const QTextTypeField({super.key, required this.element});

  final FieldInstance<T> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveTextField<T>(
      formControl: element.elementControl,
      maxLength: element.maxLength,
      maxLines: element.maxLines,
      keyboardType: element.inputType,
      validationMessages: validationMessages(context),
      decoration: InputDecoration(
        enabled: element.elementControl!.enabled,
        labelText: element.properties.label,
      ),
    );
  }
}
