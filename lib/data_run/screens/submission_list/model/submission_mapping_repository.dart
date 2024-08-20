import 'dart:async';

import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/field_value_rendering_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/screens/submission_form/model/option_configuration.dart';
import 'package:mass_pro/data_run/screens/submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/submission_list/model/submission_list.provider.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

class SubmissionMappingRepository {
  SubmissionMappingRepository(this.ref,
      {required FormConfiguration formConfiguration,
      required String submissionUid})
      : _formConfiguration = formConfiguration,
        _submissionUid = submissionUid;

  FormConfiguration _formConfiguration;
  final String _submissionUid;
  final SubmissionMappingRepositoryRef ref;

  SubmissionList _getQuery() {
    return ref
        .read(submissionListProvider(form: _formConfiguration.form).notifier);
  }

  Future<void> saveSubmission(IList<QFieldModel> formDataFields) async {
    final IMap<String, dynamic> pendingUpdatesDataMap =
        _preparePendingUpdates(formDataFields);

    return _getQuery()
        .saveSubmissionData(_submissionUid, pendingUpdatesDataMap);
  }

  IMap<String, dynamic> _preparePendingUpdates(
      IList<QFieldModel> formDataFields) {
    final IMap<String, QFieldModel> hiddenFields =
        IMap.fromIterable<String, QFieldModel, QFieldModel>(
            formDataFields.where((QFieldModel field) => !field.isVisible),
            keyMapper: (QFieldModel field) => field.uid,
            valueMapper: (QFieldModel field) => field);

    final IList<QFieldModel> clearedInvisibleFields = formDataFields
        .map((QFieldModel field) => hiddenFields.containsKey(field.uid)
            ? field.builder().setValue(null).build()
            : field)
        .toIList();

    return <String, dynamic>{
      for (final QFieldModel field in clearedInvisibleFields)
        field.uid: mapFieldToValueType(field)
    }.lock;
  }

  // Future<int> _savePreparedData(
  //     IMap<String, dynamic> pendingUpdatesDataMap) async {
  //   final DataFormSubmission? storedFormSubmission =
  //       await D2Remote.formModule.formSubmission.byId(_submissionUid).getOne();
  //
  //   storedFormSubmission!.formData!.addAll(pendingUpdatesDataMap.unlock);
  //
  //   storedFormSubmission.status = 'ACTIVE';
  //   storedFormSubmission.dirty = true;
  //
  //   return _getQuery()
  //       .setData(storedFormSubmission)
  //       .save(saveOptions: SaveOptions(skipLocalSyncStatus: false));
  // }

  // Future<DataFormSubmission?> getSyncableEntity() {
  //   return _getQuery().byId(_submissionUid).getOne();
  // }

  dynamic mapFieldToValueType(QFieldModel? field) {
    switch (field?.valueType) {
      case ValueType.Percentage:
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return int.tryParse(field?.value ?? '') ??
            double.tryParse(field?.value ?? '')?.toInt() ??
            field?.value;
      case ValueType.UnitInterval:
        return int.tryParse(field?.value ?? '') ??
            double.tryParse(field?.value ?? '') ??
            field?.value;
      case ValueType.Number:
      case ValueType.Age:
        return double.tryParse(field?.value ?? '') ?? field?.value;
      case ValueType.Boolean:
      case ValueType.TrueOnly:
        return field?.value.toBoolean() ?? field?.value;
      default:
        return field?.value;
    }
  }

  FutureOr<IMap<String, QFieldModel>> map() async {
    final DataFormSubmission? syncableEntity =
        await _getQuery().getSubmission(_submissionUid);

    final IMapConst<String, dynamic> entityMap =
        IMapConst(syncableEntity!.formData ?? {});

    IMap<String, QFieldModel> fieldsModelsMap = IMap(<String, QFieldModel>{});

    for (final field in _formConfiguration.allFields.values) {
      fieldsModelsMap = fieldsModelsMap.add(field.name,
          mapToModel(field: field, value: entityMap.get(field.name)));
    }
    return fieldsModelsMap;
  }

  FutureOr<IList<QFieldModel>> list() async {
    final DataFormSubmission? syncableEntity =
        await _getQuery().getSubmission(_submissionUid);

    final IMapConst<String, dynamic> entityMap =
        IMapConst(syncableEntity!.formData ?? {});

    IList<QFieldModel> fieldsModels = IList(<QFieldModel>[]);
    for (final field in _formConfiguration.allFields.values) {
      fieldsModels = fieldsModels
          .add(mapToModel(field: field, value: entityMap.get(field.name)));
    }
    return fieldsModels;
  }

  QFieldModel mapToModel({
    required DynamicFormField field,
    dynamic value,
  }) {
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
            ? _getOptionConfiguration(field)
            : null,
        fieldRendering: renderingType,
        fieldRules: field.rules?.lock,
        keyboardActionType: switch (valueType) {
          ValueType.LongText => KeyboardActionType.ENTER,
          _ => KeyboardActionType.NEXT
        });
  }

  OptionConfiguration? _getOptionConfiguration(DynamicFormField field) {
    final IList<FormOption> options =
        _formConfiguration.optionLists.get(field.listName!) ?? IList();

    return OptionConfiguration.config(options.length, () {
      return options;
    }).updateOptionsToHideAndShow(
        optionsToShow:
            options.map((FormOption option) => option.name).toIList(),
        optionsToHide: const IListConst([]));
  }

  FutureOr<QFieldModel> updateField(
      QFieldModel fieldUiModel, String? warningMessage) async {
    return warningMessage != null
        ? fieldUiModel.setWarning(warningMessage)
        : fieldUiModel;
  }

  Future<String> saveFileResource(String path) async {
    return '';
  }
}
