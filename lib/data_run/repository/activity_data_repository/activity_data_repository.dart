import 'package:d2_remote/modules/datarun/shared/entities/syncable.entity.dart';
import 'package:mass_pro/core/common/state.dart';

mixin ActivityDataRepository<T extends SyncableEntity> {
  Future<State> getState(String? id);

  Future<List<T>> fetchData([String? id]);

  Future<T> saveData(SyncableEntity data);
}
