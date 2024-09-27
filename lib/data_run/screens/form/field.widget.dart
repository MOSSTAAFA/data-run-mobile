import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/form_widget_factory.dart';
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

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: FieldFactory.fromType(element: element),
    );
  }
}
