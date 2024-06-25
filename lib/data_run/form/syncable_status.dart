enum SyncableStatus { ACTIVE, COMPLETED }

class SyncableStatusUtil {
  static SyncableStatus getEnumValue(String? status) {
    switch (status?.toLowerCase()) {
      case 'active':
        return SyncableStatus.ACTIVE;
      case 'completed':
        return SyncableStatus.COMPLETED;
      default:
        return SyncableStatus.ACTIVE;
    }
  }
}
