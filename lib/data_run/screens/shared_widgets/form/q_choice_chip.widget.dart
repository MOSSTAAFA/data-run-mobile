import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mass_pro/data_run/screens/form/fields_widgets/q_field.model.dart';

class QChoiceChip extends StatelessWidget {
  const QChoiceChip({super.key, required this.fieldModel});

  final QFieldModel fieldModel;

  @override
  Widget build(BuildContext context) {
    return FormBuilderChoiceChip<String>(
      key: ValueKey(fieldModel.uid),
      selectedColor: Colors.lightGreenAccent,
      onReset: () => fieldModel.onClear(),
      name: fieldModel.uid,
      enabled: fieldModel.isEditable,
      validator:
          fieldModel.isMandatory ? FormBuilderValidators.required() : null,
      initialValue:
          (fieldModel.value ?? '').isNotEmpty ? fieldModel.value : null,
      options: _getChipOptions(fieldModel.options!.unlock, wide: true),
      onChanged: (String? value) {
        if (value != null) {
          fieldModel.onSaveOption(value);
        }
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.only(left: 10, top: 30),
        labelText: fieldModel.label,
        labelStyle: Theme.of(context).textTheme.headlineSmall,
        fillColor: Colors.red.shade200,
      ),
    );
  }

  List<FormBuilderChipOption<T>> _getChipOptions<T>(List<T> options,
      {bool? wide}) {
    return options
        .map((option) => FormBuilderChipOption(
              value: option,
              avatar: !(wide ?? false)
                  ? const CircleAvatar(child: Icon(Icons.airplanemode_on))
                  : null,
              child: wide ?? false
                  ? Container(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text(option.toString().toUpperCase()),
                          const Icon(Icons.airplanemode_on),
                        ],
                      ))
                  : null,
            ))
        .toList();
  }
}
