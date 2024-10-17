import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/reactive_drop_down/src/q_reactive_dropdown_search.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';

class QReactiveDropDownField extends HookConsumerWidget {
  const QReactiveDropDownField({
    super.key,
    required this.element,
  });

  // final FieldInstance<String?> element;
  final FormFieldElement<String> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final element = FieldElementInheritedWidget.of(context);

    final filteredOptions = element.filteredOptions;

    return QReactiveDropdownSearch<String, String>(
      // formControlName: element.name,
      element: element,
      clearButtonProps: const ClearButtonProps(isVisible: true),
      validationMessages: validationMessages(context),
      valueAccessor: NameToLabelValueAccessor(filteredOptions),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: element.label,
          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          border: OutlineInputBorder(),
        ),
      ),
      popupProps: PopupProps.menu(
        showSelectedItems: true,
      ),
      items: filteredOptions
          .map((option) => getItemLocalString(option.label))
          .toSet()
          .toList(),
      showClearButton: true,
    );
  }
}

class NameToLabelValueAccessor
    extends DropDownSearchValueAccessor<String, String> {
  final List<FormOption> options;

  NameToLabelValueAccessor(this.options);

  /// to label
  @override
  String? modelToViewValue(List<String> items, String? modelValue) {
    return options
        .where((option) => option.name == modelValue)
        .map((option) =>
            getItemLocalString(option.label, defaultString: option.name))
        .firstOrNull;
  }

  @override
  String? viewToModelValue(List<String> items, String? viewValue) {
    return options
        .where((option) =>
            getItemLocalString(option.label, defaultString: option.name) ==
            viewValue)
        .map((option) => option.name)
        .firstOrNull;
  }
}
