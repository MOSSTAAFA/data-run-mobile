import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:d2_remote/modules/datarun_shared/utilities/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/file_resource/entities/file_resource.entity.dart';
import 'package:d2_remote/modules/metadatarun/assignment/entities/d_assignment.entity.dart';
import 'package:d2_remote/shared/utilities/merge_mode.util.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/date/date_utils.dart';
import 'package:mass_pro/commons/extensions/string_extension.dart';
import 'package:mass_pro/commons/extensions/value_extensions.dart';
import 'package:mass_pro/commons/helpers/iterable.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/form_data_state_notifier.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/form_input_field.model.dart';
import 'package:mass_pro/data_run/utils/activity_type.dart';
import 'package:mass_pro/form/model/store_result.dart';
import 'package:mass_pro/form/model/value_store_result.dart';
import 'package:mass_pro/form/ui/validation/field_error_message_provider.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// from DataEntryRepository
///
class ChvPatientDataEntryRepository extends SyncableDataEntryRepository {
  ChvPatientDataEntryRepository({
    required super.syncableQuery,
    required super.entityUid,
  });
}

class ChvSessionDataEntryRepository extends SyncableDataEntryRepository {
  ChvSessionDataEntryRepository({
    required super.syncableQuery,
    required super.entityUid,
  });
}

class ItnsDataEntryRepository extends SyncableDataEntryRepository {
  ItnsDataEntryRepository(
      {required super.syncableQuery, required super.entityUid});
}

abstract class SyncableDataEntryRepository {
  SyncableDataEntryRepository({
    required this.syncableQuery,
    required String entityUid,
  }) : this._entityUid = entityUid;

  /// provided by overridden provider
  final String _entityUid;

  final SyncableQuery syncableQuery;

  // final FieldViewModelFactory fieldFactory;

  Future<IList<FieldInputModel>> list() async {
    final SyncableEntity syncableEntity =
        (await syncableQuery.byId(_entityUid).getOne())!;

    final DynamicForm form = (await D2Remote.formModule.form
        .where(attribute: 'activity', value: syncableEntity.activity)
        .getOne())!;

    final entityMap = IMapConst(syncableEntity.toJson());

    return form.fieldsList?.lock
            .map((field) =>
                mapToModel(field: field, value: entityMap.get(field.name)))
            .toIList() ??
        IList();
  }

  FieldInputModel mapToModel({required DynamicFormField field, dynamic value}) {
    return FieldInputModel(
        key: field.name,
        focused: false,
        editable: true,
        mandatory: field.required,
        label: field.label,
        value: value,
        valueType: field.type.name.toValueType,
        options: field.options,
        dependentFieldId: field.fieldRule?.dependentFieldId,
        dependentFieldValues: field.fieldRule?.dependentFieldValues);
  }

  Future<FieldInputModel> updateField(
      FieldInputModel fieldUiModel, String? warningMessage) async {
    return warningMessage != null
        ? fieldUiModel.setError(warningMessage)
        : fieldUiModel;
  }

