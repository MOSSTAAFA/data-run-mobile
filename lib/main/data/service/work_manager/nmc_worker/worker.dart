import 'package:dio/dio.dart';
import 'package:mass_pro/main/data/service/work_manager/nmc_worker/work_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:d2_remote/core/mp/helpers/result.dart';
import '../../../../../commons/helpers/collections.dart';
import '../../../../../commons/resources/resource_manager.dart';
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

  FutureOr<WorkInfo> call(
      {OnProgressUpdate? onProgressUpdate, Dio? dioTestClient});
}
