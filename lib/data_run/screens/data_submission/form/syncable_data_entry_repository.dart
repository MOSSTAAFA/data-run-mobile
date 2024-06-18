import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/chv_register.entity.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/patient_info.entity.dart';
import 'package:d2_remote/modules/datarun_shared/utilities/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/commons/extensions/value_extensions.dart';
import 'package:mass_pro/data_run/screens/data_submission/form/form_input_field.model.dart';

/// from DataEntryRepository
///

class ChvPatientDataEntryRepository extends SyncableDataEntryRepository {
  ChvPatientDataEntryRepository({
    required String entityUid,
    required PatientInfo entity,
    required DynamicForm form,
  })  : this._entityUid = entityUid,
        this._entity = entity,
        this._form = form,
        _entityMap = IMapConst(entity.toJson());

  /// provided by overridden provider
  final String _entityUid;

  /// Syncable data entity
  /// provided by overridden provider
  final PatientInfo _entity;

  final IMap<String, dynamic> _entityMap;

  /// provided by overridden provider
  final DynamicForm _form;

  @override
  Future<IList<FieldInputModel>> list() async {
    final ChvRegister entity =
        (await D2Remote.iccmModule.chvRegister.byId(_entityUid).getOne())!;
    final PatientInfo patient =
        (await D2Remote.iccmModule.patientInfo.byId(entity.patient).getOne())!;
    final DActivity activity = (await D2Remote.activityModuleD.activity
        .byId(patient.activity)
        .getOne())!;

    final DynamicForm form = (await D2Remote.formModule.form
        .where(attribute: 'activity', value: activity.id)
        .getOne())!;

    final entityMap = IMapConst(entity.toJson());

    return form.fieldsList?.lock
            .map((field) =>
                mapToModel(field: field, value: entityMap.get(field.name)))
            .toIList() ??
        IList();
  }

  FieldInputModel mapToModel({required DynamicFormField field, dynamic value}) {
    // final storedDependentFieldValue =
    //     dynamicField.fieldRule?.dependentFieldId?.let((t) => _entityMap.get(t));

    // final dependentFieldId = dynamicField.fieldRule?.dependentFieldId;
    // final dependentFieldValue = dynamicField.fieldRule?.dependentFieldValue;
    //
    // bool isVisible = true;
    // if (dependentFieldId != null) {
    //   isVisible = dependentFieldValue == storedDependentFieldValue;
    // }
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
}

class ItnsDataEntryRepository extends SyncableDataEntryRepository {
  ItnsDataEntryRepository(this.entityUid);

  final String? entityUid;

  @override
  Future<IList<FieldInputModel>> list() {
    throw UnimplementedError();
  }
}

abstract class SyncableDataEntryRepository {
  // D2Remote d2;
  // final FieldViewModelFactory fieldFactory;

  Future<IList<FieldInputModel>> list();

  // Future<List<String>> sectionUids();

  // FieldUiModel updateSection(FieldUiModel sectionToUpdate, bool isSectionOpen,
  //     int totalFields, int fieldsWithValue, int errorCount, int warningCount);

  Future<FieldInputModel> updateField(
      FieldInputModel fieldUiModel, String? warningMessage) async {
    return warningMessage != null
        ? fieldUiModel.setError(warningMessage)
        : fieldUiModel;
  }

// bool isEvent();
}
