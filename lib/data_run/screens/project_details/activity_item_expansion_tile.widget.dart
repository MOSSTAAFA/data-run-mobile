// ignore_for_file: prefer_if_elements_to_conditional_expressions

import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/core/common/state.dart' as item_state;
import 'package:mass_pro/data_run/screens/entities_list_screen/entities_list_screen.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_items_models_notifier.dart';
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
      item_state.SyncableEntityState.uploadableStates: () => OutlinedButton.icon(
          label: Icon(Icons.sync, color: Colors.green[300]),
          onPressed: () => onGranularSyncClick?.call(projectDetailItemModel)),
      item_state.SyncableEntityState.ERROR: () =>
          Icon(Icons.warning_amber, color: Colors.red),
    }).orElse(() => Icon(Icons.check, color: Colors.green[300]));

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ExpansionTile(
        // maintainState: true,
        collapsedBackgroundColor: Colors.grey[200],
        initiallyExpanded: projectDetailItemModel.valueListIsOpen,
        onExpansionChanged: (bool isExpanded) {
          ref
              .read(projectDetailItemsModelsNotifierProvider.notifier)
              .toggleExpansion(projectDetailItemModel);
        },
        leading: const Icon(Icons.event_note_sharp),
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
            statusActionButton,
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
                  onAdd: navigateToAddScreen,
                )
              ]
            : [const ListTile(title: Text('No forms available'))],
      ),
    );
  }

  void navigateToEntitiesList(FormListItemModel? formModel) {
    Get.to(EntitiesListScreen(formModel: formModel!,));
  }

  void navigateToAddScreen(FormListItemModel? formModel) {}
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
            .map<Widget>((t) => Padding(
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
                                Chip(
                                  avatar: const CircleAvatar(
                                    child: Icon(Icons.cloud_done),
                                  ),
                                  label: Text('${t.entitiesSynced}' /*Sent*/),
                                ),
                                Chip(
                                  avatar: const CircleAvatar(
                                    child: Icon(Icons.check_circle),
                                  ),
                                  label:
                                      Text('${t.entitiesToPost}' /*Finished*/),
                                ),
                                Chip(
                                  avatar: const CircleAvatar(
                                    child: Icon(Icons.update),
                                  ),
                                  label: Text(
                                      '${t.entitiesToUpdate}' /*Not Finished*/),
                                ),
                                Chip(
                                  avatar: const CircleAvatar(
                                    child: Icon(Icons.error),
                                  ),
                                  label:
                                      Text('${t.entitiesWithError}' /*Errors*/),
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
                                  label: const Text('View Entities'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () => onAdd?.call(t),
                                  icon: const Icon(Icons.add),
                                  label: const Text('Add Entity'),
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
