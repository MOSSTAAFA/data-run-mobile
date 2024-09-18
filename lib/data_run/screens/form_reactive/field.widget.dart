import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_reactive/form_widget_factory.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FieldWidget extends HookWidget {
  FieldWidget({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context) {
    final elementConfig = useState(element.properties);
    if (elementConfig.value.hidden) {
      return SizedBox.shrink();
    }

    return FieldFactory.fromType(element: element);
  }
}
