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
      final List<String> valueParts = fieldModel.value!.split('.');
      years = double.tryParse(valueParts[0]) ?? 0;
      years = years < 100 ? years : 100;
      if (valueParts.length > 1) {
        months = double.tryParse(valueParts[1]) ?? 0;
        months = months < 12 ? months : 12;
      }
    }

    void updateFieldValue(FormFieldState<String?> field) {
      final yearsValue = FormBuilder.of(context)
              ?.fields['${fieldModel.uid}_years']
              ?.value ??
          0;
      final monthsValue = FormBuilder.of(context)
              ?.fields['${fieldModel.uid}_months']
              ?.value ??
          0;
      final String ageDoubleValueString =
          '${yearsValue.toInt()}.${monthsValue.toInt()}';
      field.didChange(ageDoubleValueString);
    }

    String getValueString() {
      final int yearsValue =
          FormBuilder.of(context)?.fields['${fieldModel.uid}_years']?.value.toInt() ??
              0;
      final int monthsValue =
          FormBuilder.of(context)?.fields['${fieldModel.uid}_months']?.value.toInt() ??
              0;
      return '${S.of(context).year(yearsValue)} ${monthsValue > 0 && yearsValue > 0 ? S.of(context).and : ''} ${S.of(context).month(monthsValue)}';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FormBuilderField<String?>(
        key: ValueKey(fieldModel.uid),
        name: fieldModel.uid,
        validator: QFieldValidators.getValidators(fieldModel),
        onChanged: (String? value) {
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
              children: <Widget>[
                Text(
                  fieldModel.label,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                FormBuilderSlider(
                  // key: ValueKey('${fieldModel.uid}_years'),
                  numberFormat: NumberFormat('0'),
                  initialValue: years,
                  displayValues: DisplayValues.minMax,
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
                  onChanged: (double? yearsValue) {
                    updateFieldValue(field);
                  },
                ),
                FormBuilderSlider(
                  // key: ValueKey('${fieldModel.uid}_months'),
                  numberFormat: NumberFormat('0'),
                  initialValue: months,
                  displayValues: DisplayValues.all,
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
                  onChanged: (double? monthsValue) {
                    updateFieldValue(field);
                  },
                  valueWidget: (String value) => Text(getValueString()),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void updateSlidersFromText(
      String value, FormFieldState<String?> field, BuildContext context) {
    double years;
    double months;
    final List<String> valueParts = value.split('.');

    years = double.tryParse(valueParts[0]) ?? 0;
    if (valueParts.length > 1) {
      months = double.tryParse(valueParts[1]) ?? 0;
    } else {
      months = 0;
    }

    FormBuilder.of(context)
        ?.fields['${fieldModel.uid}_years']
        ?.didChange(years);
    FormBuilder.of(context)
        ?.fields['${fieldModel.uid}_months']
        ?.didChange(months);
  }
}
