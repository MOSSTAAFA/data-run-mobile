import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/form/fields_widgets/q_field.model.dart';
import 'package:mass_pro/data_run/screens/form/fields_widgets/q_field.model.extension.dart';
import 'package:mass_pro/data_run/screens/form/fields_widgets/q_field_validator.dart';
import 'package:mass_pro/data_run/screens/form/form_state/form_fields_state_notifier.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';


class QTextField extends StatelessWidget {

  const QTextField({super.key, required this.fieldModel});
  final QFieldModel fieldModel;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      key: ValueKey(fieldModel.uid),
      textInputAction: fieldModel.inputAction,
      name: fieldModel.uid,
      initialValue: fieldModel.value,
      enabled: fieldModel.isEditable,
      validator: QFieldValidators.getValidators(fieldModel),
      maxLength: fieldModel.maxLength,
      maxLines: fieldModel.valueType == ValueType.Letter ? 7 : null,
      decoration: InputDecoration(
        labelText: fieldModel.label,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        hintText: fieldModel.hint,
        errorText: fieldModel.error,
      ),
      onChanged: fieldModel.onTextChange,
      keyboardType: fieldModel.inputType,
    );
  }
}

