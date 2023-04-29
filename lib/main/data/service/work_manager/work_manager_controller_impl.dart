import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'nmc_worker/worker.dart';
import 'work_manager_controller.dart';
import 'worker_item.dart';
part 'work_manager_controller_impl.g.dart';

@riverpod
WorkManagerController workManagerController(WorkManagerControllerRef ref) {
  return WorkManagerControllerImpl(ref);
}

class WorkManagerControllerImpl implements WorkManagerController {
  WorkManagerControllerImpl(this.ref);

  final WorkManagerControllerRef ref;

  @override
  Future<void> syncDataForWorkerItem(WorkerItem workerItem) async {}
  @override
  Future<void> syncDataForWorkers(
      String metadataWorkerTag, String dataWorkerTag, String workName) async {}
  @override
  Future<void> syncMetaDataForWorker(
      String metadataWorkerTag, String workName) async {
    final Worker worker = ref.read(syncMetadataWorkerProvider);
    // TODO(NMC): Implement android_alarm_manager_plus
    // https://stackoverflow.com/questions/51706265/how-to-schedule-background-tasks-in-flutter#:~:text=14-,SOLUTION,-1%3A%20android_alarm_manager_plus
    await worker();
    // WorkManager()
    //     workerOneBuilder
    //         .addTag(metadataWorkerTag)
    //         .setConstraints(
    //             Constraints.Builder().setRequiredNetworkType(NetworkType.CONNECTED).build()
    //         )

    //     workManager
    //         .beginUniqueWork(workName, ExistingWorkPolicy.KEEP, workerOneBuilder.build())
    //         .enqueue()
  }

  @override
  Future<void> syncDataForWorker(
      String metadataWorkerTag, String workName) async {
    final Worker worker = ref.read(syncDataWorkerProvider);
    // TODO(NMC): Implement android_alarm_manager_plus
    // https://stackoverflow.com/questions/51706265/how-to-schedule-background-tasks-in-flutter#:~:text=14-,SOLUTION,-1%3A%20android_alarm_manager_plus
    await worker();
  }

  @override
  void beginUniqueWork(WorkerItem workerItem) {}
  @override
  void enqueuePeriodicWork(WorkerItem workerItem) {}

  // LiveData<List<WorkInfo>> getWorkInfosForUniqueWorkLiveData(String workerName){}
  // LiveData<List<WorkInfo>> getWorkInfosByTagLiveData(String tag){}
  // LiveData<List<WorkInfo>> getWorkInfosForTags(vararg tags){}

  @override
  Future<void> cancelAllWork() async {}
  @override
  Future<void> cancelAllWorkByTag(String tag) async {}
  @override
  Future<void> cancelUniqueWork(String workName) async {}
  @override
  Future<void> pruneWork() async {}
}
