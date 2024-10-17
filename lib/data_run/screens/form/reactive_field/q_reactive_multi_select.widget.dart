import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_metadata_inherit_widget.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/reactive_drop_down/src/q_reactive_dropdown_search_multiselection.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';

class QReactiveMultiSelect extends HookConsumerWidget {
  const QReactiveMultiSelect({
    super.key,
    required this.element,
  });

  final FormFieldElement<List<String>> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final element = FieldElementInheritedWidget.of(context);

    final formOptionsMap = ref
        .watch(
            formInstanceProvider(formMetaData: FormMetadataWidget.of(context)))
        .requireValue
        .formOptionsMap;
    final fieldOptions = formOptionsMap[element.listName]
      ?..sort((a, b) => (a.order).compareTo(b.order));

    return QReactiveDropdownSearchMultiSelection<String, String>(
      element: element,
      validationMessages: validationMessages(context),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: element.label,
          enabled: (element.elementControl?.enabled ?? false),
          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          border: OutlineInputBorder(),
        ),
      ),
      popupProps: PopupPropsMultiSelection.menu(showSelectedItems: true),
      items: fieldOptions
              ?.map((option) => getItemLocalString(option.label))
              .toSet()
              .toList() ??
          [],
      showClearButton: true,
    );
  }
}
