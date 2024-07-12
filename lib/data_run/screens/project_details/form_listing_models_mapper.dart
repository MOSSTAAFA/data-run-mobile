import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/field_value_rendering_type.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/core/common/state.dart' as item_state;
import 'package:mass_pro/data_run/form/form.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
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

      final formFieldModels = getFormFieldModels(form);

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

  IList<QFieldModel>? getFormFieldModels(DynamicForm dynamicForm) {
    return dynamicForm.mainFields
        ?.map((field) => QFieldModel(
              uid: field.name,
              isFocused: false,
              isEditable: true,
              isMandatory: field.required,
              label: field.label,
              options: field.options?.lock,
              valueType: ValueType.getValueType(field.type),
              fieldRendering: FieldValueRenderingUtil.getFieldValueRendering(
                  field.fieldValueRenderingType),
              fieldRules: field.rules?.lock,
            ))
        .toIList();
  }
}
