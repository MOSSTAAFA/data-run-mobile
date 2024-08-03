import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/field_value_rendering_type.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/core/common/state.dart' as item_state;
import 'package:mass_pro/data_run/form/form.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_items_models_notifier.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';

class FormListingModelsMapper {
  FormListingModelsMapper(this.ref, this.projectDetailItemModel);

  final FormListingModelsMapperRef ref;
  final ProjectDetailItemModel projectDetailItemModel;

  Future<IList<FormListItemModel>> formListItemModels() async {
    final List<DynamicForm> activeForms = await D2Remote.formModule.form
        .withFormDefinitions()
        .where(attribute: 'activity', value: projectDetailItemModel.activity)
        .get();

    IList<FormListItemModel> formListItemModels = IList(<FormListItemModel>[]);

    for (final DynamicForm form in activeForms) {
      final int entitiesToPost = await ref
          .watch(entityFormListingRepositoryProvider(form.code!))
          .getEntitiesCount(state: item_state.SyncableEntityState.TO_POST);

      final int entitiesToUpdate = await ref
          .watch(entityFormListingRepositoryProvider(form.code!))
          .getEntitiesCount(state: item_state.SyncableEntityState.TO_UPDATE);

      final int entitiesSynced = await ref
          .watch(entityFormListingRepositoryProvider(form.code!))
          .getEntitiesCount(state: item_state.SyncableEntityState.SYNCED);

      final int entitiesWithError = await ref
          .watch(entityFormListingRepositoryProvider(form.code!))
          .getEntitiesCount(state: item_state.SyncableEntityState.ERROR);

      final item_state.SyncableEntityState entitiesStatus = await ref
          .watch(entityFormListingRepositoryProvider(form.code!))
          .getStatus();

      final IList<QFieldModel>? formFieldModels = await getFormFieldModels(form);

      formListItemModels = formListItemModels.add(FormListItemModel(
          form: form.id!,
          formCode: form.code!,
          fields: formFieldModels,
          team: projectDetailItemModel.team,
          formName: form.name,
          version: form.version,
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

  Future<IList<QFieldModel>?> getFormFieldModels(
      DynamicForm form) async {
    final FormDefinition? latestFormDefinition =
        await D2Remote.formModule.formDefinition
            .byForm(form.id!)
            .getOne();
    return latestFormDefinition?.fields
        ?.where((DynamicFormField field) => field.mainField == true)
        .map((DynamicFormField field) => QFieldModel(
              uid: field.name,
              isFocused: false,
              isEditable: true,
              isMandatory: field.mandatory,
              label: getItemLocalString(field.label),
              options: field.options?.lock,
              valueType: ValueType.getValueType(field.type),
              fieldRendering: FieldValueRenderingUtil.getFieldValueRendering(
                  field.fieldValueRenderingType),
              fieldRules: field.rules?.lock,
            ))
        .toIList();
  }
}
