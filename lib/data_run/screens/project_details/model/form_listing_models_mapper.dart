// import 'package:d2_remote/d2_remote.dart';
// import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
// import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/field_value_rendering_type.dart';
// import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:mass_pro/core/common/state.dart' as item_state;
// import 'package:mass_pro/data_run/form/form_configuration.dart';
// import 'package:mass_pro/data_run/screens/data_submission_form/model/option_configuration.dart';
// import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
// import 'package:mass_pro/data_run/screens/entities_list_screen/state/form_submission_list_repository.dart';
// import 'package:mass_pro/data_run/screens/project_details/model/entity_count.dart';
// import 'package:mass_pro/data_run/screens/project_details/model/project_detail_item.model.dart';
// import 'package:mass_pro/data_run/screens/project_details/model/project_detail_items_models_notifier.dart';
// import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
// import 'package:mass_pro/sdk/core/common/value_type.dart';
//
// class FormListingModelsMapper {
//   FormListingModelsMapper(this.ref, this.projectDetailItemModel);
//
//   final FormListingModelsMapperRef ref;
//   final ProjectDetailItemModel projectDetailItemModel;
//
//   // Future<IList<FormListItemModel>> formListItemModels() async {
//   //  ///
//   //   IList<FormListItemModel> formListItemModels = IList(<FormListItemModel>[]);
//   //
//   //   for (final DynamicForm form in activeForms) {
//   //     final int entitiesToPost = await ref
//   //         .watch(formSubmissionListRepositoryProvider(form.uid!))
//   //         .getEntitiesCount(state: item_state.SyncableEntityState.TO_POST);
//   //
//   //     final int entitiesToUpdate = await ref
//   //         .watch(formSubmissionListRepositoryProvider(form.uid!))
//   //         .getEntitiesCount(state: item_state.SyncableEntityState.TO_UPDATE);
//   //
//   //     final int entitiesSynced = await ref
//   //         .watch(formSubmissionListRepositoryProvider(form.uid!))
//   //         .getEntitiesCount(state: item_state.SyncableEntityState.SYNCED);
//   //
//   //     final int entitiesWithError = await ref
//   //         .watch(formSubmissionListRepositoryProvider(form.uid!))
//   //         .getEntitiesCount(state: item_state.SyncableEntityState.ERROR);
//   //
//   //     final item_state.SyncableEntityState entitiesStatus = await ref
//   //         .watch(formSubmissionListRepositoryProvider(form.uid!))
//   //         .getFormSubmissionsStatus();
//   //
//   //     final IList<QFieldModel>? formFieldModels =
//   //         await getFormFieldModels(form);
//   //
//   //     formListItemModels = formListItemModels.add(FormListItemModel(
//   //         form: form.id!,
//   //         formCode: form.code!,
//   //         fields: formFieldModels,
//   //         team: projectDetailItemModel.team,
//   //         formName: form.name,
//   //         version: form.version,
//   //         activity: projectDetailItemModel.activity,
//   //         entityCount: EntityByStatusCount(
//   //             toPost: entitiesToPost,
//   //             toUpdate: entitiesToUpdate,
//   //             synced: entitiesSynced,
//   //             withError: entitiesWithError),
//   //         canAddNewEvent: true,
//   //         description: '',
//   //         state: entitiesStatus));
//   //   }
//   //   return formListItemModels;
//   // }
//
//   Future<IList<QFieldModel>?> getFormFieldModels(DynamicForm form) async {
//     final FormDefinition? latestFormDefinition =
//         await D2Remote.formModule.formDefinition.byForm(form.id!).getOne();
//     final formConfig =
//         await ref.read(formConfigurationProvider(form.uid!).future);
//     return latestFormDefinition?.fields
//         ?.where((DynamicFormField field) => field.mainField == true)
//         .map((DynamicFormField field) => QFieldModel(
//               uid: field.name,
//               isFocused: false,
//               isEditable: true,
//               isMandatory: field.mandatory,
//               label: getItemLocalString(field.label),
//               optionConfiguration:
//                   ValueType.getValueType(field.type).isWithOptions
//                       ? _getOptionConfiguration(field, formConfig)
//                       : null,
//               // options: field.options?.lock,
//               valueType: ValueType.getValueType(field.type),
//               fieldRendering: FieldValueRenderingUtil.getFieldValueRendering(
//                   field.fieldValueRenderingType),
//               fieldRules: field.rules?.lock,
//             ))
//         .toIList();
//   }
//
//   OptionConfiguration? _getOptionConfiguration(
//       DynamicFormField field, FormConfiguration formConfiguration) {
//     final IList<FormOption> options =
//         formConfiguration.optionLists.get(field.listName!) ?? IList();
//
//     return OptionConfiguration.config(options.length, () {
//       return options;
//     }).updateOptionsToHideAndShow(
//         optionsToShow:
//             options.map((FormOption option) => option.name).toIList(),
//         optionsToHide: const IListConst([]));
//   }
// }
