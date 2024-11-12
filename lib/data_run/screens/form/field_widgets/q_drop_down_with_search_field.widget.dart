import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:datarun/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:datarun/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:datarun/data_run/utils/get_item_local_string.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QDropDownWithSearchField extends HookConsumerWidget {
  const QDropDownWithSearchField({super.key, required this.element});

  final FieldInstance<String> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return getAutoComplete(element.visibleOption, context, ref);
  }

  getAutoComplete(
      List<FormOption> options, BuildContext context, WidgetRef ref) {
    final formInstance = ref
        .watch(
            formInstanceProvider(formMetadata: FormMetadataWidget.of(context)))
        .requireValue;
    return ReactiveDropdownSearch<String, String>(
      formControl: formInstance.form.control(element.pathRecursive)
          as FormControl<String>,
      clearButtonProps: const ClearButtonProps(isVisible: true),
      validationMessages: validationMessages(context),
      valueAccessor: NameToLabelValueAccessor(options),
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
      items: options
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
