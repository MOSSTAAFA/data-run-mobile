import 'package:d2_remote/core/mp/helpers/result.dart';
import 'package:dio/dio.dart';

import '../../../core/arch/call/d2_progress.dart';
import 'sync_metadata_worker.dart';
import 'sync_result.dart';

abstract class SyncPresenter {
  Future<void> syncAndDownloadEvents({Dio? dioTestClient}); // throws Exception;

  Future<void> syncAndDownloadTeis({Dio? dioTestClient}); // throws Exception;

  Future<void> syncMetadata(
      {OnProgressUpdate? onProgressUpdate,
      Dio? dioTestClient}); // throws Exception;

  Future<void> syncAndDownloadDataValues(
      {Dio? dioTestClient}); // throws Exception;

  Future<void> syncReservedValues({Dio? dioTestClient});

  Future<SyncResult> checkSyncStatus();

  /// TrackerD2Progress
  Future<D2Progress> syncGranularEvent(String eventUid, {Dio? dioTestClient});

  /// ListenableWorker.Result
  Future<Result<String, dynamic>> syncGranularProgram(String programUid,
      {Dio? dioTestClient});

  Future<Result<String, dynamic>> syncGranularActivity(String activityUid,
      {Dio? dioTestClient});

  /// ListenableWorker.Result
  Future<Result<String, dynamic>> syncGranularTei(
      String? teiUid, String? activityUid, String? orgUnit,
      {Dio? dioTestClient});

  // /// ListenableWorker.Result
  // Future<Result<String>> blockSyncGranularEvent(String eventUid,
  //     {Dio? dioTestClient});

  /// ListenableWorker.Result
  Future<Result<String, dynamic>> syncGranularDataSet(String dataSetUid,
      {Dio? dioTestClient});

  // /// Observable
  // Future<D2Progress> syncGranularProgram(String uid, {Dio? dioTestClient});

  // /// Observable
  // /// TrackerD2Progress
  // Future<D2Progress> syncGranularTEI(String uid, {Dio? dioTestClient});

  // /// Observable
  // Future<D2Progress> syncGranularDataSet(String uid, {Dio? dioTestClient});

  /// Observable
  Future<Result<String, dynamic>> syncGranularDataValues(
      String? activityUid, String? orgUnit, String? period,
      {Dio? dioTestClient});

  /// Observable
  Future<D2Progress> syncGranularDataSetDataComplete(
      String dataSetUid,
      String activityUid,
      String orgUnit,
      String attributeOptionCombo,
      String period,
      {Dio? dioTestClient});

  /// Observable
  Future<D2Progress> syncGranularDataSetComplete(String dataSetUid,
      {Dio? dioTestClient});

  Future<SyncResult> checkSyncEventStatus(String uid);

  Future<SyncResult> checkSyncTEIStatus(String uid);

  Future<bool> checkSyncDataValueStatus(
      String orgUnit, String attributeOptionCombo, String period);

  Future<bool> checkSyncProgramStatus(String uid);

  Future<bool> checkSyncDataSetStatus(String uid);

  // List<TrackerImportConflict> messageTrackerImportConflict(String uid);

  void startPeriodicDataWork();

  void startPeriodicMetaWork();

  Future<void> downloadResources({Dio? dioTestClient});

  /// ListenableWorker.Result
  Future<Result<String, dynamic>> syncGranularDataSetValues(String dataSetUid,
      String activityUid, String orgUnitUid, String? periodId,
      {Dio? dioTestClient});

  void logTimeToFinish(int millisToFinish, String eventName);

  void updateProyectAnalytics();

  Future<void> initSyncControllerMap();

  void finishSync();

  void setNetworkUnavailable();
}
