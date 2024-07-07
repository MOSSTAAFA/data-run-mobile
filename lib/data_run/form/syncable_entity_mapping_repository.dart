import 'dart:async';

import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/field_value_rendering_type.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:d2_remote/shared/utilities/merge_mode.util.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/commons/extensions/value_extensions.dart';
import 'package:mass_pro/commons/helpers/iterable.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/form/model/store_result.dart';
import 'package:mass_pro/form/model/value_store_result.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncable_entity_mapping_repository.g.dart';

/// Depends on Bundle from the route
///
@riverpod
SyncableEntityMappingRepository syncableEntityMappingRepository(
  SyncableEntityMappingRepositoryRef ref, {
  required DynamicForm form,
  required SyncableEntity syncableEntity,
  required SyncableQuery d2SyncableQuery,
}) {
  return SyncableEntityMappingRepository(
      form: form,
      syncableEntity: syncableEntity,
      syncableQuery: d2SyncableQuery);
}

class SyncableEntityMappingRepository {
  SyncableEntityMappingRepository({
    required this.form,
    required SyncableQuery syncableQuery,
    // required String entityUid,
    required SyncableEntity syncableEntity,
  })  : /*_entityUid = entityUid,*/
        _syncableQuery = syncableQuery,
        _syncableEntity = syncableEntity;

  // final String _entityUid;

  final DynamicForm form;
  SyncableEntity _syncableEntity;

  final SyncableQuery _syncableQuery;

  FutureOr<IMap<String, QFieldModel>> map() {
    // final syncableEntity = await getSyncableEntity();

    final entityMap = IMapConst(_syncableEntity.toJson());

    IMap<String, QFieldModel> fieldsModelsMap = IMap({});
    for (final field in form.fields!) {
      fieldsModelsMap = fieldsModelsMap.add(field.name,
          mapToModel(field: field, value: entityMap.get(field.name)));
    }
    return fieldsModelsMap;
  }

  FutureOr<IList<QFieldModel>> list() {
    // final form = await getForm();
    // final syncableEntity = await getSyncableEntity();

    final entityMap = IMapConst(_syncableEntity.toJson());

    IList<QFieldModel> fieldsModels = IList([]);
    for (final field in form.fields!) {
      fieldsModels = fieldsModels
          .add(mapToModel(field: field, value: entityMap.get(field.name)));
    }
    return fieldsModels;
  }

  QFieldModel mapToModel({
    required DynamicFormField field,
    dynamic value,
  }) {
    final valueType = field.type.toValueType;
    final renderingType = FieldValueRenderingUtil.getFieldValueRendering(
        field.fieldValueRenderingType);
    return QFieldModel(
        uid: field.name,
        isFocused: false,
        isEditable: true,
        isMandatory: field.required,
        label: field.label,
        value: value is String ? value : value?.toString(),
        valueType: valueType,
        options: field.options?.lock,
        fieldRendering: renderingType,
        fieldRules: field.rules?.lock,
        keyboardActionType: switch (valueType) {
          ValueType.LongText => KeyboardActionType.ENTER,
          _ => KeyboardActionType.NEXT
        });
  }

  FutureOr<QFieldModel> updateField(
      QFieldModel fieldUiModel, String? warningMessage) async {
    return warningMessage != null
        ? fieldUiModel.setWarning(warningMessage)
        : fieldUiModel;
  }

  Future<StoreResult> save(String fieldKey, String? value) async {
    // final SyncableEntity syncableEntity = await getSyncableEntity();
    // (await getQuery().byId(_entityUid).getOne())!;
    // final DynamicForm form = await getForm();

    final fields = form.fields?.lock ?? IList([]);
    final valueType =
        fields.firstOrNullWhere((t) => t.name == fieldKey)?.type.toValueType;

    return saveValue(fieldKey, value, valueType /*, _syncableEntity*/);
  }

