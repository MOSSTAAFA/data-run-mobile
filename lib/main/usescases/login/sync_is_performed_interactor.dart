import '../../../commons/prefs/preference_provider.dart';
import '../../data/server/user_manager.dart';
import '../sync/sync_presenter.dart';

class SyncIsPerformedInteractor {
  const SyncIsPerformedInteractor(this.userManager);
  final UserManager? userManager;
  Future<bool> call() async {
    final prefs = await PreferenceProvider.sharedPreferences();
    // const val WAS_INITIAL_SYNC_DONE = "WasInitialSyncDone"
    return prefs.getBool(WAS_INITIAL_SYNC_DONE) ?? false;
  }
}
