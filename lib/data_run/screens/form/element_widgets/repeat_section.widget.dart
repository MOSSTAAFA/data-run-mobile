import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_control_factory.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/repeat_item.widget.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/section.widget.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/improved_expansion_tile.widget.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:scrollable/exports.dart';

class RepeatSectionWidget extends HookConsumerWidget {
  const RepeatSectionWidget({
    super.key,
    required this.element,
    this.onAdd,
    this.onRemove,
    required this.formOptionsMap,
  });

  final RepeatInstance element;
  final Map<String, List<FormOption>> formOptionsMap;

  final Function(int index)? onAdd;
  final Function(int index)? onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double scrollableHeight = 500.0;

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
                    final repeatItemInstance =
                        entry.value as RepeatItemInstance;

                    return RepeatItem(
                      element: repeatItemInstance,
                      onDeleteItem: (index) => onRemoveItem(index),
                      index: index,
                    );
                  }).toList(),
                  ElevatedButton.icon(
                    onPressed: element.form.enabled ? () => onAddItem() : null,
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

  onRemoveItem(int index) {
    element.removeAt(index);
    element.elementControl.markAsDirty();
    onRemove?.call(index);
  }

  void onAddItem() {
    element.elementControl.add(
        FromElementControlFactory.createSectionFormGroup(element.template));
    element.add(
        FromElementFactory.createRepeatItem(element.form, element.template));
    element.elementControl.markAsDirty();
    onAdd?.call(element.elements.lastIndex);
  }
}
