import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/entities_list_screen/entities_riverpod_providers.dart';
import 'package:mass_pro/data_run/screens/entities_list_screen/entity_filter_status.dart';
import 'package:mass_pro/data_run/screens/form/form_screen.widget.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';

class EntitiesListScreen extends ConsumerStatefulWidget {
  const EntitiesListScreen({super.key});

  @override
  EntitiesListScreenState createState() => EntitiesListScreenState();
}

class EntitiesListScreenState extends ConsumerState<EntitiesListScreen> {
  EntityFilterStatus? _selectedStatus;
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildFilterChip(EntityFilterStatus.All),
            _buildFilterChip(EntityFilterStatus.Sent),
            _buildFilterChip(EntityFilterStatus.Completed),
            _buildFilterChip(EntityFilterStatus.ToComplete),
            _buildFilterChip(EntityFilterStatus.Error),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(EntityFilterStatus status) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(status.name),
        showCheckmark: false,
        tooltip: status.name,
        avatar: _buildStatusIcon(EntityFilterStatus.getSyncableStatus(status)),
        selected: _selectedStatus == status,
        onSelected: (bool selected) {
          setState(() {
            _selectedStatus = selected ? status : EntityFilterStatus.All;
          });
        },
      ),
    );
  }

  Widget _buildEntitiesList() {
    final filteringStatus =
        EntityFilterStatus.getSyncableStatus(_selectedStatus);
    final entitiesByStatus = ref.watch(entitiesByStatusProvider(
        formCode: formCode, entityStatus: filteringStatus));

    return entitiesByStatus.when(
        data: (filteredEntities) => ListView.builder(
              itemCount: filteredEntities.length,
              itemBuilder: (context, index) {
                final SyncableEntity entity = filteredEntities[index];
                final SyncableEntityState? entitySyncableStatus =
                    SyncableEntityState.getEntityStatus(entity);

                return ListTile(
                  leading: _buildStatusIcon(entitySyncableStatus),
                  title: Text(entity.name ?? entity.uid!),
                  subtitle: Text(
                      EntityFilterStatus.getFilterStatus(entitySyncableStatus)
                          .name),
                  onTap: () {
                    // Handle entity tap
                    goToTappedEntityForm(entity.uid!);
                  },
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

  void goToTappedEntityForm(String uid) {
    final Bundle eventBundle = Get.arguments as Bundle;
    final bundle = eventBundle.putString(SYNCABLE_UID, uid);

    /// navigate to the form screen to fill the rest of the fields
    Get.to(const FormScreen(), arguments: bundle);
  }
}
