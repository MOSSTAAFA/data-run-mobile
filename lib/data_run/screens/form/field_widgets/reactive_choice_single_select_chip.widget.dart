import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/validation/form_element_validator.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/custom_reactive_widget/reactive_chip_option.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/custom_reactive_widget/reactive_choice_chips.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';

class QReactiveChoiceSingleSelectChips extends StatelessWidget {
  QReactiveChoiceSingleSelectChips({super.key, required this.element});

  FieldInstance<String> element;

  @override
  Widget build(BuildContext context) {
    return ReactiveChoiceChips<String>(
      formControl: element.elementControl,
      validationMessages: validationMessages(context),
      selectedColor: Theme.of(context).colorScheme.error.withAlpha(100),
      options: _getChipOptions(element.visibleOption, wide: true),
      decoration: InputDecoration(
        enabled: element.elementControl!.enabled,
        // border: const OutlineInputBorder(gapPadding: 20),
        // contentPadding: const EdgeInsets.all(16),
        labelText: element.label,
      ),
    );
  }

  List<ReactiveChipOption<String>> _getChipOptions(List<FormOption> options,
      {bool? wide}) {
    return options
        .map((FormOption option) => ReactiveChipOption<String>(
              value: option.name,
              child: wide ?? false
                  ? Container(
                      padding: const EdgeInsets.all(0.4),
                      child: Column(children: <Widget>[
                        Text(getItemLocalString(option.label))
                      ]))
                  : Text(getItemLocalString(option.label)),
            ))
        .toList();
  }
}
