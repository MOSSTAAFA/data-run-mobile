import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QSwitchField extends HookWidget {
  const QSwitchField({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context) {
    final elementConfig = useState(element.properties);

    return ReactiveSwitchListTile(
      formControlName: element.name,
      // formControl: element.elementControl as FormControl<bool>,
      title: Text('${elementConfig.value.label}'),
    );
  }
}
