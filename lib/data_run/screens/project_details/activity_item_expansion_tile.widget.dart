import 'package:d2_remote/modules/datarun/common/standard_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/core/common/state.dart' as item_state;
import 'package:mass_pro/data_run/screens/entities_list_screen/entities_list_screen.widget.dart';
import 'package:mass_pro/data_run/screens/form/form_screen.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/entity_creation_dialog/entity_creation_dialog.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/form_tiles/form_tiles.widget.dart';
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
    final Widget statusActionButton =
        when(projectDetailItemModel.syncablesState, {
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
    // Check if the context is still mounted
    if (!context.mounted) {
      return;
    }

    await showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return EntityCreationDialog(formModel: formModel!);
      },
    ).then((result) {
      // go to form
      if (result != null) {
        _goToDataEntryForm(result as String, formModel!);
      } else {
        // Handle cancellation or failure
      }
    });

    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       title: Text('Add New ${formModel!.formName}'),
    //       content: FormBuilder(
    //         key: formKey,
    //         clearValueOnUnregister: true,
    //         onPopInvoked: (bool value) {
    //           /// show confirm, save, complete
    //           debugPrint('showDialog onPopInvoked ');
    //         },
    //         onChanged: () {
    //           formKey.currentState!.save();
    //           // Map<String, dynamic> representing all fields
    //           // 'form _formKey State Changed: ${_formKey.currentState!.value.toString()}');
    //           debugPrint(
    //               'form _formKey State Changed: ${formKey.currentState!.value.toString()}');
    //         },
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: formModel.fields
    //                   ?.map((fieldModel) =>
    //                       DynamicFormFieldWidget(fieldModel: fieldModel))
    //                   .toList() ??
    //               [],
    //         ),
    //       ),
    //       actions: [
    //         TextButton(
    //           onPressed: () {
    //             Navigator.of(context).pop(); // Close the dialog
    //           },
    //           child: const Text('Cancel'),
    //         ),
    //         ElevatedButton(
    //           onPressed: () async {
    //             // Create the entity
    //             formKey.currentState!.saveAndValidate();
    //             await _createEntity(context, ref, formModel);
    //           },
    //           child: const Text('OK'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }

  _goToDataEntryForm(String createdEntityUid, FormListItemModel formModel) {
    Bundle bundle = Bundle();
    bundle = bundle.putString(ACTIVITY_UID, formModel.activity);
    bundle = bundle.putString(TEAM_UID, formModel.team);
    bundle = bundle.putString(FORM_UID, formModel.form);
    bundle = bundle.putString(FORM_CODE, formModel.formCode);
    bundle = bundle.putString(SYNCABLE_UID, createdEntityUid);

    /// navigate to the form screen to fill the rest of the fields
    Get.to(const FormScreen(), arguments: bundle);
  }

  // Future<void> _createEntity(
  //     BuildContext context, WidgetRef ref, FormListItemModel formModel) async {
  //   // Implement the function to create the entity
  //   // This function should also handle opening the form to fill the rest of the fields
  //
  //   // For example:
  //   // final newEntity = SyncableEntity(name: name, ...);
  //   // Add the new entity to your data source
  //   final mainFieldValues =
  //       formModel.fields?.map((field) => field.controller?.text).toList();
  //   final syncableEntityInitialRepository = ref.watch(
  //       syncableEntityInitialRepositoryProvider(formCode: formModel.formCode));
  //
  //   final activityUid = formModel.activity!;
  //   final teamUid = formModel.team!;
  //
  //   final syncableId = await syncableEntityInitialRepository.createSyncable(
  //       activityUid: activityUid,
  //       teamUid: teamUid,
  //       mainFieldValues: formModel.fields);
  //
  //   // After adding the entity, close the dialog
  //   // Check if the context is still mounted
  //   if (!context.mounted) {
  //     return;
  //   }
  //
  //   Navigator.of(context).pop();
  //
  //   Bundle bundle = Bundle();
  //   bundle = bundle.putString(ACTIVITY_UID, formModel.activity);
  //   bundle = bundle.putString(TEAM_UID, formModel.team);
  //   bundle = bundle.putString(FORM_UID, formModel.form);
  //   bundle = bundle.putString(FORM_CODE, formModel.formCode);
  //   bundle = bundle.putString(SYNCABLE_UID, syncableId);
  //
  //   /// navigate to the form screen to fill the rest of the fields
  //   Get.to(const FormScreen(), arguments: bundle);
  //   // Navigator.push(context,
  //   //     MaterialPageRoute(builder: (context) => const FormScreen()));
  // }

  void navigateToEntitiesList(FormListItemModel? formModel) {
    Bundle bundle = Bundle();
    bundle = bundle.putString(ACTIVITY_UID, formModel!.activity);
    bundle = bundle.putString(TEAM_UID, formModel.team);
    bundle = bundle.putString(FORM_UID, formModel.form);
    bundle = bundle.putString(FORM_CODE, formModel.formCode);

    Get.to(const EntitiesListScreen(), arguments: bundle);
  }
}
