import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/arch/call/d2_progress_status.dart';
import '../../../main.dart';
import 'sync_status_data.dart';

part 'sync_status_controller.g.dart';

/// fun observeDownloadProcess(): LiveData<SyncStatusData> = downloadStatus
// @riverpod
// class SyncStatusDataNotifier extends _$SyncStatusDataNotifier {
//   @override
//   SyncStatusData build() {
//     return SyncStatusData();
//   }

//   void setValue(SyncStatusData value) {
//     state = value;
//   }
// }

@Riverpod(keepAlive: true)
class SyncStatusControllerInstance extends _$SyncStatusControllerInstance {
  @override
  SyncStatusController build() {
    return SyncStatusController();
  }

  void initDownloadProcess(IMap<String, D2ProgressStatus> programDownload) {
    // Timber.tag("SYNC").d("INIT DATA SYNC")
    // progressStatusMap = programDownload.lock;
    state = state.copyWith(
        progressStatusMap: programDownload,
        syncStatusData: SyncStatusData(
            running: true,
            downloadingMedia: false,
            programSyncStatusMap: programDownload));
  }

  void updateDownloadProcess(IMap<String, D2ProgressStatus> programDownload) {
    // Timber.tag("SYNC").d("Updating PROGRAM")
    final progressStatusMap = state.progressStatusMap.addAll(programDownload);
    state = state.copyWith(
        progressStatusMap: progressStatusMap,
        syncStatusData: SyncStatusData(
            running: true,
            downloadingMedia: false,
            programSyncStatusMap: progressStatusMap));
  }

  void finishSync() {
    // Timber.tag("SYNC").d("FINISH DATA SYNC")
    state = state.copyWith(
        syncStatusData: state.syncStatusData
            .copyWith(running: false, downloadingMedia: false));
  }

  void onNetworkUnavailable() {
    final progressStatusMap =
        IMap.fromEntries(state.progressStatusMap.entries.map((entry) {
      if (entry.value.isComplete) {
        return MapEntry(entry.key, entry.value);
      } else {
        return MapEntry(
            entry.key,
            entry.value.copyWith(
                message: navigatorKey.localization
                    .lookup('networkUnavailable'),
                isComplete: true,
                syncStatus: D2ProgressSyncStatus.ERROR));
      }
    }));
    state = state.copyWith(
        progressStatusMap: progressStatusMap,
        syncStatusData: SyncStatusData(
            running: true,
            downloadingMedia: false,
            programSyncStatusMap: progressStatusMap));
  }

  void finishDownloadingEvents(List<String> eventProgramUids) {
    // Timber.tag("SYNC").d("FINISHED EVENTS")
    final progressStatusMap =
        IMap.fromEntries(state.progressStatusMap.entries.map((entry) {
      if (!eventProgramUids.contains(entry.key) || entry.value.isComplete) {
        return MapEntry(entry.key, entry.value);
      } else {
        return MapEntry(
            entry.key,
            entry.value.copyWith(
                isComplete: true, syncStatus: D2ProgressSyncStatus.ERROR));
      }
    }));
    state = state.copyWith(
        progressStatusMap: progressStatusMap,
        syncStatusData: SyncStatusData(
            running: true,
            downloadingMedia: false,
            programSyncStatusMap: progressStatusMap));
  }

  void finishDownloadingTracker(List<String> trackerProgramUids) {
    // Timber.tag("SYNC").d("FINISHED TRACKER")
    final progressStatusMap =
        IMap.fromEntries(state.progressStatusMap.entries.map((entry) {
      if (!trackerProgramUids.contains(entry.key) || entry.value.isComplete) {
        return MapEntry(entry.key, entry.value);
      } else {
        return MapEntry(
            entry.key,
            entry.value.copyWith(
                isComplete: true, syncStatus: D2ProgressSyncStatus.ERROR));
      }
    }));

    state = state.copyWith(
        progressStatusMap: progressStatusMap,
        syncStatusData: SyncStatusData(
            running: true,
            downloadingMedia: false,
            programSyncStatusMap: progressStatusMap));
  }

  void updateSingleProgramToSuccess(String programUid) {
    final progressStatusMap =
        IMap.fromEntries(state.progressStatusMap.entries.map((entry) {
      if (programUid != entry.key) {
        return entry;
      } else {
        return MapEntry(
            entry.key,
            entry.value.copyWith(
                isComplete: true, syncStatus: D2ProgressSyncStatus.SUCCESS));
      }
    }));

    state = state.copyWith(
        progressStatusMap: progressStatusMap,
        syncStatusData: SyncStatusData(
            running: false,
            downloadingMedia: false,
            programSyncStatusMap: progressStatusMap));
  }

  void initDownloadMedia() {
    // Timber.tag("SYNC").d("INIT FILES")
    state = state.copyWith(
        syncStatusData: state.syncStatusData
            .copyWith(running: true, downloadingMedia: true));
  }
}

class SyncStatusController with EquatableMixin {
  SyncStatusController(
      {IMap<String, D2ProgressStatus>? progressStatusMap,
      SyncStatusData? syncStatusData})
      : progressStatusMap = IMap<String, D2ProgressStatus>(),
        syncStatusData = syncStatusData ??
            SyncStatusData(
                running: false,
                downloadingMedia: false,
                programSyncStatusMap:
                    IMap.orNull(progressStatusMap?.unlock) ?? IMap());

  // final SyncStatusControllerRef ref;

  final IMap<String, D2ProgressStatus> progressStatusMap;

