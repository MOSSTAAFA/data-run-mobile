import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/custom/q_reactive_date_picker.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/q_reactive_text_type_field.widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;

class QReactiveDatePickerField extends HookWidget {
  const QReactiveDatePickerField({
    super.key,
    required this.element,
  });

  // final FieldInstance<String> element;

  @override
  Widget build(BuildContext context) {
    // final element = FieldElementInheritedWidget.of(context);
    return QReactiveTextField<String>(
      formControl: element.elementControl,
      decoration: InputDecoration(
        enabled: false,
        labelText: element.label,
        suffixIcon: ReactiveDatePicker<String>(
          firstDate: DateTime.now().subtract(const Duration(days: 10)),
          lastDate: DateTime.now().add(const Duration(days: 30)),
          builder: (context, picker, child) {
            return IconButton(
              onPressed: picker.showPicker,
              icon: const Icon(Icons.date_range),
            );
          },
        ),
      ),
    );
  }
}

class QDateTimeValueAccessor extends ControlValueAccessor<String, String> {
  /// Returns the value that must be supplied to the [control].
  ///
  /// Converts value from UI data type to [control] data type.
  @override
  String? modelToViewValue(String? modelValue) {
    return modelValue == null ? null : sdk.DateUtils.format(modelValue);
  }

  /// Returns the value that must be supplied to the UI widget.
  ///
  /// Converts value from [control] data type to UI data type.
  @override
  String? viewToModelValue(String? viewValue) {
    return viewValue == null ? null : sdk.DateUtils.formatForDb(viewValue);
  }
}
