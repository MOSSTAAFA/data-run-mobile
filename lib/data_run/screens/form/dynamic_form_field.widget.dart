import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mass_pro/data_run/screens/form/form_input_field.model.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';

class DynamicFormFieldWidget extends StatelessWidget {
  const DynamicFormFieldWidget({super.key, required this.fieldModel});

  final FormFieldModel fieldModel;

  @override
  Widget build(BuildContext context) {
    if (!fieldModel.isVisible) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        _buildFormField(context, fieldModel),
        if (fieldModel.isLoading)
          const Positioned(
            top: 0,
            right: 0,
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
      ],
    );
  }

  Widget _buildFormField(BuildContext context, FormFieldModel fieldModel) {
    switch (fieldModel.valueType) {
      case ValueType.Text:
      case ValueType.Number:
      case ValueType.Email:
      case ValueType.Letter:
      case ValueType.LongText:
        return FormBuilderTextField(
            name: fieldModel.uid,
            // controller: fieldModel.controller,
            enabled: fieldModel.isEditable,
            validator: fieldModel.isMandatory
                ? FormBuilderValidators.required()
                : null,
            maxLength: _getMaxLength(fieldModel.valueType),
            maxLines: fieldModel.valueType == ValueType.Letter ? 7 : null,
            decoration: InputDecoration(
                labelText: fieldModel.label,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                )),
            // onChanged: (value) => fieldModel.setValue(value),
            keyboardType: _getInputType(fieldModel.valueType));
      case ValueType.Boolean:
        return FormBuilderSwitch(
          name: fieldModel.uid,
          enabled: fieldModel.isEditable,
          initialValue: fieldModel.value?.toLowerCase() == 'true',
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.only(left: 20, top: 40),
              labelText: fieldModel.label,
              icon: const Icon(Icons.access_alarm_outlined),
              fillColor: Colors.red.shade200),
          onChanged: (bool? value) {
            // fieldModel.controller?.text = value.toString();
          },
          title: Text(fieldModel.label),
        );
      case ValueType.Date:
      case ValueType.DateTime:
      case ValueType.Time:
        final inputType = fieldModel.valueType == ValueType.Date
            ? InputType.date
            : fieldModel.valueType == ValueType.Time
                ? InputType.time
                : InputType.both;
        return FormBuilderDateTimePicker(
            name: fieldModel.uid,
            enabled: fieldModel.isEditable,
            validator: fieldModel.isMandatory
                ? FormBuilderValidators.required()
                : null,
            initialEntryMode: DatePickerEntryMode.calendar,
            // initialValue: fieldModel.controller?.text.toDate(),
            inputType: inputType,
            onChanged: (DateTime? pickedDate) {
              if (pickedDate != null) {
                // fieldModel.controller?.text =
                //     sdk.DateUtils.databaseDateFormat().format(pickedDate);
              }
            },
            decoration: InputDecoration(
              labelText: fieldModel.label,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
            ));
      case ValueType.SelectOne:
        return FormBuilderRadioGroup<String?>(
          name: fieldModel.uid,
          enabled: fieldModel.isEditable,
          validator:
              fieldModel.isMandatory ? FormBuilderValidators.required() : null,
          // initialValue: (fieldModel.controller?.text ?? '').isNotEmpty
          //     ? fieldModel.controller!.text
          //     : null,
          options: _getFieldOptions(fieldModel.options!.unlock),
          wrapSpacing: 10.0,
          orientation: _getOptionsOrientation(fieldModel),
          wrapRunSpacing: 10.0,
          onChanged: (String? value) {
            if (value != null) {
              // fieldModel.controller?.text = value;
            }
          },
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.only(left: 20, top: 40),
              labelText: fieldModel.label,
              icon: const Icon(Icons.access_alarm_outlined),
              fillColor: Colors.red.shade200),
          itemDecoration: BoxDecoration(
              color: Colors.blueGrey.shade200,
              border: Border.all(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(5.0)),
        );
      default:
        return const Text('Unsupported field type');
    }
  }

  TextInputType _getInputType(ValueType? type) {
    if (type == ValueType.Number) {
      return TextInputType.number;
    }
    if (type == ValueType.Email) {
      return TextInputType.emailAddress;
    }
    return TextInputType.text;
  }

  int? _getMaxLength(ValueType? type) {
    if (type == ValueType.Text) {
      return 255;
    }
    if (type == ValueType.LongText || type == ValueType.Letter) {
      return 2000;
    }
    return null;
  }

  OptionsOrientation _getOptionsOrientation(FormFieldModel field) {
    switch (field.fieldRendering) {
      case ValueTypeRenderingType.VERTICAL_RADIOBUTTONS:
      case ValueTypeRenderingType.VERTICAL_CHECKBOXES:
        return OptionsOrientation.vertical;
      case ValueTypeRenderingType.HORIZONTAL_RADIOBUTTONS:
      case ValueTypeRenderingType.HORIZONTAL_CHECKBOXES:
        return OptionsOrientation.horizontal;
      default:
        return OptionsOrientation.wrap;
    }
  }

  List<FormBuilderFieldOption<T>> _getFieldOptions<T>(List<T> options) {
    return options
        .map((option) => FormBuilderFieldOption(
              value: option,
              child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text(option.toString().toUpperCase()),
                      const Icon(Icons.airplanemode_on)
                    ],
                  )),
            ))
        .toList();
  }
}