  final SyncStatusData syncStatusData;

  SyncStatusController copyWith(
      {IMap<String, D2ProgressStatus>? progressStatusMap,
      SyncStatusData? syncStatusData}) {
    return SyncStatusController(
        progressStatusMap:
            IMap.orNull(progressStatusMap?.unlock) ?? this.progressStatusMap,
        syncStatusData: syncStatusData ?? this.syncStatusData);
  }

  @override
  List<Object?> get props => [syncStatusData];

  //  SyncStatusController initDownloadProcess(
  //     IMap<String, D2ProgressStatus> programDownload) {
  //   // Timber.tag("SYNC").d("INIT DATA SYNC")
  //   // progressStatusMap = programDownload.lock;
  //   return copyWith(
  //       progressStatusMap: programDownload,
  //       syncStatusData: SyncStatusData(
  //           running: true,
  //           downloadingMedia: false,
  //           programSyncStatusMap: programDownload));
  // }

  // SyncStatusController updateDownloadProcess(
  //     IMap<String, D2ProgressStatus> programDownload) {
  //   // Timber.tag("SYNC").d("Updating PROGRAM")
  //   final progressStatusMap = this.progressStatusMap.addAll(programDownload);
  //   return copyWith(
  //       progressStatusMap: progressStatusMap,
  //       syncStatusData: SyncStatusData(
  //           running: true,
  //           downloadingMedia: false,
  //           programSyncStatusMap: progressStatusMap));
  // }

  // SyncStatusController finishSync() {
  //   // Timber.tag("SYNC").d("FINISH DATA SYNC")
  //   return copyWith(
  //       progressStatusMap: progressStatusMap,
  //       syncStatusData: SyncStatusData(
  //           running: false,
  //           downloadingMedia: false,
  //           programSyncStatusMap: progressStatusMap));
  // }

  // SyncStatusController onNetworkUnavailable() {
  //   final progressStatusMap =
  //       IMap.fromEntries(this.progressStatusMap.entries.map((entry) {
  //     if (entry.value.isComplete) {
  //       return MapEntry(entry.key, entry.value);
  //     } else {
  //       return MapEntry(
  //           entry.key,
  //           entry.value.copyWith(
  //               message: AppLocalization.of(navigatorKey.currentContext!)!
  //                   .lookup('networkUnavailable'),
  //               isComplete: true,
  //               syncStatus: D2ProgressSyncStatus.ERROR));
  //     }
  //   }));
  //   return copyWith(
  //       progressStatusMap: progressStatusMap,
  //       syncStatusData: SyncStatusData(
  //           running: true,
  //           downloadingMedia: false,
  //           programSyncStatusMap: progressStatusMap));
  // }

  // SyncStatusController finishDownloadingEvents(List<String> eventProgramUids) {
  //   // Timber.tag("SYNC").d("FINISHED EVENTS")
  //   final progressStatusMap =
  //       IMap.fromEntries(this.progressStatusMap.entries.map((entry) {
  //     if (!eventProgramUids.contains(entry.key) || entry.value.isComplete) {
  //       return MapEntry(entry.key, entry.value);
  //     } else {
  //       return MapEntry(
  //           entry.key,
  //           entry.value.copyWith(
  //               isComplete: true, syncStatus: D2ProgressSyncStatus.ERROR));
  //     }
  //   }));
  //   return copyWith(
  //       progressStatusMap: progressStatusMap,
  //       syncStatusData: SyncStatusData(
  //           running: true,
  //           downloadingMedia: false,
  //           programSyncStatusMap: progressStatusMap));
  // }

  // SyncStatusController finishDownloadingTracker(
  //     List<String> trackerProgramUids) {
  //   // Timber.tag("SYNC").d("FINISHED TRACKER")
  //   final progressStatusMap =
  //       IMap.fromEntries(this.progressStatusMap.entries.map((entry) {
  //     if (!trackerProgramUids.contains(entry.key) || entry.value.isComplete) {
  //       return MapEntry(entry.key, entry.value);
  //     } else {
  //       return MapEntry(
  //           entry.key,
  //           entry.value.copyWith(
  //               isComplete: true, syncStatus: D2ProgressSyncStatus.ERROR));
  //     }
  //   }));

  //   return copyWith(
  //       progressStatusMap: progressStatusMap,
  //       syncStatusData: SyncStatusData(
  //           running: true,
  //           downloadingMedia: false,
  //           programSyncStatusMap: progressStatusMap));
  // }

  // SyncStatusController updateSingleProgramToSuccess(String programUid) {
  //   final progressStatusMap =
  //       IMap.fromEntries(this.progressStatusMap.entries.map((entry) {
  //     if (programUid != entry.key) {
  //       return entry;
  //     } else {
  //       return MapEntry(
  //           entry.key,
  //           entry.value.copyWith(
  //               isComplete: true, syncStatus: D2ProgressSyncStatus.SUCCESS));
  //     }
  //   }));

  //   return copyWith(
  //       progressStatusMap: progressStatusMap,
  //       syncStatusData: SyncStatusData(
  //           running: false,
  //           downloadingMedia: false,
  //           programSyncStatusMap: progressStatusMap));
  // }

  // SyncStatusController initDownloadMedia() {
  //   // Timber.tag("SYNC").d("INIT FILES")
  //   return copyWith(
  //       progressStatusMap: progressStatusMap,
  //       syncStatusData: SyncStatusData(
  //           running: true,
  //           downloadingMedia: true,
  //           programSyncStatusMap: progressStatusMap));
  // }
}
