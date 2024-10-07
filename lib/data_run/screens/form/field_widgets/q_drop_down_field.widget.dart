import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:rxdart/streams.dart';

class QDropDownField extends HookConsumerWidget {
  const QDropDownField({super.key, required this.element});

  final FieldInstance<String?> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredOptions =
        useStream(element.filterChanged, initialData: element.template.options);

    return ReactiveDropdownSearch<String, String>(
      formControlName: element.name,
      clearButtonProps: const ClearButtonProps(isVisible: true),
      validationMessages: validationMessages(context),
      valueAccessor: NameToLabelValueAccessor(filteredOptions.data!),
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
      items: filteredOptions.data!
          .map((option) => getItemLocalString(option.label))
          .toSet()
          .toList() ??
          [],
      showClearButton: true,
    );
  }

  getNormalDropdown(List<FormOption> options, BuildContext context) {
    return ReactiveDropdownField<String?>(
      formControlName: element.name,
      validationMessages: validationMessages(context),
      decoration:
          InputDecoration(labelText: element.label, enabled: element.enabled),
      items: options
          .map((option) => DropdownMenuItem<String>(
              value: option.name,
              child: Text(
                getItemLocalString(option.label, defaultString: option.name),
                overflow: TextOverflow.fade,
                maxLines: 2,
              )))
          .toSet()
          .toList(),
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