  Future<StoreResult> saveValue(
    String fieldKey,
    dynamic value,
    ValueType? valueType,
    // SyncableEntity syncableEntity,
  ) async {
    IMap<String, dynamic> storedEntityMap = _syncableEntity.toJson().lock;

    if (!storedEntityMap.containsKey(fieldKey)) {
      return StoreResult(
          uid: fieldKey,
          valueStoreResult: ValueStoreResult.KEY_IS_NOT_IN_ENTITY);
    }

    final storedValue = storedEntityMap.get(fieldKey);
    dynamic newValue = value;

    if (valueType == ValueType.Image && value != null) {
      newValue = await saveFileResource(value);
    }

    try {
      if (storedValue != newValue) {
        getQuery().mergeMode =
            /*value != null ? MergeMode.Merge : */ MergeMode.Replace;
        storedEntityMap = storedEntityMap.add(fieldKey, value);
        final SyncableEntity newEntity =
            getQuery().fromJsonInstance(storedEntityMap.unlock);
        final updatedEntityCount = await getQuery()
            .setData(newEntity
              ..synced = false
              ..dirty = true
        )
            .save(saveOptions: SaveOptions(skipLocalSyncStatus: false));

        // successfully saved
        // set this class [_syncableEntity] to the updated new one
        _syncableEntity = newEntity;

        return StoreResult(
            uid: fieldKey,
            valueStoreResult: updatedEntityCount > 0
                ? ValueStoreResult.VALUE_CHANGED
                : ValueStoreResult.VALUE_HAS_NOT_CHANGED);
      } else {
        return StoreResult(
            uid: fieldKey,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
      }
    } catch (e) {
      return StoreResult(
          uid: fieldKey,
          valueStoreResult: ValueStoreResult.ERROR_UPDATING_VALUE,
          valueStoreResultMessage: e.toString());
    }
  }

  Future<StoreResult> saveFormData(IList<QFieldModel> formDataFields) async {
    // final form = await getForm();
    // final syncableEntity = await getSyncableEntity();

    final IList<QFieldModel> clearedInvisibleFields = formDataFields
        .map((field) => field.isVisible == false
            ? field.builder().setValue(null).build()
            : field)
        .toIList();

    final List<StoreResult> result = await Future.wait(
        clearedInvisibleFields.map((field) => saveValue(field.uid,
            mapFieldToValueType(field), field.valueType /*, syncableEntity*/)));

    return StoreResult(
        uid: form.code ?? '',
        valueStoreResult: result.isNotEmpty
            ? ValueStoreResult.FORM_CHANGED
            : ValueStoreResult.FORM_HAS_NOT_CHANGED);
    // reset invisible values to null

    // final valuesMap = <String, dynamic>{
    //   for (final field in clearedInvisibleFields)
    //     field.uid: mapFieldToValueType(field)
    // };

    // parse valuesMap to Entity
    // try {
    // final syncable = getQuery().fromJsonInstance(valuesMap);
    // getQuery().mergeMode = MergeMode.Replace;
    // final updatedEntityCount = await getQuery()
    //     .setData(syncable)
    //     .save(saveOptions: SaveOptions(skipLocalSyncStatus: false));
    // return StoreResult(
    //     uid: form.code ?? '',
    //     valueStoreResult: updatedEntityCount > 0
    //         ? ValueStoreResult.FORM_CHANGED
    //         : ValueStoreResult.FORM_HAS_NOT_CHANGED);
    // } catch (e) {
    //   return StoreResult(
    //       uid: form.code ?? '',
    //       valueStoreResult: ValueStoreResult.ERROR_UPDATING_FORM,
    //       valueStoreResultMessage: 'Error: $e');
    // }
  }

  SyncableQuery getQuery() {
    return _syncableQuery;
  }

  // Future<SyncableEntity> getSyncableEntity() async {
  //   return _syncableEntity; //(await getQuery().byId(_entityUid).getOne())!;
  // }

  // Future<DynamicForm> getForm() async {
  //   return (await D2Remote.formModule.form
  //       .where(attribute: 'code', value: _syncableQueryProvider.formCode)
  //       .getOne())!;
  // }

  dynamic mapFieldToValueType(QFieldModel? field) {
    switch (field?.valueType) {
      case ValueType.Percentage:
      case ValueType.Integer:
      case ValueType.Number:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return int.tryParse(field?.value ?? '') ??
            double.tryParse(field?.value ?? '') ??
            field?.value;
      case ValueType.UnitInterval:
        return int.tryParse(field?.value ?? '') ??
            double.tryParse(field?.value ?? '') ??
            field?.value;
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

  // Future<String?> userFriendlyValue(String? value, ValueType? valueType) async {
  //   if (value.isNullOrEmpty) {
  //     return value;
  //   }
  //
  //   final checkResult = await check(valueType, value!);
  //   return checkResult ? valueTypeValue(valueType, value) : null;
  // }
  //
  // Future<bool> check(ValueType? valueType, String value) async {
  //   if (valueType != null) {
  //     if (valueType.isNumeric) {
  //       return double.tryParse(value) != null;
  //     } else {
  //       switch (valueType) {
  //         case ValueType.FileResource:
  //         case ValueType.Image:
  //           return (await D2Remote.fileResourceModule.fileResource
  //                   .byId(value)
  //                   .getOne()) !=
  //               null;
  //         case ValueType.OrganisationUnit:
  //           return (await D2Remote.assignmentModuleD.assignment
  //                   .byId(value)
  //                   .getOne()) !=
  //               null;
  //         default:
  //           return true;
  //       }
  //     }
  //   }
  //   return false;
  // }

  // Future<String?> valueTypeValue(ValueType? valueType, String value) async {
  //   switch (valueType) {
  //     case ValueType.OrganisationUnit:
  //       return (await D2Remote.organisationUnitModule.organisationUnit
  //               .byId(value)
  //               .getOne())
  //           ?.displayName;
  //     case ValueType.Image:
  //     case ValueType.FileResource:
  //       final fileResource =
  //           await D2Remote.fileResourceModule.fileResource.byId(value).getOne();
  //       return fileResource?.localFilePath ?? '';
  //     default:
  //       return value;
  //   }
  // }

  Future<String> saveFileResource(String path) async {
    return '';
  }
}
