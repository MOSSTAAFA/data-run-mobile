import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/fields/q_full_name_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/fields/form.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/fields/q_age_slider.widget.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/fields/q_multi_choice_chip.widget.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'q_field_widget_factory.g.dart';

@riverpod
QFieldWidgetFactory fieldWidgetFactory(FieldWidgetFactoryRef ref) {
  return QFieldWidgetFactory();
}

typedef QFormFieldBuilder = Widget Function(QFieldModel fieldState);

class QFieldWidgetFactory {
  final Map<ValueType?, QFormFieldBuilder> _cache =
      <ValueType?, QFormFieldBuilder>{};

  QFormFieldBuilder getBuilder(ValueType? valueType) {
    if (_cache.containsKey(valueType)) {
      return _cache[valueType]!;
    }

    final QFormFieldBuilder builder = _createBuilder(valueType);
    _cache[valueType] = builder;
    return builder;
  }

  QFormFieldBuilder _createBuilder(ValueType? valueType) {
    switch (valueType) {
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.Number:
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
      case ValueType.UnitInterval:
      case ValueType.Percentage:
      case ValueType.Email:
        return (QFieldModel fieldModel) => QTextField(fieldModel: fieldModel);
      case ValueType.Boolean:
        return (QFieldModel fieldModel) => QSwitchField(fieldModel: fieldModel);
      case ValueType.Age:
        return (QFieldModel fieldModel) => QAgeSliders(fieldModel: fieldModel);
      case ValueType.FullName:
        return (QFieldModel fieldModel) =>
            QFullNameField(fieldModel: fieldModel);

      case ValueType.Date:
      case ValueType.DateTime:
      case ValueType.Time:
        return (QFieldModel fieldModel) =>
            QDateTimePicker(fieldModel: fieldModel);
      case ValueType.SelectMulti:
        return (QFieldModel fieldModel) =>
            QMultiChoiceChip(fieldModel: fieldModel);
      case ValueType.SelectOne:
        return (QFieldModel fieldModel) => QChoiceChip(fieldModel: fieldModel);
      default:
        return (QFieldModel fieldModel) => const Text('Unsupported field type');
    }
  }
}
