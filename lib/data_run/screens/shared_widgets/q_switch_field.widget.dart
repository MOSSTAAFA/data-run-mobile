import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/data_run/screens/form/fields_widgets/q_field.model.dart';

class QSwitchField extends StatelessWidget {
  const QSwitchField({super.key, required this.fieldModel});

  final QFieldModel fieldModel;

  @override
  Widget build(BuildContext context) {
    return FormBuilderSwitch(
      key: ValueKey(fieldModel.uid),
      name: fieldModel.uid,
      enabled: fieldModel.isEditable,
      initialValue: fieldModel.value.toBoolean(),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.only(left: 20, top: 40),
        labelText: fieldModel.label,
        icon: const Icon(Icons.access_alarm_outlined),
        fillColor: Colors.red.shade200,
      ),
      onChanged: (bool? value) {
        fieldModel.onTextChange(value?.toString());
        if (value != null) {
          fieldModel.onSaveBoolean(value);
        }
      },
      title: Text(fieldModel.label),
    );
  }
}
