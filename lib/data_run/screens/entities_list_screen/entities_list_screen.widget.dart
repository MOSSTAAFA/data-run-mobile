import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/screens/entities_list_screen/entities_riverpod_providers.dart';
import 'package:mass_pro/data_run/screens/entities_list_screen/entity_filter_status.dart';
import 'package:mass_pro/data_run/screens/project_details/project_detail_item.model.dart';

class EntitiesListScreen extends ConsumerStatefulWidget {
  const EntitiesListScreen({super.key, required this.formModel});

  final FormListItemModel formModel;

  @override
  EntitiesListScreenState createState() => EntitiesListScreenState();
}

class EntitiesListScreenState extends ConsumerState<EntitiesListScreen> {
  EntityFilterStatus? _selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entities List'),
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
            _buildFilterChip(EntityFilterStatus.All, Icons.all_inclusive),
            _buildFilterChip(EntityFilterStatus.Sent, Icons.cloud_done),
            _buildFilterChip(EntityFilterStatus.Completed, Icons.check_circle),
            _buildFilterChip(EntityFilterStatus.ToComplete, Icons.update),
            _buildFilterChip(EntityFilterStatus.Error, Icons.error),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(EntityFilterStatus status, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(status.name),
        avatar: Icon(icon),
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
        formCode: widget.formModel.formCode, entityStatus: filteringStatus));

    return entitiesByStatus.when(
        data: (filteredEntities) => ListView.builder(
              itemCount: filteredEntities.length,
              itemBuilder: (context, index) {
                final SyncableEntity entity = filteredEntities[index];
                final SyncableEntityState? entitySyncableStatus =
                    SyncableEntityState.getEntityStatus(entity);

                return ListTile(
                  leading: _buildStatusIcon(
                      EntityFilterStatus.getFilterStatus(entitySyncableStatus)),
                  title: Text(entity.name ?? entity.uid!),
                  subtitle: Text(
                      EntityFilterStatus.getFilterStatus(entitySyncableStatus)
                          .name),
                  onTap: () {
                    // Handle entity tap
                  },
                );
              },
            ),
        error: (error, _) => Text('Error: $error'),
        loading: () => const CircularProgressIndicator());
  }

  Widget _buildStatusIcon(EntityFilterStatus? status) {
    switch (status) {
      case EntityFilterStatus.Sent:
        return const Icon(Icons.cloud_done, color: Colors.blue);
      case EntityFilterStatus.Completed:
        return const Icon(Icons.check_circle, color: Colors.green);
      case EntityFilterStatus.ToComplete:
        return const Icon(Icons.update, color: Colors.orange);
      case EntityFilterStatus.Error:
        return const Icon(Icons.error, color: Colors.red);
      default:
        return const Icon(Icons.help, color: Colors.grey);
    }
  }
}
