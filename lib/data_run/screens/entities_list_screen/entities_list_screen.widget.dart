import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:fast_immutable_collections/src/ilist/ilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/data_submission_screen/data_submission_screen.widget.dart';
import 'package:mass_pro/data_run/screens/entities_list_screen/state/form_submission_list_repository.dart';
import 'package:mass_pro/data_run/screens/project_details/entity_creation_dialog/entity_creation_dialog.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_items_models_notifier.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/q_sync_icon_button.widget.dart';
import 'package:mass_pro/data_run/screens/sync_dialog/sync_dialog.widget.dart';
import 'package:mass_pro/data_run/screens/sync_dialog/sync_submission_repository.dart';
import 'package:mass_pro/generated/l10n.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

class EntitiesListScreen extends ConsumerStatefulWidget {
  const EntitiesListScreen({super.key, this.formModel});

  final FormListItemModel? formModel;

  @override
  EntitiesListScreenState createState() => EntitiesListScreenState();
}

class EntitiesListScreenState extends ConsumerState<EntitiesListScreen> {
  SyncableEntityState? _selectedStatus;
  late final String formUid;

  @override
  void initState() {
    final Bundle eventBundle = Get.arguments as Bundle;
    formUid = eventBundle.getString(FORM_UID)!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(formUid),
        ),
        body: Column(
          children: [
            _buildFilterBar(),
            Expanded(child: _buildEntitiesList()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddEntityDialog(context, ref, widget.formModel);
          },
          tooltip: S.current.addNew,
          child: const Icon(Icons.add),
        ));
  }

  Widget _buildFilterBar() {
    final AsyncValue<IList<DataFormSubmission>> allEntities = ref.watch(
        formSubmissionsByStatusProvider(form: formUid, entityStatus: null));

    return allEntities.when(
      data: (entities) {
        final Map<SyncableEntityState, int> counts = _calculateCounts(entities);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: SyncableEntityState.statusFilterItems()
                  .map((SyncableEntityState status) =>
                      _buildFilterChip(status, counts[status] ?? 0))
                  .toList(),
            ),
          ),
        );
      },
      error: (Object error, StackTrace s) {
        debugPrint('error: $error');
        debugPrintStack(stackTrace: s, label: error.toString());
        return Text('Error: $error');
      },
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildFilterChip(SyncableEntityState status, int count) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(' ($count)'),
        showCheckmark: false,
        tooltip: status.name,
        avatar: _buildStatusIcon(status),
        selected: _selectedStatus == status,
        onSelected: (bool selected) {
          setState(() {
            _selectedStatus = selected ? status : null;
          });
        },
      ),
    );
  }

  Map<SyncableEntityState, int> _calculateCounts(
      IList<DataFormSubmission> entities) {
    final Map<SyncableEntityState, int> counts = <SyncableEntityState, int>{};

    for (final DataFormSubmission entity in entities) {
      final SyncableEntityState? status =
          SyncableEntityState.getEntityStatus(entity);
      if (status != null) {
        counts[status] = (counts[status] ?? 0) + 1;
      }
    }

    return counts;
  }

  Widget _buildEntitiesList() {
    final AsyncValue<IList<DataFormSubmission>> entitiesByStatus = ref.watch(
        formSubmissionsByStatusProvider(
            form: formUid, entityStatus: _selectedStatus));

    return entitiesByStatus.when(
        data: (IList<DataFormSubmission> filteredEntities) => ListView.builder(
              itemCount: filteredEntities.length,
              itemBuilder: (BuildContext context, int index) {
                final DataFormSubmission entity = filteredEntities[index];
                final SyncableEntityState? entitySyncableStatus =
                    SyncableEntityState.getEntityStatus(entity);
                final String summary = generateFormSummary(entity.toJson());

                return Card(
                  shadowColor: Theme.of(context).colorScheme.shadow,
                  surfaceTintColor: Theme.of(context).colorScheme.primary,
                  elevation: .7,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    isThreeLine: true,
                    leading: _buildStatusIcon(entitySyncableStatus),
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(entity.name ?? entity.uid!),
                          Text(
                            '${S.of(context).version}: ${entity.version}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ]),
                    subtitle: Text(summary),
                    trailing: QSyncIconButton(
                      state: entitySyncableStatus,
                      onUnsyncedPressed: () =>
                          _showSyncDialog(<String>[entity.uid!]),
                    ),
                    onTap: () {
                      _goToDataEntryForm(entity.uid!, entity.version);
                    },
                  ),
                );
              },
            ),
        error: (Object error, StackTrace s) {
          debugPrint('error: $error');
          debugPrintStack(stackTrace: s, label: error.toString());
          return Text('Error: $error');
        },
        loading: () => const CircularProgressIndicator());
  }

  Future<void> _showAddEntityDialog(
      BuildContext context, WidgetRef ref, FormListItemModel? formModel) async {

    if (!context.mounted) {
      return;
    }

    final String? result = await showDialog<String?>(
        context: context,
        builder: (BuildContext context) {
          return EntityCreationDialog(
              formModel: formModel!);
        });
    // go to form
    if (result != null) {
      await _goToDataEntryForm(result, formModel!.version);
      ref.invalidate(formSubmissionsByStatusProvider(form: formModel.form));
      ref.invalidate(projectDetailItemModelProvider);
    } else {
      // Handle cancellation or failure
    }
  }

  Widget _buildStatusIcon(SyncableEntityState? status) {
    switch (status) {
      case SyncableEntityState.SYNCED:
        return const Icon(Icons.cloud_done, color: Colors.green);
      case SyncableEntityState.TO_POST:
        return const Icon(Icons.cloud_upload, color: Colors.blue);
      case SyncableEntityState.TO_UPDATE:
        return const Icon(Icons.update, color: Colors.orange);
      case SyncableEntityState.ERROR:
        return const Icon(Icons.error, color: Colors.red);
      default:
        return const Icon(Icons.all_inclusive);
    }
  }

  Future<void> _goToDataEntryForm(String uid, int version) async {
    final Bundle eventBundle = Get.arguments as Bundle;
    Bundle bundle = eventBundle.putString(SYNCABLE_UID, uid);

    await Get.to(DataSubmissionScreen(),
        arguments: bundle);
    ref.invalidate(formSubmissionsByStatusProvider);
  }

  Future<void> _showSyncDialog(List<String> entityUids) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SyncDialog(
          entityUids: entityUids,
          syncEntity: (String uid) async {
            await ref
                .read(syncSubmissionRepositoryProvider)
                .syncEntities(<String>[uid]);
          },
        );
      },
    );
    ref.invalidate(formSubmissionsByStatusProvider);
  }
}

String generateFormSummary(Map<String, dynamic> fields) {
  final String fieldSummary = fields.entries
      .where((MapEntry<String, dynamic> entry) =>
          entry.key != 'name' &&
          entry.value != null &&
          !syncableVariable.contains(entry.key))
      .take(3)
      .map((MapEntry<String, dynamic> entry) => '${entry.key}: ${entry.value}')
      .join(', ');

  return fieldSummary.isNotEmpty ? fieldSummary : 'No additional data';
}

final List<String> syncableVariable = <String>[
  'id',
  'lastSyncMessage',
  'uid',
  'code',
  'name',
  'createdDate',
  'lastModifiedDate',
  'deleted',
  'synced',
  'syncFailed',
  'lastSyncSummary',
  'lastSyncDate',
  'startEntryTime',
  'finishedEntryTime',
  'activity',
  'team',
  'status',
  'geometry',
  'dirty',
  'version',
  'form',
];
