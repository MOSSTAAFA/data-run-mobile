import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mass_pro/data_run/screens/form/form_state/q_field.model.dart';

class QChoiceChip extends StatefulWidget {
  const QChoiceChip({super.key, required this.fieldModel});

  final QFieldModel fieldModel;

  @override
  State<QChoiceChip> createState() => _QChoiceChipState();
}

class _QChoiceChipState extends State<QChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderChoiceChip<String>(
      key: ValueKey(widget.fieldModel.uid),
      selectedColor: Colors.lightGreenAccent,
      onReset: () => widget.fieldModel.onClear(),
      name: widget.fieldModel.uid,
      enabled: widget.fieldModel.isEditable,
      validator:
          widget.fieldModel.isMandatory ? FormBuilderValidators.required() : null,
      initialValue:
          (widget.fieldModel.value ?? '').isNotEmpty ? widget.fieldModel.value : null,
      options: _getChipOptions(widget.fieldModel.options!.unlock, wide: true),
      onChanged: (String? value) {
        // if (value != null) {
          widget.fieldModel.onSaveOption(value);
        // }
      },

      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.only(left: 10, top: 30),
        labelText: widget.fieldModel.label,
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
