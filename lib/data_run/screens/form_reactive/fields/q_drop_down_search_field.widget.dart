import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form_reactive/inherited_widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QDropDownSearchField extends HookConsumerWidget {
  const QDropDownSearchField({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formOptionsMap =
        ref.watch(formInstanceProvider).requireValue.formOptionsMap;

    final section = SectionInheritedWidget.of(context);
    final pathR = section.pathRecursive;
    final pathBu = section.pathBuilder(element.name);
    final pathBu2 = section.elementPath;
    final formControl = section.elementControl;
    final forfmControl = formControl;
    return ReactiveDropdownSearchMultiSelection<String, String>(
      // formControl: element.elementControl as FormControl<List<String>>,
      formControlName: element.name,
      validationMessages: element.validationMessages,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          labelText: element.properties.label,
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
      items: formOptionsMap[element.listName]
          ?.map((option) => getItemLocalString(option.label))
          .toList() ?? [],
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
