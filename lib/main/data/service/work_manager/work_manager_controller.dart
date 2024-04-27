import 'worker_item.dart';

abstract class WorkManagerController {
  Future<void> syncDataForWorkerItem(WorkerItem workerItem);

  Future<void> syncDataForWorkers(
      String metadataWorkerTag, String dataWorkerTag, String workName);

  Future<void> syncMetaDataForWorker(String metadataWorkerTag, String workName);

  Future<void> syncDataForWorker(String metadataWorkerTag, String workName);

  void beginUniqueWork(WorkerItem workerItem);

  void enqueuePeriodicWork(WorkerItem workerItem);

  // LiveData<List<WorkInfo>> getWorkInfosForUniqueWorkLiveData(String workerName);
  // LiveData<List<WorkInfo>> getWorkInfosByTagLiveData(String tag);
  // LiveData<List<WorkInfo>> getWorkInfosForTags(vararg tags);

  Future<void> cancelAllWork();

  Future<void> cancelAllWorkByTag(String tag);

  Future<void> cancelUniqueWork(String workName);

  Future<void> pruneWork();
}

// @riverpod
// class WorkInfo extends _$WorkInfo {
//   @override
//   Bundle build() {
//     return Bundle();
//   }

//   void setValue(Bundle value) {
//     state = value;
//   }

//   void putString(String key, String? value) {
//     state = state.putString(key, value);
//   }

//   void putInt(String key, int? value) {
//     state = state.putInt(key, value);
//   }

//   String? getString(String key) {
//     return state.getString(key);
//   }

//   int? getInt(String key) {
//     return state.getInt(key);
//   }
// }
