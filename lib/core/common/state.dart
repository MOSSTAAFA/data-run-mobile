import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';

enum SyncableEntityState {
  TO_POST,
  TO_UPDATE,
  ERROR,
  SYNCED,
  WARNING,
  UPLOADING,
  SYNCED_VIA_SMS,
  SENT_VIA_SMS;

  static List<SyncableEntityState> get uploadableStatesIncludingError => [
        TO_POST,
        TO_UPDATE,
        SENT_VIA_SMS,
        SYNCED_VIA_SMS,
        UPLOADING,
        ERROR,
        WARNING
      ];

  static List<SyncableEntityState> get uploadableStates =>
      [TO_POST, TO_UPDATE, SENT_VIA_SMS, SYNCED_VIA_SMS, UPLOADING];

  bool isUploadState() {
    return uploadableStates.contains(this);
  }

  static  SyncableEntityState? getEntityStatus(SyncableEntity entity) {
    return when(true, {
      entity.synced ?? false: () => SYNCED,
      entity.status == 'COMPLETED': () => TO_POST,
      entity.syncFailed ?? false: () => ERROR,
      entity.dirty: () => TO_UPDATE,
    });
  }
}
