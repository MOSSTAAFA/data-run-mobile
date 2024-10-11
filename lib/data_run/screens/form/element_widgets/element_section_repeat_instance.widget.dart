import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_control_factory.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/element_section_repeat_item_section.widget.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/improved_expansion_tile.widget.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/element_repeat_inherited.widget.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ElementSectionRepeatInstanceWidget extends HookConsumerWidget {
  const ElementSectionRepeatInstanceWidget(
      {super.key, required this.repeatSectionElement});

  final RepeatInstance repeatSectionElement;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final repeatSectionElement = ElementRepeatInheritedWidget.of(context);

    // /// visibility
    // if (repeatSectionElement.hidden) {
    //   return SizedBox.shrink();
    // }

    final double scrollableHeight = 500.0;
    return ReactiveFormArray(
      formArray: repeatSectionElement.elementControl,
      builder: (BuildContext context, FormArray<dynamic> formArray,
          Widget? childAddButton) {
        return SizedBox(
          height: scrollableHeight,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...repeatSectionElement.elements.asMap().entries.map((entry) {
                  final index = entry.key;
                  final repeatItemInstance = entry.value as RepeatItemInstance;
                  return ElementSectionRepeatItemSection(
                    repeatedItemElement: repeatItemInstance,
                    onDeleteItem: (index) {
                      repeatSectionElement.removeAt(index);
                      repeatSectionElement.elementControl.markAsDirty();
                    },
                    index: index,
                  );
                }).toList(),
                childAddButton!
              ],
            ),
          ),
        );
      },
      child: ElevatedButton.icon(
        onPressed: repeatSectionElement.form.enabled
            ? () {
                repeatSectionElement.elementControl.add(
                    FromElementControlFactory.createSectionFormGroup(
                        repeatSectionElement.template));
                repeatSectionElement.add(FromElementFactory.createRepeatItem(
                    repeatSectionElement.form, repeatSectionElement.template));
                repeatSectionElement.elementControl.markAsTouched();
              }
            : null,
        icon: const Icon(Icons.add),
        label: Text(S.of(context).addNew),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
