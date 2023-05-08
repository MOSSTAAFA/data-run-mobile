import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/prefs/preference_provider.dart';
import '../../data/server/user_manager.dart';
import '../../data/server/user_manager_impl.dart';
import '../sync/sync_screen_presenter.dart';

part 'sync_is_performed_interactor.g.dart';

@riverpod
SyncIsPerformedInteractor syncIsPerformedInteractor(
    SyncIsPerformedInteractorRef ref) {
  return SyncIsPerformedInteractor(ref.read(userManagerProvider));
}

class SyncIsPerformedInteractor {
  const SyncIsPerformedInteractor(this.userManager);

  final UserManager? userManager;

  Future<bool> call() async {
    final prefs = await PreferenceProvider.sharedPreferences();
    // const val WAS_INITIAL_SYNC_DONE = "WasInitialSyncDone"
    return prefs.getBool(WAS_INITIAL_SYNC_DONE) ?? false;
  }
}
