import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/improved_expansion_tile.widget.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/element_section_inherited.widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class ElementSectionFieldListWidget extends HookConsumerWidget {
  ElementSectionFieldListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final element = ElementSectionInheritedWidget.of(context);

    /// visibility
    if (element.hidden) {
      return SizedBox.shrink();
    }

    return ReactiveForm(
      formGroup: element.elementControl,
      child: Column(
        children: element.elements.values.map((childElement) {
          // return FormElementWidgetFactory.createWidget(childElement);
          return FormElementWidgetFactory.createWidget(element);
        }).toList(),
      ),
    );
  }
}
