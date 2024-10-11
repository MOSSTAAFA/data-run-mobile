import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/custom/q_reactive_field.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/q_reactive_text_type_field.widget.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/org_unit_picker/model/tree_node_data_source.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/org_unit_picker/org_unit_picker_field.widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class ReactiveOuPicker<T> extends QReactiveFormField<T, String> {
  ReactiveOuPicker({
    super.key,
    required super.element,
    super.valueAccessor,
    super.showErrors,
    super.validationMessages,
    super.focusNode,
    InputDecoration decoration = const InputDecoration(),
    TextInputType? keyboardType,
    bool obscureText = false,
    bool canRequestFocus = true,
    QReactiveFormFieldCallback<T>? onTap,
    QReactiveFormFieldCallback<T>? onEditingComplete,
    QReactiveFormFieldCallback<T>? onSubmitted,
    QReactiveFormFieldCallback<T>? onChanged,
    required TreeNodeDataSource dataSource,
  }) : super(
          builder: (ReactiveFormFieldState<T, String> field) {
            final effectiveDecoration = decoration
                .applyDefaults(Theme.of(field.context).inputDecorationTheme);

            return OrgUnitPickerField(
              initialValueUid: field.value,
              validator: (value) => validationMessages?.keys.first,
              onSubmitted: field.didChange,
              dataSource: dataSource,
              decoration: effectiveDecoration.copyWith(
                  enabled: element.elementControl!.enabled,
                  errorText: field.errorText,
                  labelText: element.label),
              onSaved: onSubmitted != null ? (_) => onSubmitted(element) : null,
              onChanged: (value) {
                field.didChange(value);
                onChanged?.call(element);
              },
            );
          },
        );

  @override
  QReactiveFormFieldState<T, String> createState() =>
      QReactiveFormFieldState<T, String>();
}

// class ReactiveOuPicker<T> extends ReactiveFormField<T, String> {
//   final FieldInstance<dynamic> element;
//
//   ReactiveOuPicker({
//     super.key,
//     required this.element,
//     super.valueAccessor,
//     super.showErrors,
//     super.validationMessages,
//     super.focusNode,
//     bool enabled = true,
//     String? labelText,
//     required TreeNodeDataSource dataSource,
//   }) : super(
//           formControl: element.elementControl as FormControl<T>,
//           builder: (ReactiveFormFieldState<T, String> field) {
//             return OrgUnitPickerField(
//               initialValueUid: field.value,
//               onChanged: field.didChange,
//               validator: (value) => validationMessages?.keys.first,
//               // errorInvalidText: validationMessages?.keys.first,
//               onSubmitted: field.didChange,
//               dataSource: dataSource,
//               labelText: labelText,
//               enabled: enabled,
//             );
//           },
//         );
//
//   @override
//   ReactiveFormFieldState<T, String> createState() =>
//       ReactiveFormFieldState<T, String>();
// }
