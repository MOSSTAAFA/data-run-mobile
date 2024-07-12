import 'dart:async';

import 'package:d2_remote/core/datarun/utilities/date_utils.dart';
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
import 'package:mass_pro/core/d2_remote_extensions/tracker/queries/base_query_extension.dart';
import 'package:mass_pro/data_run/form/syncable_object_repository.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/form/model/key_board_action_type.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

class SyncableEntityMappingRepository {
  SyncableEntityMappingRepository(
      {required this.form,
      required SyncableQuery syncableQuery,
      required SyncableEntity syncableEntity,
      required SyncableObjectRepository syncableObjectRepository})
      : _syncableQuery = syncableQuery,
        _syncableEntity = syncableEntity,
        _syncableObjectRepository = syncableObjectRepository;

  final DynamicForm form;
  SyncableEntity _syncableEntity;
  final SyncableQuery _syncableQuery;
  final SyncableObjectRepository _syncableObjectRepository;

  Future<int> saveFormData(final IList<QFieldModel> formDataFields) async {
    final IMap<String, QFieldModel> hiddenFields =
        IMap.fromIterable<String, QFieldModel, QFieldModel>(
            formDataFields.where((field) => !field.isVisible),
            keyMapper: (field) => field.uid,
            valueMapper: (field) => field);

    final IList<QFieldModel> clearedInvisibleFields = formDataFields
        .map((field) => hiddenFields.containsKey(field.uid)
            ? field.builder().setValue(null).build()
            : field)
        .toIList();

    final IMap<String, dynamic> pendingUpdatesDataMap = <String, dynamic>{
      for (final field in clearedInvisibleFields)
        field.uid: mapFieldToValueType(field)
    }.lock;

    // final List<StoreResult> result = await Future.wait(
    //     clearedInvisibleFields.map((field) =>
    //         saveValue(field.uid, mapFieldToValueType(field), field.valueType)));

    final storedEntity = await getQuery().byId(_syncableEntity.uid!).getOne();
    storedEntity!.lastModifiedDate =
        DateUtils.databaseDateFormat().format(DateTime.now());
    storedEntity.status = 'ACTIVE';
    storedEntity.dirty = true;

    final IMap<String, dynamic> storedEntityMap = _syncableEntity.toJson().lock;

    final IMap<String, dynamic> mergedWithUpdates =
        storedEntityMap.addAll(pendingUpdatesDataMap);

    getQuery().resetFilters().mergeMode = MergeMode.Replace;

    final updatedEntity = getQuery().fromJsonInstance(mergedWithUpdates.unlock);

    return getQuery()
        .setData(updatedEntity)
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: false));
  }

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
  //       SyncableEntity toUpdateEntity =
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

  Future<SyncableEntity> getSyncableEntity() async {
    return await _syncableQuery.byId(_syncableEntity.uid!).getOne();
  }

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

  FutureOr<IMap<String, QFieldModel>> map() async {
    final syncableEntity = await getSyncableEntity();

    final entityMap = IMapConst(syncableEntity.toJson());

    IMap<String, QFieldModel> fieldsModelsMap = IMap({});
    for (final field in form.fields!) {
      fieldsModelsMap = fieldsModelsMap.add(field.name,
          mapToModel(field: field, value: entityMap.get(field.name)));
    }
    return fieldsModelsMap;
  }

  FutureOr<IList<QFieldModel>> list() async {
    // final form = await getForm();
    final syncableEntity = await getSyncableEntity();

    final entityMap = IMapConst(syncableEntity.toJson());

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

  // Future<StoreResult> save(String fieldKey, String? value) async {
  //   final fields = form.fields?.lock ?? IList([]);
  //   final valueType =
  //       fields.firstOrNullWhere((t) => t.name == fieldKey)?.type.toValueType;
  //
  //   return saveValue(fieldKey, value, valueType);
  // }

  SyncableQuery getQuery() {
    return _syncableQuery;
  }

  Future<String> saveFileResource(String path) async {
    return '';
  }
}
