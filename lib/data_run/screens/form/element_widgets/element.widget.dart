import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/form_widget_factory.dart';

class ElementWidget extends HookWidget {
  const ElementWidget({super.key, required this.element});

  final FormElementInstance<dynamic> element;

  @override
  Widget build(BuildContext context) {
    logDebug('ElementWidget build(): ${element.name}');

    return Card(
      shadowColor: Theme.of(context).colorScheme.shadow,
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      elevation: 1,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FormElementWidgetFactory.createWidget(element)),
    );
  }
}
