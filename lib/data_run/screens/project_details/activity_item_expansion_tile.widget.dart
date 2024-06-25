// ignore_for_file: prefer_if_elements_to_conditional_expressions

import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun_shared/utilities/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun_shared/utilities/field_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/core/common/state.dart' as item_state;
import 'package:mass_pro/data_run/form/syncable_query_mapping_repository.dart';
import 'package:mass_pro/data_run/screens/entities_list_screen/entities_list_screen.widget.dart';
import 'package:mass_pro/data_run/screens/form/form_screen.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_items_models_notifier.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:mass_pro/utils/mass_utils/utils.dart';

/// EventViewHolder
class ActivityItemsExpansionTiles extends ConsumerWidget {
  const ActivityItemsExpansionTiles({
    super.key,
    this.onGranularSyncClick,
    this.onDescriptionClick,
  });

  final void Function(ProjectDetailItemModel? projectItemModel)?
      onGranularSyncClick;
  final void Function(ProjectDetailItemModel? projectItemModel)?
      onDescriptionClick;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ProjectDetailItemModel projectDetailItemModel =
        ref.watch(projectDetailItemModelProvider);

    final Color? cardColor = projectDetailItemModel.activeFormCount > 0
        ? Colors.white
        : convertHexStringToColor('#FAFAFA');

    /// Get the icon based on Synced/synced status
    final Widget statusActionButton = when(projectDetailItemModel.state, {
      item_state.SyncableEntityState.uploadableStates: () => IconButton(
          style: IconButton.styleFrom(
            foregroundColor: Colors.grey,
          ),
          icon: const Icon(Icons.cloud_sync),
          onPressed: () => onGranularSyncClick?.call(projectDetailItemModel)),
      item_state.SyncableEntityState.ERROR: () =>
          const Icon(Icons.warning_amber, color: Colors.red),
    }).orElse(() => Icon(Icons.check, color: Colors.green[300]));

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ExpansionTile(
        collapsedBackgroundColor: Colors.grey[200],
        initiallyExpanded: projectDetailItemModel.valueListIsOpen,
        onExpansionChanged: (bool isExpanded) {
          ref
              .read(projectDetailItemsModelsNotifierProvider.notifier)
              .toggleExpansion(projectDetailItemModel);
        },
        leading: const Icon(Icons.event_note_sharp),
        trailing: statusActionButton,
        title: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projectDetailItemModel.activityName,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    '${projectDetailItemModel.activeFormCount} forms',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            // statusActionButton,
          ],
        ),
        subtitle: projectDetailItemModel.valueListIsOpen
            ? Text(
                'Click to view forms',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            : null,
        backgroundColor: cardColor,
        children: projectDetailItemModel.activeFormCount > 0
            ? [
                FormsTiles(
                  onList: navigateToEntitiesList,
                  onAdd: (FormListItemModel? formModel) =>
                      _showAddEntityDialog(context, ref, formModel),
                )
              ]
            : [const ListTile(title: Text('No forms available'))],
      ),
    );
  }

  Future<void> _showAddEntityDialog(
      BuildContext context, WidgetRef ref, FormListItemModel? formModel) async {
    if (formModel != null) {
      final TextEditingController _nameController = TextEditingController();
      final DynamicForm? form = await ref
          .watch(syncableQueryMappingRepositoryProvider(formModel.formCode))
          .getForm();
      final List<DynamicFormField>? formMainFields = form?.mainFields;

      // Check if the context is still mounted
      if (!context.mounted) {
        return;
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add New ${formModel.formName}'),
            content: Column(
              children: formMainFields
                      ?.map((field) =>
                          _buildFormField(context, field, _nameController))
                      .toList() ??
                  [],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final mainFieldValue = _nameController.text;
                  // Create the entity
                  await _createEntity(context, ref, formModel, mainFieldValue);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Widget _buildFormField(BuildContext context, DynamicFormField formMainField,
      TextEditingController controller) {
    final fieldType = FieldTypeUtil.getFieldType(formMainField.type);
    switch (fieldType) {
      case FieldType.text:
        return TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter ${formMainField.label}',
          ),
        );
      case FieldType.number:
        return TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            hintText: 'Enter number',
          ),
        );
      case FieldType.boolean:
        return SwitchListTile(
          title: Text('${formMainField.label}'),
          value: controller.text == 'true',
          onChanged: (bool value) {
            controller.text = value.toString();
          },
        );
      case FieldType.date:
        return TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter ${formMainField.label}',
          ),
          onTap: () async {
            // Use the mounted check before using the context
            FocusScope.of(context).requestFocus(FocusNode());
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (pickedDate != null) {
              controller.text = pickedDate.toString();
            }
          },
        );
      case FieldType.yesNo:
        return DropdownButtonFormField<String>(
          value: 'Yes',
          items: ['Yes', 'No']
              .map((String label) => DropdownMenuItem(
                    value: label,
                    child: Text(label),
                  ))
              .toList(),
          onChanged: (value) {
            controller.text = value!;
          },
          decoration: const InputDecoration(
            hintText: 'Select Yes or No',
          ),
        );
      case FieldType.unknown:
        return const Text('No valid main field type specified.');
      default:
        return TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter ${formMainField.label}',
          ),
        );
    }
  }

  Future<void> _createEntity(BuildContext context, WidgetRef ref,
      FormListItemModel formModel, String? mainFieldValue) async {
    // Implement the function to create the entity
    // This function should also handle opening the form to fill the rest of the fields

    // For example:
    // final newEntity = SyncableEntity(name: name, ...);
    // Add the new entity to your data source
    final syncableEntityInitialRepository = ref.watch(
        syncableEntityInitialRepositoryProvider(formCode: formModel.formCode));

    final activityUid = formModel.activity!;
    final teamUid = formModel.team!;

    final syncableId = await syncableEntityInitialRepository.createSyncable(
        activityUid: activityUid,
        teamUid: teamUid,
        mainFieldValue: mainFieldValue);

    // After adding the entity, close the dialog
    // Check if the context is still mounted
    if (!context.mounted) {
      return;
    }

    Navigator.of(context).pop();

    Bundle bundle = Bundle();
    bundle = bundle.putString(ACTIVITY_UID, formModel.activity);
    bundle = bundle.putString(TEAM_UID, formModel.team);
    bundle = bundle.putString(FORM_CODE, formModel.formCode);
    bundle = bundle.putString(FORM_UID, formModel.form);
    bundle = bundle.putString(SYNCABLE_UID, syncableId);

    /// navigate to the form screen to fill the rest of the fields
    Get.to(const FormScreen(), arguments: bundle);
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const FormScreen()));
  }

  void navigateToEntitiesList(FormListItemModel? formModel) {
    Get.to(EntitiesListScreen(
      formModel: formModel!,
    ));
  }
}

