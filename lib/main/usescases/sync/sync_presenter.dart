import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/prefs/preference.dart';
import '../../../commons/prefs/preference_provider.dart';
import '../../data/service/work_manager/work_manager_controller.dart';
import '../../data/service/work_manager/work_manager_controller_impl.dart';
import '../events_without_registration/event_initial/di/event_initial_module.dart';
import 'sync_view.dart';
part 'sync_presenter.g.dart';

@riverpod
SyncPresenter syncScreenPresenter(SyncScreenPresenterRef ref, SyncView view) {
  return SyncPresenter(view, ref.read(preferencesInstanceProvider),
      ref.read(workManagerControllerProvider));
}

class SyncPresenter {
  SyncPresenter(this.view, this.preferences, this.workManagerController) {
    workManagerController.syncMetaDataForWorker(META_NOW, INITIAL_SYNC);
  }

  final SyncView view;
  // final UserManager? userManager;
  final WorkManagerController workManagerController;
  final PreferenceProvider preferences;
}
