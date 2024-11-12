import 'package:d2_remote/core/datarun/logging/logging.dart';
import 'package:d2_remote/modules/datarun_shared/sync/call/d2_progress.dart';
import 'package:d2_remote/modules/datarun_shared/sync/sync_metadata.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sync_service.g.dart';

typedef OnProgressUpdate = Function(D2Progress? progress);

typedef ProgressCallback = void Function(String? message);

@riverpod
class SyncService extends _$SyncService {
  static const String LAST_SYNC_TIME = 'last_sync_time';
  static const String SYNC_INTERVAL = 'sync_interval';
  static const String SYNC_DONE = 'sync_done';

  @override
  FutureOr<void> build() async {
    // Initialize
  }

  Future<bool> needsSync() async {
    final prefs = await SharedPreferences.getInstance();
    final lastSyncTime = prefs.getInt(LAST_SYNC_TIME) ?? 0;
    final syncInterval = prefs.getInt(SYNC_INTERVAL) ??
        24 * 60 * 60 * 1000; // Default to 24 hours
    final syncDone = prefs.getBool(SYNC_DONE) ?? false;

    if (!syncDone) return true;

    final currentTime = DateTime.now().millisecondsSinceEpoch;
    return (currentTime - lastSyncTime) > syncInterval;
  }

  Future<void> performSync(
      {OnProgressUpdate? onProgressUpdate,
      ProgressCallback? onFinish,
      ProgressCallback? onFailure}) async {
    SyncMetadata syncMetadata = SyncMetadata();
    try {
      await syncMetadata.download(
        callback: onProgressUpdate,
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(LAST_SYNC_TIME, DateTime.now().millisecondsSinceEpoch);
      await prefs.setBool(SYNC_DONE, true);

      onFinish?.call('All Synced');
    } catch (error) {
      onFailure?.call(error.toString().substring(0, 255));

      logDebug(info: 'Sync complete with error: $error');
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(LAST_SYNC_TIME, DateTime.now().millisecondsSinceEpoch);
      await prefs.setBool(SYNC_DONE, false);
      return;
    }
  }
}
