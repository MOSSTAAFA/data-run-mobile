import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/field_value_rendering_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/screens/form/model/option_configuration.dart';
import 'package:mass_pro/data_run/screens/form/model/q_field.model.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

QFieldModel mapToModel(
    {required DynamicFormField field,
    dynamic value,
    IList<FormOption>? options}) {
  final ValueType valueType = ValueType.getValueType(field.type);
  final FieldValueRenderingType renderingType =
      FieldValueRenderingUtil.getFieldValueRendering(
          field.fieldValueRenderingType);

  return QFieldModel(
      uid: field.name,
      isFocused: false,
      isEditable: true,
      isMandatory: field.mandatory,
      label: getItemLocalString(field.label),
      value: value is String ? value : value?.toString(),
      valueType: valueType,
      optionConfiguration: ValueType.getValueType(field.type).isWithOptions
          ? _getOptionConfiguration(field, options)
          : null,
      fieldRendering: renderingType,
      fieldRules: field.rules?.lock,
      keyboardActionType: switch (valueType) {
        ValueType.LongText => KeyboardActionType.ENTER,
        _ => KeyboardActionType.NEXT
      });
}

OptionConfiguration? _getOptionConfiguration(
    DynamicFormField field, IList<FormOption>? options) {
  return OptionConfiguration(
      options: options?.toList(), optionsToShow: [], optionsToHide: []);
}
