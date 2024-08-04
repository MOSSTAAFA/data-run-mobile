import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mass_pro/data_run/form/map_field_value_to_user.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';

class DynamicFormFieldWidget extends StatelessWidget {
  const DynamicFormFieldWidget({super.key, required this.fieldModel});

  final QFieldModel fieldModel;

  @override
  Widget build(BuildContext context) {
    if (!fieldModel.isVisible) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: <Widget>[
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

  Widget _buildFormField(BuildContext context, QFieldModel fieldModel) {
    switch (fieldModel.valueType) {
      case ValueType.Text:
      case ValueType.Number:
      case ValueType.Email:
      case ValueType.Letter:
      case ValueType.LongText:
        return FormBuilderTextField(
            name: fieldModel.uid,
            // controller: fieldModel.controller,
            valueTransformer: (String? value) {
              if (fieldModel.valueType?.isNumeric ?? false) {
                return mapFieldToValueType(
                    value: fieldModel.value,
                    values: fieldModel.values,
                    valueType: fieldModel.valueType?.name);
              }
            },
            enabled: fieldModel.isEditable,
            validator: fieldModel.isMandatory
                ? FormBuilderValidators.required()
                : null,
            maxLength: _getMaxLength(fieldModel.valueType),
            maxLines: fieldModel.valueType == ValueType.Letter ? 7 : null,
            decoration: InputDecoration(
                labelText: fieldModel.label,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0),
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
        final InputType inputType = fieldModel.valueType == ValueType.Date
            ? InputType.date
            : fieldModel.valueType == ValueType.Time
                ? InputType.time
                : InputType.both;
        return FormBuilderDateTimePicker(
            name: fieldModel.uid,
            enabled: fieldModel.isEditable,
            valueTransformer: (DateTime? date) => date != null
                ? sdk.DateUtils.databaseDateFormat().format(date.toUtc())
                : null,
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
                borderSide: BorderSide(width: 2.0),
              ),
            ));
      case ValueType.SelectOne:
        return FormBuilderChoiceChip<FormOption?>(
          name: fieldModel.uid,
          enabled: fieldModel.isEditable,
          valueTransformer: (FormOption? option) => option?.name,
          validator:
              fieldModel.isMandatory ? FormBuilderValidators.required() : null,
          // initialValue: (fieldModel.controller?.text ?? '').isNotEmpty
          //     ? fieldModel.controller!.text
          //     : null,
          options: _getFieldOptions(fieldModel.options!.unlock),
          onChanged: (FormOption? value) {
            if (value != null) {
              // fieldModel.controller?.text = value;
            }
          },
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

  OptionsOrientation _getOptionsOrientation(QFieldModel field) {
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

  // List<FormBuilderFieldOption<FormOption>> _getFieldOptions(
  //     List<FormOption> options) {
  //   return options
  //       .map((option) => FormBuilderFieldOption<FormOption>(
  //             value: option,
  //             child: Container(
  //                 padding: const EdgeInsets.all(5.0),
  //                 child: Column(
  //                   children: [
  //                     Text(getItemLocalString(option.label)),
  //                     Icon(getRandomIcon(option.name))
  //                   ],
  //                 )),
  //           ))
  //       .toList();
  // }

  List<FormBuilderChipOption<FormOption>> _getFieldOptions(
      List<FormOption> options,
      {bool? wide}) {
    return options
        .map((FormOption option) => FormBuilderChipOption<FormOption>(
              value: option,
              child: wide ?? false
                  ? Container(
                      padding: const EdgeInsets.all(1.0),
                      child: Column(
                        children: <Widget>[
                          Text(getItemLocalString(option.label)),
                        ],
                      ))
                  : Text(getItemLocalString(option.label)),
            ))
        .toList();
  }
}
