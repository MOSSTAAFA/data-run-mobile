import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/screens/submission_list/submission_list_screen.widget.dart';
import 'package:mass_pro/data_run/screens/submission_list/submission_creation_dialog.widget.dart';
import 'package:mass_pro/data_run/screens/project_activity_detail/form_tiles/form_tiles.widget.dart';
import 'package:mass_pro/data_run/screens/project_activity_detail/model/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_activity_detail/model/project_detail_items_models_notifier.dart';
import 'package:mass_pro/data_run/screens/submission_screen/submission_tab_screen.widget.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

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

    // /// Get the icon based on Synced/synced status
    // final Widget statusActionButton = when(
    //     projectDetailItemModel.syncablesState, <Object,
    //         StatelessWidget Function()>{
    //   item_state.SyncableEntityState.uploadableStates: () => IconButton(
    //       style: IconButton.styleFrom(
    //         foregroundColor: Colors.grey,
    //       ),
    //       icon: const Icon(Icons.cloud_sync),
    //       onPressed: () => onGranularSyncClick?.call(projectDetailItemModel)),
    //   item_state.SyncableEntityState.ERROR: () =>
    //       const Icon(Icons.warning_amber, color: Colors.red),
    // }).orElse(() => Icon(Icons.check, color: Colors.green[300]));

    return Card(
      shadowColor: Theme.of(context).colorScheme.shadow,
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ExpansionTile(
        initiallyExpanded: projectDetailItemModel.valueListIsOpen,
        leading: const Icon(Icons.event_note_sharp),
        // trailing: Consumer(
        //   builder: (context, ref, child) {
        //     ref.watch(provider)
        //   },
        // ),
        title: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    projectDetailItemModel.activity.name!,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    S.of(context).form(projectDetailItemModel.activityForms),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
        subtitle: projectDetailItemModel.valueListIsOpen
            ? Text(
                S.of(context).viewAvailableForms,
                style: Theme.of(context).textTheme.bodySmall,
              )
            : null,
        // backgroundColor: cardColor,
        children: projectDetailItemModel.activityForms > 0
            ? <Widget>[
                FormsTiles(
                  activity: projectDetailItemModel.activity.uid!,
                  team: projectDetailItemModel.team!.uid!,
                  onList: (FormListItemModel? model) async {
                    await navigateToEntitiesList(model);
                    // ref.invalidate(projectDetailItemModelProvider);
                  },
                  onAdd: (FormListItemModel? formModel) =>
                      _showAddEntityDialog(context, ref, formModel),
                )
              ]
            : <Widget>[
                ListTile(
                    title: Text(
                  S.of(context).noFormsAvailable,
                ))
              ],
      ),
    );
  }

  Future<void> _showAddEntityDialog(
      BuildContext context, WidgetRef ref, FormListItemModel? formModel) async {
    if (!context.mounted) {
      return;
    }

    final String? result = await showDialog<String?>(
        context: context,
        builder: (BuildContext context) {
          return SubmissionCreationDialog(
            form: formModel!.form.form!,
            activity: formModel.form.activity,
            team: formModel.team!,
          );
        });
    // go to form
    if (result != null) {
      await _goToDataEntryForm(result, formModel!);
      // ref.invalidate(projectDetailItemModelProvider);
    } else {
      // Handle cancellation or failure
    }
  }

  Future<void> _goToDataEntryForm(
      String createdEntityUid, FormListItemModel formModel) async {
    Bundle bundle = Bundle();
    bundle = bundle.putString(ACTIVITY_UID, formModel.form.activity);
    bundle = bundle.putString(TEAM_UID, formModel.team);
    bundle = bundle.putString(FORM_UID, formModel.form.form);
    bundle = bundle.putInt(FORM_VERSION, formModel.form.version);

    bundle = bundle.putString(SYNCABLE_UID, createdEntityUid);

    await Get.to(DataSubmissionScreen(), arguments: bundle);
  }

  Future<void> navigateToEntitiesList(FormListItemModel? formModel) async {
    Bundle bundle = Bundle();
    bundle = bundle.putString(ACTIVITY_UID, formModel!.form.activity);
    bundle = bundle.putString(TEAM_UID, formModel.team);
    bundle = bundle.putString(FORM_UID, formModel.form.form);
    bundle = bundle.putInt(FORM_VERSION, formModel.form.version);

    await Get.to(SubmissionListScreen(), arguments: bundle);
  }
}
