import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/commons/extensions/list_extensions.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_template_inherit_widget.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';

class QDropDownField extends HookConsumerWidget {
  const QDropDownField({super.key, required this.element});

  final FieldInstance<String> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formFlatTemplate = FormFlatTemplateInheritWidget.of(context);

    final fieldOptions = formFlatTemplate
        .optionLists[element.listName];

    return getAutoComplete(fieldOptions ?? [], context);
  }

  getAutoComplete(List<FormOption> options, BuildContext context) {
    return ReactiveDropdownSearch<String, String>(
      formControl: element.elementControl,
      validationMessages: validationMessages(context),
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
              .toList() ??
          [],
      showClearButton: true,
    );
  }
}
