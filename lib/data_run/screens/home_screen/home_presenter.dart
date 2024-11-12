// import 'package:flutter/foundation.dart';
// import 'package:datarun/commons/logging/logging.dart';
// import 'package:datarun/commons/prefs/preference.dart';
// import 'package:datarun/commons/prefs/preference_provider.dart';
// import 'package:datarun/data_run/screens/home_screen/home_repository.dart';
// import 'package:datarun/data_run/screens/home_screen/home_repository_impl.dart';
// import 'package:datarun/data_run/screens/home_screen/home_screen_view.dart';
// import 'package:datarun/main/data/service/sync_status_controller.dart';
// import 'package:datarun/main/data/service/work_manager/work_manager_controller.dart';
// import 'package:datarun/main/data/service/work_manager/work_manager_controller_impl.dart';
// import 'package:datarun/main/data/service/work_manager/worker_item.dart';
// import 'package:datarun/main/data/service/work_manager/worker_type.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'home_presenter.g.dart';
//
// @Riverpod(keepAlive: true)
// HomePresenter homePresenter(HomePresenterRef ref, HomeScreenView view) {
//   return HomePresenter(
//       view,
//       ref.read(homeRepositoryProvider),
//       ref.read(preferencesInstanceProvider),
//       ref.read(workManagerControllerProvider),
//       ref.read(syncStatusControllerInstanceProvider),
//      /* ref.read(syncIsPerformedInteractorProvider)*/);
// }
//
// class HomePresenter {
//   HomePresenter(
//       this.view,
//       this.repository,
//       this.preferencesProvider,
//       this.workManagerController,
//       this.syncStatusController/*,
//       this.syncIsPerformedInteractor*/);
//
//   final HomeScreenView view;
//   final HomeRepository repository;
//   final PreferenceProvider preferencesProvider;
//   final WorkManagerController workManagerController;
//
//   Future<void> launchInitialDataSync() async {
//     await workManagerController.syncDataForWorker(/*DATA_NOW, INITIAL_SYNC*/);
//   }
// }
