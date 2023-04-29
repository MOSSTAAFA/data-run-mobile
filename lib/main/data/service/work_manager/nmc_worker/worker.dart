import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../commons/helpers/result.dart';
import '../../../../../form/di/injector.dart';
import '../../../../usescases/events_without_registration/event_initial/di/event_initial_module.dart';
import '../../sync_data_worker.dart';
import '../../sync_metadata_worker.dart';
import '../../sync_presenter_impl.dart';
part 'worker.g.dart';

@riverpod
Worker syncMetadataWorker(SyncMetadataWorkerRef ref) {
  return SyncMetadataWorker(ref,
      presenter: ref.read(syncPresenterProvider),
      prefs: ref.read(preferencesInstanceProvider),
      resourceManager: ref.read(resourceManagerProvider));
}

@riverpod
Worker syncDataWorker(SyncDataWorkerRef ref) {
  return SyncDataWorker(ref,
      presenter: ref.read(syncPresenterProvider),
      prefs: ref.read(preferencesInstanceProvider),
      resourceManager: ref.read(resourceManagerProvider));
}

abstract class Worker {
  Worker();

  FutureOr<Result> call(
      {OnProgressUpdate? onProgressUpdate, Dio? dioTestClient});
}