  /// From FormValueStore
  Future<StoreResult> save(String fieldKey, String? value) async {
    final SyncableEntity syncableEntity =
        (await syncableQuery.byId(_entityUid).getOne())!;

    final DynamicForm form = (await D2Remote.formModule.form
        .where(attribute: 'activity', value: syncableEntity.activity)
        .getOne())!;

    final IList<DynamicFormField> fields = form.fieldsList?.lock ?? IList([]);

    final ValueType? valueType = fields
        .firstOrNullWhere((t) => t.name == fieldKey)
        ?.type
        .name
        .toValueType;

    dynamic newValue = value;

    if (valueType == ValueType.Image && value != null) {
      newValue = await saveFileResource(value);
    }

    IMap<String, dynamic> entityMap = IMap(syncableEntity.toJson());

    /// if the key is in the form but doesn't have a field in the entity
    if (!entityMap.containsKey(fieldKey)) {
      return StoreResult(
          uid: fieldKey,
          valueStoreResult: ValueStoreResult.KEY_IS_NOT_IN_ENTITY);
    }

    ///
    ///

    final storedDataValue = entityMap.get(fieldKey);

    if (storedDataValue != newValue) {
      if (value != null) {
        syncableQuery.mergeMode = MergeMode.Merge;
        entityMap = entityMap.add(fieldKey, value);
        final newEntity = syncableQuery.fromJsonInstance(entityMap.unlock);

        /// if Updated save will return 1
        final int updatedEntityCount = await syncableQuery
            .setData(newEntity)
            .save(saveOptions: SaveOptions(skipLocalSyncStatus: true));

        if (updatedEntityCount > 0) {
          return StoreResult(
              uid: fieldKey, valueStoreResult: ValueStoreResult.VALUE_CHANGED);
        } else {
          return StoreResult(
              uid: fieldKey,
              valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
        }
      } else {
        syncableQuery.mergeMode = MergeMode.Replace;
        entityMap = entityMap.add(fieldKey, value);
        final newEntity = syncableQuery.fromJsonInstance(entityMap.unlock);

        /// if Updated save will return 1
        final int updatedEntityCount = await syncableQuery
            .setData(newEntity)
            .save(saveOptions: SaveOptions(skipLocalSyncStatus: true));
        // valueRepository.blockingDeleteIfExist();
        return StoreResult(
            uid: fieldKey, valueStoreResult: ValueStoreResult.VALUE_CHANGED);
      }
    } else {
      return StoreResult(
          uid: fieldKey,
          valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }
  }

  Future<String?> userFriendlyValue(String? value, ValueType? valueType) async {
    if (value.isNullOrEmpty) {
      return value;
    }

    /// return false when (valueType is orgUnit or file and not exists,
    /// or it's rather a Numeric but can't be parsed to Double
    /// if it's not any of this returns true so we go with to check inside
    /// checkValueTypeValue(valueType, value);
    final checkResult = await check(valueType, value!);
    if (checkResult) {
      /// return the user friendly value
      /// if orgUnit/file return its entity
      /// if Date or Date time return ui format. if error, it returns empty ''
      /// if none of this return the same passed value.
      return valueTypeValue(valueType, value);
    }
    return null;
  }

  Future<bool> check(ValueType? valueType, String value) async {
    if (valueType != null) {
      if (valueType.isNumeric) {
        try {
          value.toDouble();
          return true;
        } catch (e) {
          return false;
        }
      } else {
        switch (valueType) {
          case ValueType.FileResource:
          case ValueType.Image:
            final FileResource? fileResource = await D2Remote
                .fileResourceModule.fileResource
                .byId(value)
                .getOne();
            return fileResource != null;
          case ValueType.OrganisationUnit:
            final DAssignment? orgUnit = await D2Remote
                .assignmentModuleD.assignment
                .byId(value)
                .getOne();
            return orgUnit != null;
          default:
            break;
        }
        return true;
      }
    }
    return false;
  }

  Future<String?> valueTypeValue(ValueType? valueType, String value) async {
    switch (valueType) {
      case ValueType.OrganisationUnit:
        return await D2Remote.organisationUnitModule.organisationUnit
            .byId(value)
            .getOne()
            .displayName;
      case ValueType.Image:
      case ValueType.FileResource:
        final FileResource? fileResource =
            await D2Remote.fileResourceModule.fileResource.byId(value).getOne();
        if (fileResource != null) {
          return fileResource.localFilePath;
        } else {
          return '';
        }
      case ValueType.Date:
        try {
          return DateUtils.uiDateFormat()
              .format(DateUtils.databaseDateFormatNoSeconds().parse(value));
        } catch (e) {
          return '';
        }
      case ValueType.DateTime:
        try {
          return DateUtils.dateTimeFormat()
              .format(DateUtils.databaseDateFormatNoSeconds().parse(value));
        } catch (e) {
          return '';
        }
      case ValueType.Time:
        try {
          return DateUtils.timeFormat()
              .format(DateUtils.timeFormat().parse(value));
        } catch (e) {
          return '';
        }
      default:
        break;
    }

    return value;
  }

  Future<String> saveFileResource(String path) async {
    // TODO(NMC): implement
    // var file = FileResizerHelper.resizeFile(
    //     File(path), FileResizerHelper.Dimension.MEDIUM);
    // return d2.fileResourceModule().fileResources().blockingAdd(file)
    return '';
  }
// bool isEvent();
}