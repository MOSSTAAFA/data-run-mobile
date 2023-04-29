import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'work_manager_controller.dart';
import 'worker_item.dart';
part 'work_manager_controller_impl.g.dart';

@riverpod
WorkManagerController workManagerController(WorkManagerControllerRef ref) {
  return WorkManagerControllerImpl();
}

class WorkManagerControllerImpl implements WorkManagerController {
  @override
  void syncDataForWorkerItem(WorkerItem workerItem) {}
  @override
  void syncDataForWorkers(
      String metadataWorkerTag, String dataWorkerTag, String workName) {}
  @override
  void syncMetaDataForWorker(String metadataWorkerTag, String workName) {}
  @override
  void syncDataForWorker(String metadataWorkerTag, String workName) {}
  @override
  void beginUniqueWork(WorkerItem workerItem) {}
  @override
  void enqueuePeriodicWork(WorkerItem workerItem) {}

  // LiveData<List<WorkInfo>> getWorkInfosForUniqueWorkLiveData(String workerName){}
  // LiveData<List<WorkInfo>> getWorkInfosByTagLiveData(String tag){}
  // LiveData<List<WorkInfo>> getWorkInfosForTags(vararg tags){}

  @override
  void cancelAllWork() {}
  @override
  void cancelAllWorkByTag(String tag) {}
  @override
  void cancelUniqueWork(String workName) {}
  @override
  void pruneWork() {}
}
