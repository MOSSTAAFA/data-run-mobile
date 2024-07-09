import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:fast_immutable_collections/src/ilist/ilist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/data_submission_screen/data_submission_screen.widget.dart';
import 'package:mass_pro/data_run/screens/entities_list_screen/entities_riverpod_providers.dart';
import 'package:mass_pro/data_run/screens/shared_widgets/q_sync_icon_button.widget.dart';
import 'package:mass_pro/data_run/screens/sync_dialog/sync_dialog.widget.dart';
import 'package:mass_pro/data_run/screens/sync_dialog/sync_dialog_repository.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

class EntitiesListScreen extends ConsumerStatefulWidget {
  const EntitiesListScreen({super.key});

  @override
  EntitiesListScreenState createState() => EntitiesListScreenState();
}

class EntitiesListScreenState extends ConsumerState<EntitiesListScreen> {
  SyncableEntityState? _selectedStatus;
  late final String formCode;

  @override
  void initState() {
    final Bundle eventBundle = Get.arguments as Bundle;
    formCode = eventBundle.getString(FORM_CODE)!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(formCode),
      ),
      body: Column(
        children: [
          _buildFilterBar(),
          Expanded(child: _buildEntitiesList()),
        ],
      ),
    );
  }

  Widget _buildFilterBar() {
    final AsyncValue<IList<SyncableEntity>> allEntities = ref.watch(
        entitiesByStatusProvider(formCode: formCode, entityStatus: null));

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
                  .map(
                      (status) => _buildFilterChip(status, counts[status] ?? 0))
                  .toList(),
            ),
          ),
        );
      },
      error: (error, _) => Text('Error: $error'),
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
      IList<SyncableEntity> entities) {
    final Map<SyncableEntityState, int> counts = {};

    for (final entity in entities) {
      final status = SyncableEntityState.getEntityStatus(entity);
      if (status != null) {
        counts[status] = (counts[status] ?? 0) + 1;
      }
    }

    return counts;
  }

  Widget _buildEntitiesList() {
    final AsyncValue<IList<SyncableEntity>> entitiesByStatus = ref.watch(
        entitiesByStatusProvider(
            formCode: formCode, entityStatus: _selectedStatus));

    return entitiesByStatus.when(
        data: (filteredEntities) => ListView.builder(
              itemCount: filteredEntities.length,
              itemBuilder: (context, index) {
                final SyncableEntity entity = filteredEntities[index];
                final SyncableEntityState? entitySyncableStatus =
                    SyncableEntityState.getEntityStatus(entity);
                final summary = generateFormSummary(entity.toJson());

                return Card(
                  elevation: .7,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    leading: _buildStatusIcon(entitySyncableStatus),
                    title: Text(entity.name ?? entity.uid!),
                    subtitle: Text(summary),
                    trailing: QSyncIconButton(
                      state: entitySyncableStatus,
                      onUnsyncedPressed: () => _showSyncDialog([entity.uid!]),
                      // onErrorPressed: () => _showSyncDialog([entity.uid!]),
                    ),
                    onTap: () {
                      goToTappedEntityForm(entity.uid!);
                    },
                  ),
                );
              },
            ),
        error: (error, _) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator());
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

  Future<void> goToTappedEntityForm(String uid) async {
    final Bundle eventBundle = Get.arguments as Bundle;
    final bundle = eventBundle.putString(SYNCABLE_UID, uid);

    await Get.to(const DataSubmissionScreen(), arguments: bundle);
    ref.invalidate(entitiesByStatusProvider);
  }

  void _showSyncDialog(List<String> entityUids) {
    showDialog(
      context: context,
      builder: (context) {
        return SyncDialog(
          entityUids: entityUids,
          syncEntity: (uid) async {
            // Implement your sync logic here using the repository
            // Example:
            await ref
                .read(syncDialogRepositoryProvider(formCode: formCode))
                .syncEntities([uid]);
            // await myRepository.syncEntity(uid);
          },
        );
      },
    );
  }
}

String generateFormSummary(Map<String, dynamic> fields) {
  final String fieldSummary = fields.entries
      .where((entry) =>
          entry.key != 'name' &&
          entry.value != null &&
          !syncableVariable.contains(entry.key))
      .take(3)
      .map((entry) => '${entry.key}: ${entry.value}')
      .join(', ');

  return fieldSummary.isNotEmpty ? fieldSummary : 'No additional data';
}

final syncableVariable = [
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
  'dirty'
];
