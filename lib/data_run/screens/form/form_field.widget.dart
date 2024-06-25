import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/commons/date/date_utils.dart' as sdk;
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/data_run/form/form_input_field.model.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';

class FormFieldWidget extends ConsumerWidget {
  final FormFieldModel fieldModel;

  final int fieldModelIndex;

  const FormFieldWidget(
      {Key? key, required this.fieldModel, required this.fieldModelIndex})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexedFieldModel = ref.watch(fieldInputModelNotifierProvider(fieldModelIndex));

    /// maybe listen to dependent field value
    /// and show or hide
    indexedFieldModel.maybeWhen(
      data: (FormFieldModel data) {
        return Visibility(
          child: Stack(
            children: [
              _buildFormField(context, data),
              if (indexedFieldModel.isLoading)
                Positioned(
                  top: 0,
                  right: 0,
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
            ],
          ),
        );
      },
      error: (Object e, _) => Center(
        child: Text(
          e.toString(),
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.red),
        ),
      ),
      orElse: () {},
    );

    return Visibility(
      visible: fieldModel.isVisible,
      child: Stack(
        children: [
          _buildFormField(context, fieldModel),
          if (fieldModel.isLoading)
            Positioned(
              top: 0,
              right: 0,
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        ],
      ),
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
            name: fieldModel.key,
            controller: fieldModel.controller,
            maxLength: _getMaxLength(fieldModel.valueType),
            maxLines: fieldModel.valueType == ValueType.Letter ? 7 : null,
            decoration: InputDecoration(
                labelText: fieldModel.label,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                )),
            keyboardType: _getInputType(fieldModel.valueType));

      case ValueType.Boolean:
        return FormBuilderSwitch(
          name: fieldModel.key,
          initialValue: fieldModel.controller.text.toBoolean(),
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.only(left: 20, top: 40),
              labelText: 'hello there',
              icon: const Icon(Icons.access_alarm_outlined),
              fillColor: Colors.red.shade200),
          selected: fieldModel.controller.text == 'true',
          onChanged: (bool? value) {
            fieldModel.controller.text = value.toString();
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
            name: fieldModel.key,
            initialEntryMode: DatePickerEntryMode.calendar,
            initialValue: fieldModel.controller.text.toDate(),
            inputType: inputType,
            onChanged: (DateTime? pickedDate) {
              if (pickedDate != null) {
                fieldModel.controller.text =
                    sdk.DateUtils.databaseDateFormat().format(pickedDate);
              }
            },
            decoration: InputDecoration(
              labelText: fieldModel.label,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
            )
            // locale: const Locale.fromSubtags(languageCode: 'fr'),
            );
      case ValueType.SelectOne:
        return FormBuilderRadioGroup<String?>(
          name: fieldModel.key,
          initialValue: fieldModel.controller.text.isNotEmpty
              ? fieldModel.controller.text
              : null,
          options: _getFieldOptions(fieldModel.options!),
          wrapSpacing: 10.0,
          orientation: _getOptionsOrientation(fieldModel),
          wrapRunSpacing: 10.0,
          onChanged: (String? value) {
            if (value != null) {
              fieldModel.controller.text = value;
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
    if (type?.isNumeric ?? false) {
      return TextInputType.number;
    }
    if (type == ValueType.Email) {
      return TextInputType.emailAddress;
    }
    return TextInputType.text;
  }

  ///maxLengthEnforcement
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

  List<FormBuilderFieldOption<T>> _getFieldOptions<T>(IList<T> options) {
    return options
        .map((option) => FormBuilderFieldOption(
              value: option,
              child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text(option.toString().toUpperCase()),

                      /// will be later decided based on a field property in the
                      /// fieldModel
                      const Icon(Icons.airplanemode_on)
                    ],
                  )),
            ))
        .toList();
  }
}
