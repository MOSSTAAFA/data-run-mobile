import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:datarun/core/utils/get_item_local_string.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';

class QDropDownMultiSelectWithSearchField extends HookConsumerWidget {
  const QDropDownMultiSelectWithSearchField({super.key, required this.element});

  final FieldInstance<List<String>> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formInstance = ref
        .watch(
            formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
        .requireValue;
    return ReactiveDropdownSearchMultiSelection(
      formControl: formInstance.form.control(element.elementPath!)
          as FormControl<List<String>>,
      validationMessages: validationMessages(context),
      clearButtonProps: const ClearButtonProps(isVisible: true),
      valueAccessor: NameToLabelValueAccessor(options: element.visibleOption),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: element.label,
          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          border: OutlineInputBorder(),
        ),
      ),
      popupProps: PopupPropsMultiSelection.menu(
        showSelectedItems: true,
      ),
      items: element.visibleOption
          .map((option) => getItemLocalString(option.label.unlockView))
          .toSet()
          .toList(),
      showClearButton: true,
    );
  }
}

class NameToLabelValueAccessor
    extends DropDownSearchMultiSelectionValueAccessor<String, String> {
  final List<String> items;
  final List<FormOption> options;

  NameToLabelValueAccessor({this.items = const [], this.options = const []});

  @override
  List<String>? modelToViewValue(List<String> items, List<String>? modelValue) {
    return options
        .where((option) => option.name == modelValue)
        .map((option) =>
            getItemLocalString(option.label.unlockView, defaultString: option.name))
        .toList();
  }

  @override
  List<String>? viewToModelValue(List<String> items, List<String>? modelValue) {
    return options
        .where((option) =>
            modelValue?.contains(
                getItemLocalString(option.label.unlockView, defaultString: option.name)) ==
            true)
        .map((option) => option.name)
        .toList();
  }
}