class FormsTiles extends ConsumerWidget {
  const FormsTiles({
    super.key,
    this.onAdd,
    this.onList,
  });

  final void Function(FormListItemModel? formModel)? onAdd;
  final void Function(FormListItemModel? formModel)? onList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formsList = ref.watch(formListItemModelsProvider);

    return formsList.when(
      data: (data) => Column(
        children: data
            .map<Widget>((FormListItemModel t) => Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t.formName!,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: [
                                /// Sent
                                Chip(
                                    avatar: CircleAvatar(
                                        foregroundColor: t.entitiesSynced > 0
                                            ? Colors.green
                                            : Colors.grey,
                                        child: const Icon(Icons.cloud_done)),
                                    label: Text('${t.entitiesSynced}')),

                                /// Finished
                                Chip(
                                  avatar: CircleAvatar(
                                      foregroundColor: t.entitiesToPost > 0
                                          ? Colors.blue
                                          : Colors.grey,
                                      child: const Icon(Icons.cloud_upload)),
                                  label: Text('${t.entitiesToPost}'),
                                ),

                                /// Not Finished
                                Chip(
                                  avatar: CircleAvatar(
                                    foregroundColor: t.entitiesToUpdate > 0
                                        ? Colors.orange
                                        : Colors.grey,
                                    child: const Icon(Icons.update),
                                  ),
                                  label: Text('${t.entitiesToUpdate}'),
                                ),

                                /// Errors
                                Chip(
                                  avatar: CircleAvatar(
                                    foregroundColor: t.entitiesWithError > 0
                                        ? Colors.redAccent
                                        : Colors.grey,
                                    child: Icon(Icons.error),
                                  ),
                                  label: Text('${t.entitiesWithError}'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () => onList?.call(t),
                                  icon: const Icon(Icons.list),
                                  label: const Text('View List'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    onAdd?.call(t);
                                  },
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add New'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
      error: (error, _) => Text('Error: $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
