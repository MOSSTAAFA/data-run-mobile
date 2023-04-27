// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import '../../../core/arch/call/d2_progress.dart';
// part 'progress_status_controller.g.dart';

// /// fun observeDownloadProcess(): LiveData<SyncStatusData> = downloadStatus
// @riverpod
// class D2ProgressNotifier extends _$D2ProgressNotifier {
//   @override
//   D2Progress build() {
//     return D2Progress();
//   }

//   void initValue() {
//     state = D2Progress();
//   }

//   void postValue(D2Progress value) {
//     state = value;
//   }
// }

// @riverpod
// SyncStatusController syncStatusController(SyncStatusControllerRef ref) {
//   return SyncStatusController(ref);
// }

// class SyncStatusController {
//   SyncStatusController(this.ref)
//       : progressStatusMap = IMap<String, D2ProgressStatus>();

//   final SyncStatusControllerRef ref;

//   IMap<String, D2ProgressStatus> progressStatusMap;

//   void initDownloadProcess(Map<String, D2ProgressStatus> programDownload) {
//     // Timber.tag("SYNC").d("INIT DATA SYNC")
//     // progressStatusMap = programDownload.lock;
//     ref.read(syncStatusDataNotifierProvider.notifier).setValue(SyncStatusData(
//         running: true,
//         downloadingMedia: false,
//         programSyncStatusMap: programDownload.lock));
//   }

//   void updateDownloadProcess(Map<String, D2ProgressStatus> programDownload) {
//     // Timber.tag("SYNC").d("Updating PROGRAM")
//     progressStatusMap = progressStatusMap.addAll(programDownload.lock);
//     ref.read(syncStatusDataNotifierProvider.notifier).setValue(SyncStatusData(
//         running: true,
//         downloadingMedia: false,
//         programSyncStatusMap: progressStatusMap));
//   }

//   void finishSync() {
//     // Timber.tag("SYNC").d("FINISH DATA SYNC")
//     ref.read(syncStatusDataNotifierProvider.notifier).setValue(SyncStatusData(
//         running: false,
//         downloadingMedia: false,
//         programSyncStatusMap: progressStatusMap));
//   }

//   void onNetworkUnavailable() {
//     progressStatusMap = IMap.fromEntries(progressStatusMap.entries.map((entry) {
//       if (entry.value.isComplete) {
//         return MapEntry(entry.key, entry.value);
//       } else {
//         return MapEntry(
//             entry.key,
//             entry.value.copyWith(
//                 isComplete: true, syncStatus: D2ProgressSyncStatus.ERROR));
//       }
//     }));

//     ref.read(syncStatusDataNotifierProvider.notifier).setValue(SyncStatusData(
//         running: true,
//         downloadingMedia: false,
//         programSyncStatusMap: progressStatusMap));
//   }

//   void finishDownloadingEvents(List<String> eventProgramUids) {
//     // Timber.tag("SYNC").d("FINISHED EVENTS")
//     progressStatusMap = IMap.fromEntries(progressStatusMap.entries.map((entry) {
//       if (!eventProgramUids.contains(entry.key) || entry.value.isComplete) {
//         return MapEntry(entry.key, entry.value);
//       } else {
//         return MapEntry(
//             entry.key,
//             entry.value.copyWith(
//                 isComplete: true, syncStatus: D2ProgressSyncStatus.ERROR));
//       }
//     }));

//     ref.read(syncStatusDataNotifierProvider.notifier).setValue(SyncStatusData(
//         running: true,
//         downloadingMedia: false,
//         programSyncStatusMap: progressStatusMap));
//   }

//   void finishDownloadingTracker(List<String> trackerProgramUids) {
//     // Timber.tag("SYNC").d("FINISHED TRACKER")
//     progressStatusMap = IMap.fromEntries(progressStatusMap.entries.map((entry) {
//       if (!trackerProgramUids.contains(entry.key) || entry.value.isComplete) {
//         return MapEntry(entry.key, entry.value);
//       } else {
//         return MapEntry(
//             entry.key,
//             entry.value.copyWith(
//                 isComplete: true, syncStatus: D2ProgressSyncStatus.ERROR));
//       }
//     }));

//     ref.read(syncStatusDataNotifierProvider.notifier).setValue(SyncStatusData(
//         running: true,
//         downloadingMedia: false,
//         programSyncStatusMap: progressStatusMap));
//   }

//   void updateSingleProgramToSuccess(String programUid) {
//     progressStatusMap = IMap.fromEntries(progressStatusMap.entries.map((entry) {
//       if (programUid != entry.key) {
//         return MapEntry(entry.key, entry.value);
//       } else {
//         return MapEntry(
//             entry.key,
//             entry.value.copyWith(
//                 isComplete: true, syncStatus: D2ProgressSyncStatus.ERROR));
//       }
//     }));

//     ref.read(syncStatusDataNotifierProvider.notifier).setValue(SyncStatusData(
//         running: false,
//         downloadingMedia: false,
//         programSyncStatusMap: progressStatusMap));
//   }

//   void initDownloadMedia() {
//     // Timber.tag("SYNC").d("INIT FILES")
//     ref.read(syncStatusDataNotifierProvider.notifier).setValue(SyncStatusData(
//         running: true,
//         downloadingMedia: true,
//         programSyncStatusMap: progressStatusMap));
//   }
// }
