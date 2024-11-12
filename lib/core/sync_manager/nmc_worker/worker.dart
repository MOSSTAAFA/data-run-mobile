// import 'package:datarun/data_run/usecases/sync_manager/nmc_worker/work_info.dart';
// import 'package:dio/dio.dart';
// import 'package:datarun/commons/prefs/preference_provider.dart';
// import 'package:datarun/commons/resources/resource_manager.dart' show resourceManagerProvider;
// import 'package:datarun/main/data/service/sync_data_worker.dart';
// import 'package:datarun/main/data/service/sync_metadata_worker.dart';
// import 'package:datarun/main/data/service/sync_presenter_impl.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'worker.g.dart';
//
// @riverpod
// SyncMetadataWorker syncMetadataWorker(SyncMetadataWorkerRef ref) {
//   return SyncMetadataWorker(ref,
//       presenter: ref.read(syncPresenterProvider),
//       prefs: ref.read(preferencesInstanceProvider),
//       resourceManager: ref.read(resourceManagerProvider));
// }
//
// @riverpod
// SyncDataWorker syncDataWorker(SyncDataWorkerRef ref) {
//   return SyncDataWorker(ref,
//       presenter: ref.read(syncPresenterProvider),
//       prefs: ref.read(preferencesInstanceProvider),
//       resourceManager: ref.read(resourceManagerProvider));
// }
//
// abstract class Worker {
//   Worker();
//
//   Future<WorkInfo> doWork(
//       {OnProgressUpdate? onProgressUpdate, Dio? dioTestClient});
// }
