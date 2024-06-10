import 'package:d2_remote/modules/datarun/shared/entities/syncable.entity.dart';
import 'package:mass_pro/core/common/state.dart';
import 'package:mass_pro/data_run/repository/activity_data_repository/activity_data_repository.dart';

class ActivityDataRepositoryContext {
  ActivityDataRepositoryContext(this.repository);

  final ActivityDataRepository<SyncableEntity> repository;

  Future<State> getState([String? id]) {
    return repository.getState(id);
  }

  Future<SyncableEntity> saveData(SyncableEntity data) {
    return repository.saveData(data);
  }

  Future<List<SyncableEntity>> fetchData([String? id]) {
    return repository.fetchData(id);
  }
}
