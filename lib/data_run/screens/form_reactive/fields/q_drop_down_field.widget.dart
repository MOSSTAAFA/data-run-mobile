import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class QDropDownField extends HookConsumerWidget {
  const QDropDownField({super.key, required this.element});

  final FieldInstance<String?> element;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final elementConfig = useState(element.properties);
    final formOptionsMap =
        ref.watch(formInstanceProvider).requireValue.formOptionsMap;

    return ReactiveDropdownField<String?>(
      readOnly: elementConfig.value.readonly,
      // formControl: element.elementControl,
      formControlName: element.name,
      validationMessages: element.validationMessages,
      decoration: InputDecoration(labelText: element.properties.label),
      items: formOptionsMap[element.listName]
          ?.map((option) => DropdownMenuItem<String>(
              value: option.name,
              child: Text(
                getItemLocalString(option.label, defaultString: option.name),
              )))
          .toList() ?? [],
    );
  }
}
