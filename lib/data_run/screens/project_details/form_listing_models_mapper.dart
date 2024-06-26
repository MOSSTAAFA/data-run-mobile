import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/extensions/value_extensions.dart';
import 'package:mass_pro/commons/extensions/value_type_rendering_extension.dart';
import 'package:mass_pro/core/common/state.dart' as item_state;
import 'package:mass_pro/data_run/form/syncable_query_mapping_repository.dart';
import 'package:mass_pro/data_run/screens/form/form_input_field.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_items_models_notifier.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

class FormListingModelsMapper {
  FormListingModelsMapper(this.ref, this.projectDetailItemModel);

  final FormListingModelsMapperRef ref;
  final ProjectDetailItemModel projectDetailItemModel;

  Future<IList<FormListItemModel>> formListItemModels() async {
    final List<DynamicForm> activeForms = await D2Remote.formModule.form
        .where(attribute: 'activity', value: projectDetailItemModel.activity)
        .get();

    IList<FormListItemModel> formListItemModels = IList([]);

    for (final form in activeForms) {
      final entitiesToPost = await ref
          .watch(entityFormListingRepositoryProvider(form.code!))
          .getEntitiesCount(state: item_state.SyncableEntityState.TO_POST);

      final entitiesToUpdate = await ref
          .watch(entityFormListingRepositoryProvider(form.code!))
          .getEntitiesCount(state: item_state.SyncableEntityState.TO_UPDATE);

      final entitiesSynced = await ref
          .watch(entityFormListingRepositoryProvider(form.code!))
          .getEntitiesCount(state: item_state.SyncableEntityState.SYNCED);

      final entitiesWithError = await ref
          .watch(entityFormListingRepositoryProvider(form.code!))
          .getEntitiesCount(state: item_state.SyncableEntityState.ERROR);

      final entitiesStatus = await ref
          .watch(entityFormListingRepositoryProvider(form.code!))
          .getStatus();
      //
      // final DynamicForm? dynamicForm = await ref
      //     .watch(syncableQueryMappingRepositoryProvider(form.code!))
      //     .getForm();
      final DynamicForm? dynamicForm = await D2Remote.formModule.form
          .where(attribute: 'code', value: form.code!)
          .getOne();

      final formFieldModels = getFormFieldModels(dynamicForm!);

      formListItemModels = formListItemModels.add(FormListItemModel(
          form: form.id!,
          formCode: form.code!,
          fields: formFieldModels,
          team: projectDetailItemModel.team,
          formName: form.name,
          activity: projectDetailItemModel.activity,
          entitiesToPost: entitiesToPost,
          entitiesToUpdate: entitiesToUpdate,
          entitiesSynced: entitiesSynced,
          entitiesWithError: entitiesWithError,
          canAddNewEvent: true,
          description: '',
          state: entitiesStatus));
    }
    return formListItemModels;
  }

  IList<FormFieldModel>? getFormFieldModels(DynamicForm dynamicForm) {
    return dynamicForm.mainFields
        ?.map((field) => FormFieldModel(
              key: field.name,
              isFocused: false,
              isEditable: true,
              isMandatory: field.required,
              label: field.label,
              options: field.options?.lock,
              valueType: ValueType.getValueType(field.type),
              fieldRendering:
                  field.fieldValueRenderingType.toValueTypeRenderingType,
              relevantFields: field.fieldRules?.lock,
              controller: TextEditingController(),
            ))
        .toIList();
  }

  void disposeTextEditingControllers(List<FormFieldModel>? fieldModels) {
    fieldModels?.forEach((field) => field.controller?.dispose);
  }
}
