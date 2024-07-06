import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';

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

  static SyncableEntityState? getEntityStatus(SyncableEntity entity) {
    if (entity.synced ?? false) return SYNCED;
    if (entity.status == 'COMPLETED') return TO_POST;
    if (entity.syncFailed ?? false) return ERROR;
    if (entity.dirty) return TO_UPDATE;
    return null;
  }

  static List<SyncableEntityState> statusFilterItems() {
    return [SYNCED, TO_POST, TO_UPDATE, ERROR];
  }
}
