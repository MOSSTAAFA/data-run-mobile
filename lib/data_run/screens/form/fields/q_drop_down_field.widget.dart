import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/form_metadata_inherit_widget.dart';
import 'package:mass_pro/data_run/screens/form/model/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/model/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/model/form_instance.provider.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QDropDownField extends HookConsumerWidget {
  const QDropDownField({super.key, required this.element});

  final FieldInstance<String?> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elementConfig = useState(element.properties);
    final formOptionsMap = ref
        .watch(
            formInstanceProvider(formMetaData: FormMetadataWidget.of(context)))
        .requireValue
        .formOptionsMap;

    final fieldOptions = formOptionsMap[element.listName]
      ?..sort((a, b) => (a.order).compareTo(b.order));
    // return getNormalDropdown(fieldOptions ?? []);
    return getAutoComplete(fieldOptions ?? [], context);
  }

  getAutoComplete(List<FormOption> options, BuildContext context) {
    return ReactiveDropdownSearch<String, String>(
      formControlName: element.name,
      validationMessages: validationMessages(context),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: element.properties.label,
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

  getNormalDropdown(List<FormOption> options, BuildContext context) {
    return ReactiveDropdownField<String?>(
      formControlName: element.name,
      validationMessages: validationMessages(context),
      decoration: InputDecoration(labelText: element.properties.label),
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
