import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../commons/resources/resource_manager.dart';
import '../../../../usescases/events_without_registration/event_initial/di/event_initial_module.dart';
import '../../sync_data_worker.dart';
import '../../sync_metadata_worker.dart';
import '../../sync_presenter_impl.dart';
import 'work_info.dart';

part 'worker.g.dart';

@riverpod
SyncMetadataWorker syncMetadataWorker(SyncMetadataWorkerRef ref) {
  return SyncMetadataWorker(ref,
      presenter: ref.read(syncPresenterProvider),
      prefs: ref.read(preferencesInstanceProvider),
      resourceManager: ref.read(resourceManagerProvider));
}

@riverpod
SyncDataWorker syncDataWorker(SyncDataWorkerRef ref) {
  return SyncDataWorker(ref,
      presenter: ref.read(syncPresenterProvider),
      prefs: ref.read(preferencesInstanceProvider),
      resourceManager: ref.read(resourceManagerProvider));
}

abstract class Worker {
  Worker();

  Future<WorkInfo> doWork(
      {OnProgressUpdate? onProgressUpdate, Dio? dioTestClient});

// void stop() {
//   onStopped();
// }
//
// void onStopped() {
//   // Do nothing by default.
// }
}
