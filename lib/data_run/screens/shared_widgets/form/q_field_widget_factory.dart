import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/form/form.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/form/q_age_slider.widget.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'q_field_widget_factory.g.dart';

@riverpod
QFieldWidgetFactory fieldWidgetFactory(FieldWidgetFactoryRef ref) {
  return QFieldWidgetFactory();
}

typedef QFormFieldBuilder = Widget Function(QFieldModel fieldState);

class QFieldWidgetFactory {
  final Map<ValueType?, QFormFieldBuilder> _cache = {};

  QFormFieldBuilder getBuilder(ValueType? valueType) {
    if (_cache.containsKey(valueType)) {
      return _cache[valueType]!;
    }

    final builder = _createBuilder(valueType);
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
        return (fieldModel) => QTextField(fieldModel: fieldModel);
      case ValueType.Boolean:
        return (fieldModel) => QSwitchField(fieldModel: fieldModel);

      case ValueType.Age:
        return (fieldModel) => QAgeSliders(fieldModel: fieldModel);
      case ValueType.Date:
      case ValueType.DateTime:
      case ValueType.Time:
        return (fieldModel) => QDateTimePicker(fieldModel: fieldModel);
      case ValueType.SelectOne:
        return (fieldModel) => QChoiceChip(fieldModel: fieldModel);
      default:
        return (fieldModel) => const Text('Unsupported field type');
    }
  }
}
