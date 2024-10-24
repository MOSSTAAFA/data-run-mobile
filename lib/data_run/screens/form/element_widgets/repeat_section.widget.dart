import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/form/form_element/form_element_state.provider.dart';
import 'package:mass_pro/data_run/form/form_element/parsing/form_instance_builder.dart';
import 'package:mass_pro/data_run/form/form_element/parsing/form_instance_control_builder.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_control_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/repeat_item.widget.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:scrollable/exports.dart';

class RepeatSectionWidget extends HookConsumerWidget {
  const RepeatSectionWidget({super.key, required this.element});

  final RepeatInstance element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double scrollableHeight = 500.0;
    final formMetadata = FormMetadataWidget.of(context);
    return ReactiveFormArray(
      formArray: element.elementControl,
      builder:
          (BuildContext context, FormArray<dynamic> formArray, Widget? child) {
        return SizedBox(
          height: scrollableHeight,
          child: KeyboardDismiss(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...element.elements.asMap().entries.map((entry) {
                    final index = entry.key;
                    final repeatItemInstance = entry.value;

                    return RepeatItem(
                      element: repeatItemInstance,
                      onDeleteItem: (index) {
                        ref
                            .watch(formInstanceProvider(
                                formMetadata: formMetadata))
                            .requireValue
                            .onRemoveRepeatedItem(index, element);
                      },
                      index: index,
                    );
                  }).toList(),
                  ElevatedButton.icon(
                    onPressed: element.form.enabled
                        ? () {
                            ref
                                .watch(formInstanceProvider(
                                    formMetadata: formMetadata))
                                .requireValue
                                .onAddRepeatedItem(element);
                          }
                        : null,
                    icon: const Icon(Icons.add),
                    label: Text(S.of(context).addNew),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

// onRemoveItem(int index, BuildContext context, WidgetRef ref) {
//   // final elementPath = element.elements[index].elementPath;
//   element.removeAt(index);
//   element.elementControl.markAsDirty();
//   onRemove?.call(index);
// }
//
// void onAddItem(BuildContext context, WidgetRef ref) {
//   final instanceBuilder = ref.read(formInstanceBuilderProvider(formMetadata: FormMetadataWidget.of(context))).requireValue;
//   final instanceControllerBuilder = ref.read(formInstanceControlBuilderProvider(formMetadata: FormMetadataWidget.of(context))).requireValue;
//   final itemInstanceController = instanceControllerBuilder.createSectionFormGroup(element.template);
//   final itemInstance = instanceBuilder.buildRepeatItem(element.form, element.template);
//
//   final formInstance = ref.read(formInstanceProvider(formMetadata: FormMetadataWidget.of(context))).requireValue;
//   formInstance.form.control(element.elementPath) as FormArray<Map<String, Object?>>;
//
//   element.elementControl.add(itemInstanceController);
//   element.add(itemInstance);
// }
}
