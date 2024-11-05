import 'package:flutter/material.dart';
import 'package:datarun/data_run/screens/form_ui_elements/org_unit_picker/model/tree_node_data_source.dart';
import 'package:datarun/data_run/screens/form_ui_elements/org_unit_picker/org_unit_picker_field.widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class ReactiveOuPicker<T> extends ReactiveFormField<T, String> {
  ReactiveOuPicker({
    super.key,
    super.valueAccessor,
    super.showErrors,
    super.validationMessages,
    super.focusNode,
    InputDecoration decoration = const InputDecoration(),
    TextInputType? keyboardType,
    bool obscureText = false,
    bool canRequestFocus = true,
    bool showClearButton = false,
    bool enabled = true,
    String? formControlName,
    FormControl<T>? formControl,
    ReactiveFormFieldCallback<T>? onChanged,
    required TreeNodeDataSource dataSource,
  }) : super(
          formControl: formControl,
          formControlName: formControlName,
          builder: (ReactiveFormFieldState<T, String> field) {
            return OrgUnitPickerField(
              enabled: enabled,
              initialValueUid: field.value,
              fieldLabelText: decoration.labelText,
              onChanged: (value) {
                field.didChange(value);
                onChanged?.call(field.control);
              },
              validator: (value) => validationMessages?.keys.first,
              // errorInvalidText: validationMessages?.keys.first,
              onSubmitted: field.didChange,
              dataSource: dataSource,
            );
          },
        );

  @override
  ReactiveFormFieldState<T, String> createState() =>
      ReactiveFormFieldState<T, String>();
}
