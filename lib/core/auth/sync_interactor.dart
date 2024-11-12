import 'package:shared_preferences/shared_preferences.dart';

class SyncInteractor {
  SyncInteractor(this.preferences);

  // Check if the initial sync has been performed
  final SharedPreferences preferences;

  bool isSyncDone() {
    // Check if the value for WAS_INITIAL_SYNC_DONE exists and is "True"
    final syncStatus = preferences.getString('WAS_INITIAL_SYNC_DONE') ?? '';
    return syncStatus == 'True';
  }

  // Mark sync as completed
  Future<void> markSyncDone() async {
    // Set the value for WAS_INITIAL_SYNC_DONE to "True"
    await preferences.setString('WAS_INITIAL_SYNC_DONE', 'True');
  }

  // Optionally, you can reset or clear sync status
  Future<void> resetSync() async {
    await preferences.remove('WAS_INITIAL_SYNC_DONE');
  }
}
