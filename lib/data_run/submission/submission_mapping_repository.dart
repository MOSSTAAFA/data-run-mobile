import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/field_value_rendering_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/option_configuration.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

class SubmissionMappingRepository {
  SubmissionMappingRepository(
      {required FormConfiguration formConfiguration,
      required String submissionUid})
      : _formConfiguration = formConfiguration,
        _submissionUid = submissionUid;

  FormConfiguration _formConfiguration;
  final String _submissionUid;

  SyncableQuery _getQuery() {
    return D2Remote.formModule.formSubmission.byForm(_formConfiguration.form);
  }

  Future<int> saveSubmission(IList<QFieldModel> formDataFields) async {
    final IMap<String, dynamic> pendingUpdatesDataMap =
        _preparePendingUpdates(formDataFields);
    return _savePreparedData(pendingUpdatesDataMap);
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

  Future<int> _savePreparedData(
      IMap<String, dynamic> pendingUpdatesDataMap) async {
    final DataFormSubmission? storedFormSubmission =
        await D2Remote.formModule.formSubmission.byId(_submissionUid).getOne();

    storedFormSubmission!.formData!.addAll(pendingUpdatesDataMap.unlock);

    storedFormSubmission.status = 'ACTIVE';
    storedFormSubmission.dirty = true;

    return _getQuery()
        .setData(storedFormSubmission)
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: false));
  }

  Future<DataFormSubmission?> getSyncableEntity() {
    return _getQuery().byId(_submissionUid).getOne();
  }

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
      // case ValueType.Date:
      // case ValueType.DateTime:
      //   return field?.value.toDate();
      case ValueType.Boolean:
      case ValueType.TrueOnly:
        // case ValueType.YesNo:
        return field?.value.toBoolean() ?? field?.value;
      default:
        return field?.value;
    }
  }

  FutureOr<IMap<String, QFieldModel>> map() async {
    final DataFormSubmission? syncableEntity = await getSyncableEntity();

    final IMapConst<String, dynamic> entityMap =
        IMapConst(syncableEntity!.formData ?? {});

    IMap<String, QFieldModel> fieldsModelsMap = IMap(<String, QFieldModel>{});

    for (final field in _formConfiguration.fields.values) {
      fieldsModelsMap = fieldsModelsMap.add(field.name,
          mapToModel(field: field, value: entityMap.get(field.name)));
    }
    return fieldsModelsMap;
  }

  FutureOr<IList<QFieldModel>> list() async {
    final DataFormSubmission? syncableEntity = await getSyncableEntity();

    final IMapConst<String, dynamic> entityMap =
        IMapConst(syncableEntity!.formData ?? {});

    IList<QFieldModel> fieldsModels = IList(<QFieldModel>[]);
    for (final field in _formConfiguration.fields.values) {
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
        options: field.options?.lock,
        optionConfiguration: _getOptionConfiguration(field),
        fieldRendering: renderingType,
        fieldRules: field.rules?.lock,
        keyboardActionType: switch (valueType) {
          ValueType.LongText => KeyboardActionType.ENTER,
          _ => KeyboardActionType.NEXT
        });
  }

  OptionConfiguration? _getOptionConfiguration(DynamicFormField field) {
    final IList<FormOption> options = field.options?.lock ?? const IListConst([]);
    if (ValueType.getValueType(field.type).isWithOptions &&
        options.isNotEmpty) {
      return OptionConfiguration.config(options.length, () {
        return options;
      })
        ..updateOptionsToHideAndShow(
            optionsToShow:
                options.map((FormOption option) => option.name).toIList(),
            optionsToHide: const IListConst([]));
    }
    return null;
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

// Future<StoreResult> save(String fieldKey, String? value) async {
//   final fields = form.fields?.lock ?? IList([]);
//   final valueType =
//       fields.firstOrNullWhere((t) => t.name == fieldKey)?.type.toValueType;
//
//   return saveValue(fieldKey, value, valueType);
// }

// Future<StoreResult> saveValue(
//     String fieldKey, dynamic value, ValueType? valueType) async {
//   _syncableEntity = (await getQuery().byId(_syncableEntity.uid!).getOne())!;
//   _syncableEntity = _syncableEntity
//     ..lastModifiedDate =
//         DateUtils.databaseDateFormat().format(DateTime.now())
//     ..status = 'ACTIVE'
//     ..dirty = true;
//
//   final Map<String, dynamic> toUpdateFieldsMap = _syncableEntity.toJson();
//
//   // if (!toUpdateFieldsMap.containsKey(fieldKey)) {
//   //   return StoreResult(
//   //       uid: fieldKey,
//   //       valueStoreResult: ValueStoreResult.KEY_IS_NOT_IN_ENTITY);
//   // }
//
//   final oldValue = toUpdateFieldsMap[fieldKey];
//   if (oldValue != value) {
//     try {
//       getQuery().mergeMode = MergeMode.Replace;
//       toUpdateFieldsMap[fieldKey] = value;
//
//       DataFormSubmission toUpdateEntity =
//           getQuery().fromJsonInstance(toUpdateFieldsMap);
//
//       final updatedEntityCount = await getQuery()
//           .setData(toUpdateEntity)
//           .save(saveOptions: SaveOptions(skipLocalSyncStatus: false));
//
//       return StoreResult(
//           uid: fieldKey,
//           valueStoreResult: updatedEntityCount > 0
//               ? ValueStoreResult.VALUE_CHANGED
//               : ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//     } catch (e) {
//       return StoreResult(
//           uid: fieldKey,
//           valueStoreResult: ValueStoreResult.ERROR_UPDATING_VALUE,
//           valueStoreResultMessage: e.toString());
//     }
//   } else {
//     return StoreResult(
//         uid: fieldKey,
//         valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   }
// }
}
