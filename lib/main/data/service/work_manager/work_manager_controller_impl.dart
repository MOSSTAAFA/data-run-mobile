import 'package:d2_remote/modules/datarun_shared/sync/call/d2_progress.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:datarun/main/data/service/sync_data_worker.dart';
import 'package:datarun/main/data/service/sync_metadata_worker.dart';
import 'package:datarun/main/data/service/work_manager/nmc_worker/work_info.dart';
import 'package:datarun/main/data/service/work_manager/nmc_worker/worker.dart';
import 'package:datarun/main/data/service/work_manager/work_manager_controller.dart';
import 'package:datarun/main/data/service/work_manager/worker_item.dart';

part 'work_manager_controller_impl.g.dart';

@riverpod
WorkManagerController workManagerController(WorkManagerControllerRef ref) {
  return WorkManagerControllerImpl(ref);
}

/// WorkInfosForUniqueWorkLiveData
@riverpod
class SyncProgress extends _$SyncProgress {
  @override
  WorkInfo build() {
    return WorkInfo();
  }

  void update(WorkInfo Function(WorkInfo state) progress) {
    state = progress.call(state);
  }

  void updateWorkInfoState(WorkInfoState workInfoState) {
    state = state.copyWith(state: workInfoState);
  }

  void updateMessage(String message) {
    state = state.copyWith(message: message);
  }

  void updateProgress(int progress) {
    state = state.copyWith(progress: progress);
  }

  void updateFinalResult(WorkInfoState state, String message) {
    this.state = this.state.copyWith(state: state, message: message);
  }
}

class WorkManagerControllerImpl implements WorkManagerController {
  WorkManagerControllerImpl(this.ref);

  final WorkManagerControllerRef ref;

  // @override
  // Future<void> syncDataForWorkerItem(WorkerItem workerItem) async {}

  @override
  Future<void> syncDataForWorkers(
      String metadataWorkerTag, String dataWorkerTag, String workName) async {}

  @override
  Future<void> syncMetaDataForWorker(
      String metadataWorkerTag, String workName) async {
    final SyncMetadataWorker worker = ref.read(syncMetadataWorkerProvider);

    /// Set Running
    ref
        .read(syncProgressProvider.notifier)
        .updateWorkInfoState(WorkInfoState.RUNNING);

    /// update progress
    final finalResult = await worker.doWork(
      onProgressUpdate: (progress) {
        ref.read(syncProgressProvider.notifier).updateProgress(progress);
      },
    );

    /// update SyncProgress Final Result
    ref
        .read(syncProgressProvider.notifier)
        .updateFinalResult(finalResult.state, finalResult.message);
  }

  @override
  Future<void> syncDataForWorker(
     /* String metadataWorkerTag, String workName*/) async {
    final SyncDataWorker worker = ref.read(syncDataWorkerProvider);
    // TODO(NMC): Implement android_alarm_manager_plus
    // https://stackoverflow.com/questions/51706265/how-to-schedule-background-tasks-in-flutter#:~:text=14-,SOLUTION,-1%3A%20android_alarm_manager_plus
    await worker.doWork();
  }

  @override
  void beginUniqueWork(WorkerItem workerItem) {}

  @override
  void enqueuePeriodicWork(WorkerItem workerItem) {}

  @override
  Future<void> cancelAllWork() async {}

  @override
  Future<void> cancelAllWorkByTag(String tag) async {}

  @override
  Future<void> cancelUniqueWork(String workName) async {}

  @override
  Future<void> pruneWork() async {}
}
