import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/form_fields_state_notifier.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/form/q_field_widget_factory.dart';
import 'package:mass_pro/form/ui/intent/form_intent.dart';
import 'package:mass_pro/form/ui/view_model/form_pending_intents.dart';

class FormFieldWidget extends ConsumerStatefulWidget {
  const FormFieldWidget({super.key, required this.fieldModel});

  final QFieldModel fieldModel;

  @override
  ConsumerState<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends ConsumerState<FormFieldWidget> {
  Widget getErrorWidget(Object e) {
    return Center(
      child: Text(
        e.toString(),
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.red),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final QFormFieldBuilder builder = ref
        .watch(fieldWidgetFactoryProvider)
        .getBuilder(widget.fieldModel.valueType);


    final fieldWidget =
        builder.call(widget.fieldModel.setCallback(intentCallback: onIntent));

    if (!widget.fieldModel.isVisible) {
      return const SizedBox.shrink();
    }

    return fieldWidget;
  }

  void onIntent(FormIntent intent) {
    // final FormIntent formIntent = intent;
    ref
        .read(formPendingIntentsProvider.notifier)
        .submitIntent((current) => intent);
  }

// /* Refactoring Suggestion:
// *  **3. Leverage State Management:** -
// * using multiple checks for `fieldModel.isEditable` throughout
// * the widget. Consider using a `Consumer` widget inside `buildFormField`
// * to access the latest value of `isEditable` from the state provider.
// * This avoids unnecessary checks and potential rebuilds.
// * */
// Widget buildFormField(QFieldModel fieldModel) {
//   switch (fieldModel.valueType) {
//     case ValueType.Text:
//     case ValueType.Number:
//     case ValueType.Email:
//     case ValueType.Letter:
//     case ValueType.LongText:
//       return FormBuilderTextField(
//           // valueTransformer: (text) => mapFieldToValueType(fieldModel),
//           key: ValueKey<String>(fieldModel.uid),
//           textInputAction: fieldModel.textInputAction,
//           name: fieldModel.uid,
//           autovalidateMode: fieldModel.valueType?.isNumeric ?? false
//               ? AutovalidateMode.onUserInteraction
//               : AutovalidateMode.disabled,
//           initialValue: fieldModel.value,
//           enabled: fieldModel.isEditable,
//           validator: QFieldValidators.getValidators(fieldModel),
//           maxLength: fieldModel.maxLength,
//           maxLines: fieldModel.valueType == ValueType.Letter ? 7 : null,
//           decoration: InputDecoration(
//               labelText: fieldModel.label,
//               focusedBorder: const OutlineInputBorder(
//                 borderSide: BorderSide(color: Colors.blue, width: 2.0),
//               ),
//               hintText: fieldModel.hint,
//               errorText: fieldModel.error),
//           onChanged: fieldModel.onTextChange,
//           onTapOutside: (PointerDownEvent event) {
//             debugPrint('####Debug FormBuilderTextField.onTapOutside: $event');
//           },
//           onSubmitted: (value) {
//             debugPrint('####Debug FormBuilderTextField.onSubmitted: $value');
//           },
//           keyboardType: fieldModel.inputType);
//     case ValueType.Boolean:
//       return FormBuilderSwitch(
//         key: ValueKey(fieldModel.uid),
//         name: fieldModel.uid,
//         enabled: fieldModel.isEditable,
//         initialValue: fieldModel.value.toBoolean(),
//         decoration: InputDecoration(
//             border: const OutlineInputBorder(),
//             contentPadding: const EdgeInsets.only(left: 20, top: 40),
//             labelText: fieldModel.label,
//             icon: const Icon(Icons.access_alarm_outlined),
//             fillColor: Colors.red.shade200),
//         onChanged: (bool? value) {
//           fieldModel.onTextChange(value?.toString());
//           if (value != null) {
//             fieldModel.onSaveBoolean(value);
//           }
//         },
//         title: Text(fieldModel.label),
//       );
//     case ValueType.Date:
//     case ValueType.DateTime:
//     case ValueType.Time:
//       final inputType = fieldModel.valueType == ValueType.Date
//           ? InputType.date
//           : fieldModel.valueType == ValueType.Time
//               ? InputType.time
//               : InputType.both;
//       return FormBuilderDateTimePicker(
//           key: ValueKey(fieldModel.uid),
//           format: sdk.DateUtils.uiDateFormat(),
//           initialValue: fieldModel.value.toDate(),
//           name: fieldModel.uid,
//           enabled: fieldModel.isEditable,
//           validator: fieldModel.isMandatory
//               ? FormBuilderValidators.required()
//               : null,
//           initialEntryMode: DatePickerEntryMode.calendar,
//           inputType: inputType,
//           onFieldSubmitted: (DateTime? pickedDate) {
//             if (pickedDate != null) {
//               debugPrint(
//                   '####Debug FormBuilderDateTimePicker.onFieldSubmitted:'
//                   ' $pickedDate');
//               fieldModel.onTextChange(
//                   sdk.DateUtils.databaseDateFormat().format(pickedDate));
//             }
//           },
//           onChanged: (DateTime? pickedDate) {
//             if (pickedDate != null) {
//               fieldModel.onTextChange(
//                   sdk.DateUtils.databaseDateFormat().format(pickedDate));
//             }
//           },
//           decoration: InputDecoration(
//             labelText: fieldModel.label,
//             focusedBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.blue, width: 2.0),
//             ),
//           ));
//     case ValueType.SelectOne:
//       // case ValueType.Boolean:
//       return FormBuilderChoiceChip<String>(
//         key: ValueKey(fieldModel.uid),
//         selectedColor: Colors.lightGreenAccent,
//         onReset: () => fieldModel.onClear(),
//         name: fieldModel.uid,
//         enabled: fieldModel.isEditable,
//         validator:
//             fieldModel.isMandatory ? FormBuilderValidators.required() : null,
//         initialValue:
//             (fieldModel.value ?? '').isNotEmpty ? fieldModel.value : null,
//         options: _getChipOptions(fieldModel.options!.unlock, wide: true),
//         onChanged: (String? value) {
//           if (value != null) {
//             fieldModel.onSaveOption(value);
//           }
//         },
//         decoration: InputDecoration(
//             border: const OutlineInputBorder(),
//             contentPadding: const EdgeInsets.only(left: 10, top: 30),
//             labelText: fieldModel.label,
//             labelStyle: Theme.of(context).textTheme.headlineSmall,
//             fillColor: Colors.red.shade200),
//       );
//     default:
//       return const Text('Unsupported field type');
//   }
// }
//
// int? _getMaxLength(ValueType? type) {
//   if (type == ValueType.Text) {
//     return 255;
//   }
//   if (type == ValueType.LongText || type == ValueType.Letter) {
//     return 2000;
//   }
//   return null;
// }
//
// OptionsOrientation _getOptionsOrientation(QFieldModel field) {
//   switch (field.fieldRendering) {
//     case ValueTypeRenderingType.VERTICAL_RADIOBUTTONS:
//     case ValueTypeRenderingType.VERTICAL_CHECKBOXES:
//       return OptionsOrientation.vertical;
//     case ValueTypeRenderingType.HORIZONTAL_RADIOBUTTONS:
//     case ValueTypeRenderingType.HORIZONTAL_CHECKBOXES:
//       return OptionsOrientation.horizontal;
//     default:
//       return OptionsOrientation.wrap;
//   }
// }
//
// List<FormBuilderFieldOption<T>> _getFieldOptions<T>(List<T> options) {
//   return options
//       .map((option) => FormBuilderFieldOption(
//             value: option,
//             child: Container(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Column(
//                   children: [
//                     Text(option.toString().toUpperCase()),
//                     const Icon(Icons.airplanemode_on)
//                   ],
//                 )),
//           ))
//       .toList();
// }
//
// List<FormBuilderChipOption<T>> _getChipOptions<T>(List<T> options,
//     {bool? wide}) {
//   return options
//       .map((option) => FormBuilderChipOption(
//             value: option,
//             avatar: !(wide ?? false)
//                 ? const CircleAvatar(child: Icon(Icons.airplanemode_on))
//                 : null,
//             child: wide ?? false
//                 ? Container(
//                     padding: const EdgeInsets.all(5.0),
//                     child: Column(
//                       children: [
//                         Text(option.toString().toUpperCase()),
//                         const Icon(Icons.airplanemode_on)
//                       ],
//                     ))
//                 : null,
//           ))
//       .toList();
// }
}
