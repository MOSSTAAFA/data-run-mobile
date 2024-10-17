import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/element.widget.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/improved_expansion_tile.widget.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/element_section_inherited.widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

/// [ElementSectionInstanceWidget] the one that reacts to the initialized
/// state in [ElementSectionWidget] parent from which it inherits its element model
/// initialization happen of state happen in [ElementSectionWidget]
class ElementSectionInstanceWidget extends HookConsumerWidget {
  ElementSectionInstanceWidget(
      {super.key, required this.section, this.hidden = false});

  final FormSectionElement section;
  final bool hidden;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: section.elements.values.map((childElement) {
        return ReactiveForm(
          formGroup: section.elementControl,
          child: ElementWidget(
            element: childElement,
          ),
        );
      }).toList(),
    );
  }
}
