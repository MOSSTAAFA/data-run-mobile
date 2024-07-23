import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/form/q_field_validator.dart';
import 'package:mass_pro/generated/l10n.dart';

class QAgeSliders extends StatelessWidget {
  const QAgeSliders({super.key, required this.fieldModel});

  final QFieldModel fieldModel;

  @override
  Widget build(BuildContext context) {
    double years = 0;
    double months = 0;

    if (fieldModel.value != null && fieldModel.value!.isNotEmpty) {
      final valueParts = fieldModel.value!.split('.');
      years = double.tryParse(valueParts[0]) ?? 0;
      if (valueParts.length > 1) {
        months = double.tryParse(valueParts[1]) ?? 0;
      }
    }

    void updateFieldValue(FormFieldState<String?> field) {
      final yearsValue =
          FormBuilder.of(context)?.fields['${fieldModel.uid}_years']?.value ??
              0;
      final monthsValue =
          FormBuilder.of(context)?.fields['${fieldModel.uid}_months']?.value ??
              0;
      final ageDoubleValueString =
          '${yearsValue.toInt()}.${monthsValue.toInt()}';
      field.didChange(ageDoubleValueString);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormBuilderField<String?>(
        key: ValueKey(fieldModel.uid),
        name: fieldModel.uid,
        validator: QFieldValidators.getValidators(fieldModel),
        onChanged: (value) {
          fieldModel.onTextChange(value.toString());
        },
        builder: (FormFieldState<String?> field) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fieldModel.label ?? '',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                FormBuilderSlider(
                  key: ValueKey('${fieldModel.uid}_years'),
                  numberFormat: NumberFormat('0'),
                  initialValue: years,
                  displayValues: DisplayValues.none,
                  name: '${fieldModel.uid}_years',
                  enabled: fieldModel.isEditable,
                  min: 0.0,
                  max: 100.0,
                  divisions: 100,
                  activeColor: Colors.red,
                  inactiveColor: Colors.pink[100],
                  decoration: InputDecoration(
                    labelText: S.of(context).years,
                  ),
                  onChanged: (yearsValue) {
                    updateFieldValue(field);
                  },
                ),
                FormBuilderSlider(
                  key: ValueKey('${fieldModel.uid}_months'),
                  numberFormat: NumberFormat('0'),
                  initialValue: months,
                  displayValues: DisplayValues.none,
                  name: '${fieldModel.uid}_months',
                  enabled: fieldModel.isEditable,
                  min: 0.0,
                  max: 12.0,
                  divisions: 12,
                  activeColor: Colors.red,
                  inactiveColor: Colors.pink[100],
                  decoration: InputDecoration(
                    labelText: S.of(context).months,
                  ),
                  onChanged: (monthsValue) {
                    updateFieldValue(field);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
