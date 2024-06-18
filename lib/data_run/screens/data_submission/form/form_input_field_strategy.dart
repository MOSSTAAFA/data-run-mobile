import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/form_input_field.model.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';

/// Signature for validating a form field.
///
/// Returns an error string to display if the input is invalid, or null
/// otherwise.
typedef FieldValidator<T> = String? Function(T? value);

class FormInputFieldContext {
  const FormInputFieldContext({required this.field});

  final FieldInputModel field;

  FormInputFieldStrategy getFormInputFieldStrategy(FieldInputModel field) {
    return when(field.valueType, {
      [ValueType.Text, ValueType.Number]: () => TextFieldStrategy(),
      ValueType.SelectMulti: () => CheckboxGroupFieldStrategy(),
      ValueType.SelectOne: () => RadioGroupFieldStrategy(),
      ValueType.Date: () => DateFieldStrategy(),
    }).orElse(() => UnknownFieldStrategy());
  }
}

abstract class FormInputFieldStrategy {
  Widget buildField(FieldInputModel field, Map<String, dynamic> formState);

  TextInputType _getInputType(ValueType? type) {
    if (type?.isNumeric ?? false) {
      return TextInputType.number;
    }
    if (type == ValueType.Email) {
      return TextInputType.emailAddress;
    }
    return TextInputType.text;
  }

  OptionsOrientation _getOptionsOrientation(FieldInputModel field) {
    final orientation = when(field.fieldRendering, {
      [
        ValueTypeRenderingType.VERTICAL_RADIOBUTTONS,
        ValueTypeRenderingType.VERTICAL_CHECKBOXES
      ]: () => OptionsOrientation.vertical,
      [
        ValueTypeRenderingType.HORIZONTAL_RADIOBUTTONS,
        ValueTypeRenderingType.HORIZONTAL_CHECKBOXES
      ]: () => OptionsOrientation.horizontal,
    }).orElse(() => OptionsOrientation.wrap);
    return orientation;
  }
}

class UnknownFieldStrategy with FormInputFieldStrategy {
  @override
  Widget buildField(FieldInputModel field, Map<String, dynamic> formState) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Field Type [${field.valueType}] does not exist.',
        style: const TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TextFieldStrategy with FormInputFieldStrategy {
  @override
  Widget buildField(FieldInputModel field, Map<String, dynamic> formState) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: FormBuilderTextField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          name: field.key,
          decoration: InputDecoration(
              labelText: field.label,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              )),
          keyboardType: _getInputType(field.valueType)),
    );
  }
}

class DateFieldStrategy with FormInputFieldStrategy {
  @override
  Widget buildField(FieldInputModel field, Map<String, dynamic> formState) {
    return FormBuilderDateTimePicker(
        name: field.key,
        initialEntryMode: DatePickerEntryMode.calendar,
        initialValue: DateTime.now(),
        inputType: InputType.both,
        decoration: InputDecoration(
          labelText: field.label,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          // suffixIcon: IconButton(
          //   icon: const Icon(Icons.close),
          //   onPressed: onClear,
          // ),
        ),
        initialTime: const TimeOfDay(hour: 8, minute: 0)
        // locale: const Locale.fromSubtags(languageCode: 'fr'),
        );
  }
}

class RadioGroupFieldStrategy with FormInputFieldStrategy {
  @override
  Widget buildField(FieldInputModel field, Map<String, dynamic> formState) {
    final List<FormBuilderFieldOption>? options = field.options
        ?.map((option) => FormBuilderFieldOption(
              value: option,
              child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text(field.label),
                      const Icon(Icons.airplanemode_on),
                      SizedBox(width: 0.0 /*forceMinWidth*/, height: 0.0),
                    ],
                  )),
            ))
        .toList();
    return FormBuilderRadioGroup(
      name: field.key,
      options: options!,
      wrapSpacing: 10.0,
      orientation: _getOptionsOrientation(field),
      wrapRunSpacing: 10.0,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.only(left: 20, top: 40),
          labelText: 'hello there',
          icon: const Icon(Icons.access_alarm_outlined),
          fillColor: Colors.red.shade200),
      itemDecoration: BoxDecoration(
          color: Colors.blueGrey.shade200,
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(5.0)),
    );
  }
}

class CheckboxGroupFieldStrategy with FormInputFieldStrategy {
  @override
  Widget buildField(FieldInputModel field, Map<String, dynamic> formState) {
    final List<FormBuilderFieldOption>? options = field.options
        ?.map((option) => FormBuilderFieldOption(
              value: option,
              child: Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text(field.label),
                      const Icon(Icons.airplanemode_on),
                      SizedBox(width: 0.0 /*forceMinWidth*/, height: 0.0),
                    ],
                  )),
            ))
        .toList();
    return FormBuilderCheckboxGroup(
      name: field.key,
      options: options!,
      wrapSpacing: 5.0,
      orientation: _getOptionsOrientation(field),
      itemDecoration: BoxDecoration(
          color: Colors.grey.shade300,
//                border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(5.0)),
    );
  }
}

class DropdownFieldStrategy with FormInputFieldStrategy {
  @override
  Widget buildField(FieldInputModel field, Map<String, dynamic> formState) {
    return FormBuilderDropdown(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      name: field.key,
      decoration: InputDecoration(
          labelText: field.label,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          )),
      items: field.options!
          .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem(
              value: value,
              child: Text(value),
            ),
          )
          .toList(),
    );
  }
}
