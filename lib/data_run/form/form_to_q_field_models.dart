import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/field_value_rendering_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/screens/submission_form/model/option_configuration.dart';
import 'package:mass_pro/data_run/screens/submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_to_q_field_models.g.dart';

@riverpod
FutureOr<IMap<String, QFieldModel>> formToQFieldModels(
    FormToQFieldModelsRef ref,
    {required String form}) async {
  final Bundle eventBundle = Get.arguments as Bundle;
  final String? submissionUid = eventBundle.getString(SYNCABLE_UID);

  DataFormSubmission? submission;

  if (submissionUid != null) {
    submission = await D2Remote.formModule.formSubmission
        .byForm(form)
        .byId(submissionUid)
        .getOne();
  }

  final formConfig = await ref.watch(
      formConfigurationProvider(form: form, formVersion: submission?.version)
          .future);

  final IMap<String, dynamic> formData = IMap(submission?.formData ?? {});

  IMap<String, QFieldModel> fieldsModelsMap = IMap(<String, QFieldModel>{});

  for (final field in formConfig.allFields.values) {
    fieldsModelsMap = fieldsModelsMap.add(
        field.name,
        mapToModel(
            field: field,
            value: formData.get(field.name),
            options: field.listName != null
                ? formConfig.optionLists.get(field.listName!)
                : null));
  }

  return fieldsModelsMap;
}

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
      // options: field.options?.lock,
      optionConfiguration: ValueType.getValueType(field.type).isWithOptions
          ? _getOptionConfiguration(field, options ?? IList())
          : null,
      fieldRendering: renderingType,
      fieldRules: field.rules?.lock,
      keyboardActionType: switch (valueType) {
        ValueType.LongText => KeyboardActionType.ENTER,
        _ => KeyboardActionType.NEXT
      });
}

OptionConfiguration? _getOptionConfiguration(
    DynamicFormField field, IList<FormOption> options) {
  return OptionConfiguration.config(options.length, () {
    return options;
  }).updateOptionsToHideAndShow(
      optionsToShow: options.map((FormOption option) => option.name).toIList(),
      optionsToHide: const IListConst([]));
}
