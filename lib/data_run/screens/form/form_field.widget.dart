import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mass_pro/commons/date/date_utils.dart' as sdk;
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/data_run/screens/form/form_input_field.model.dart';
import 'package:mass_pro/data_run/screens/form/form_state/focus_manager.dart';
import 'package:mass_pro/data_run/screens/form/form_state/form_state_notifier.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/form/ui/view_model/form_pending_intents.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';

class FormFieldWidget extends ConsumerStatefulWidget {
  const FormFieldWidget({super.key, required this.fieldIndex});

  final int fieldIndex;

  @override
  ConsumerState<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends ConsumerState<FormFieldWidget> {
  void onIntent(FormIntent intent) {
    FormIntent formIntent = intent;
    if (intent is OnNext) {
      formIntent = intent.copyWith(position: widget.fieldIndex);
    }

    ref
        .read(formPendingIntentsProvider.notifier)
        .submitIntent((current) => formIntent);
  }

  Widget buildFormField(FormFieldModel fieldModel) {
    final focusManager = ref.watch(focusManagerProvider);
    focusManager.addFocusListener(widget.fieldIndex, fieldModel);

    switch (fieldModel.valueType) {
      case ValueType.Text:
      case ValueType.Number:
      case ValueType.Email:
      case ValueType.Letter:
      case ValueType.LongText:
        return FormBuilderTextField(
            name: fieldModel.uid,
            focusNode:
                ref.watch(focusManagerProvider).getFocusNode(widget.fieldIndex),
            // controller: fieldModel.controller,
            enabled: fieldModel.isEditable,
            textInputAction: _getInputAction(fieldModel.keyboardActionType),
            validator: fieldModel.isMandatory
                ? FormBuilderValidators.required()
                : null,
            maxLength: _getMaxLength(fieldModel.valueType),
            maxLines: fieldModel.valueType == ValueType.Letter ? 7 : null,
            decoration: InputDecoration(
                labelText: fieldModel.label,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                hintText: fieldModel.hint,
                errorText: fieldModel.error),
            onChanged: fieldModel.onTextChange,
            onTapOutside: (PointerDownEvent event) {
              debugPrint('####Debug FormBuilderTextField.onTapOutside: $event');
            },
            onSubmitted: (value) {
              debugPrint('####Debug FormBuilderTextField.onSubmitted: $value');
            },
            keyboardType: _getInputType(fieldModel.valueType));
      case ValueType.Boolean:
        return FormBuilderSwitch(
          name: fieldModel.uid,
          focusNode:
              ref.watch(focusManagerProvider).getFocusNode(widget.fieldIndex),
          enabled: fieldModel.isEditable,
          initialValue: fieldModel.value?.toLowerCase() == 'true',
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.only(left: 20, top: 40),
              labelText: fieldModel.label,
              icon: const Icon(Icons.access_alarm_outlined),
              fillColor: Colors.red.shade200),

          onChanged: (bool? value) {
            fieldModel.onTextChange(value?.toString());
            fieldModel.onSaveOption(option)
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
            format: sdk.DateUtils.uiDateFormat(),
            focusNode:
                ref.watch(focusManagerProvider).getFocusNode(widget.fieldIndex),
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
                fieldModel.onTextChange(
                    sdk.DateUtils.databaseDateFormat().format(pickedDate));
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
          focusNode:
              ref.watch(focusManagerProvider).getFocusNode(widget.fieldIndex),
          enabled: fieldModel.isEditable,
          validator:
              fieldModel.isMandatory ? FormBuilderValidators.required() : null,
          initialValue:
              (fieldModel.value ?? '').isNotEmpty ? fieldModel.value : null,
          options: _getFieldOptions(fieldModel.options!.unlock),
          wrapSpacing: 10.0,
          orientation: _getOptionsOrientation(fieldModel),
          wrapRunSpacing: 10.0,
          onChanged: (String? value) {
            if (value != null) {
              fieldModel.onTextChange(value);
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

  @override
  Widget build(BuildContext context) {
    final indexedFieldModel =
        ref.watch(indexedFieldInputProvider(widget.fieldIndex));

    return indexedFieldModel.when(
      data: (FormFieldModel fieldModel) {
        final fieldWithIntentCallback =
            fieldModel.copyWith(intentCallback: onIntent);
        return Visibility(
            visible: fieldModel.isVisible,
            child: Stack(
              children: [
                buildFormField(fieldWithIntentCallback),
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
            ));
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
      loading: () => const CircularProgressIndicator(strokeWidth: 4),
    );
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

  TextInputType? _getInputType(ValueType? valueType) {
    return when(valueType, {
      ValueType.Text: () => TextInputType.text,
      ValueType.LongText: () => TextInputType.multiline,
      ValueType.Letter: () => TextInputType.text,
      ValueType.Number: () =>
          const TextInputType.numberWithOptions(decimal: true, signed: true),
      ValueType.UnitInterval: () =>
          const TextInputType.numberWithOptions(decimal: true),
      ValueType.Percentage: () => TextInputType.number,
      [ValueType.IntegerNegative, ValueType.Integer]: () =>
          const TextInputType.numberWithOptions(signed: true),
      [ValueType.IntegerPositive, ValueType.IntegerZeroOrPositive]: () =>
          TextInputType.number,
      ValueType.PhoneNumber: () => TextInputType.phone,
      ValueType.Email: () => TextInputType.emailAddress,
      ValueType.URL: () => TextInputType.url,
    });
  }

  TextInputAction? _getInputAction(KeyboardActionType? type) {
    if (type != null) {
      return when(type, {
        KeyboardActionType.NEXT: () => TextInputAction.next,
        KeyboardActionType.DONE: () => TextInputAction.done,
        KeyboardActionType.ENTER: () => TextInputAction.none
      });
    }
    return null;
  }
}
