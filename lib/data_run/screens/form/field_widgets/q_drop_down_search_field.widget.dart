import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_template_inherit_widget.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';

class QDropDownSearchField extends HookConsumerWidget {
  const QDropDownSearchField({super.key, required this.element});

  final FieldInstance<List<String>> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formFlatTemplate = FormFlatTemplateInheritWidget.of(context);

    final fieldOptions = formFlatTemplate.optionLists[element.listName];

    return ReactiveDropdownSearchMultiSelection(
      formControl: element.elementControl,
      validationMessages: validationMessages(context),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: element.label,
          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          border: OutlineInputBorder(),
        ),
      ),
      popupProps: PopupPropsMultiSelection.menu(
        showSelectedItems: true,
        // disabledItemFn: (s) {
        //   return s.startsWith('I');
        // },
      ),
      items: fieldOptions
              ?.map((option) => getItemLocalString(option.label))
              .toSet()
              .toList() ??
          [],
      /*const [
        "Brazil",
        "Italia (Disabled)",
        "Tunisia",
        'Canada'
      ],*/
      showClearButton: true,
    );
  }
}
