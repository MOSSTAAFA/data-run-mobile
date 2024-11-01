import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;

class QDatePickerField<T> extends StatelessWidget {
  const QDatePickerField({super.key, required this.element});

  final FieldInstance<T> element;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<T>(
      formControl: element.elementControl,
      readOnly: true,
      decoration: InputDecoration(
        enabled: element.elementControl!.enabled,
        labelText: element.label,
        suffixIcon: ReactiveDatePicker<String?>(
          formControl: element.elementControl as FormControl<String?>,
          // firstDate: DateTime.now().subtract(const Duration(days: 10)),
          firstDate: DateTime(2015,1,1),
          // lastDate: DateTime.now().add(const Duration(days: 30)),
          lastDate: DateTime(2040,1,1),
          builder: (context, picker, child) {
            return IconButton(
              onPressed: element.elementControl!.enabled ? picker.showPicker : null,
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
