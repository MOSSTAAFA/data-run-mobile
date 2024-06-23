import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/core/common/state.dart';

enum EntityFilterStatus {
  Sent,
  Completed,
  ToComplete,
  Error,
  All;

  static SyncableEntityState? getSyncableStatus(EntityFilterStatus? satus) {
    return when(satus, {
      EntityFilterStatus.Sent: () => SyncableEntityState.SYNCED,
      EntityFilterStatus.Completed: () => SyncableEntityState.TO_POST,
      EntityFilterStatus.ToComplete: () => SyncableEntityState.TO_UPDATE,
      EntityFilterStatus.Error: () => SyncableEntityState.ERROR
    });
  }

  static EntityFilterStatus getFilterStatus(SyncableEntityState? status) {
    return when(status, {
      SyncableEntityState.SYNCED: () => EntityFilterStatus.Sent,
      SyncableEntityState.TO_POST: () => EntityFilterStatus.Completed,
      SyncableEntityState.TO_UPDATE: () => EntityFilterStatus.ToComplete,
      SyncableEntityState.ERROR: () => EntityFilterStatus.Error
    }).orElse(() => EntityFilterStatus.All);
  }
}
