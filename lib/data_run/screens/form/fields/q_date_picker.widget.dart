import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widget.dart';
import 'package:mass_pro/data_run/screens/form/model/form_element_model.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:d2_remote/core/datarun/utilities/date_utils.dart' as sdk;

class QDatePickerField extends StatelessWidget {
  const QDatePickerField({super.key, required this.element});

  final FieldInstance<dynamic> element;

  @override
  Widget build(BuildContext context) {

    final section = SectionInheritedWidget.of(context);
    final pathR = section.pathRecursive;
    final pathBu = section.pathBuilder(element.name);
    final pathBu2 = section.elementPath;
    final formControl = section.elementControl;
    final forfmControl = formControl;

    return ReactiveTextField<String?>(
      formControl: element.elementControl as FormControl<String?>,
      // formControlName: element.name,
      // valueAccessor: QDateTimeValueAccessor(),
      readOnly: true,
      decoration: InputDecoration(
        labelText: element.properties.label,
        suffixIcon: ReactiveDatePicker<String?>(
          formControl: element.elementControl as FormControl<String?>,
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
