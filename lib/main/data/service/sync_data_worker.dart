import 'dart:async';

import 'package:dio/dio.dart';

import '../../../commons/constants.dart';
import '../../../commons/date/date_utils.dart';
import '../../../commons/extensions/dynamic_extensions.dart';
import '../../../commons/network/network_utils.dart';
import '../../../commons/prefs/preference_provider.dart';
import '../../../commons/resources/resource_manager.dart';
import 'sync_metadata_worker.dart';
import 'sync_presenter.dart';
import 'sync_result.dart';
import 'work_manager/nmc_worker/work_info.dart';
import 'work_manager/nmc_worker/worker.dart';

class SyncDataWorker extends Worker {
  SyncDataWorker(this.ref,
      {required this.presenter,
      required this.prefs,
      required this.resourceManager});

  final SyncDataWorkerRef ref;
  final SyncPresenter presenter;

  final PreferenceProvider prefs;

  final ResourceManager resourceManager;

  @override
  Future<WorkInfo> doWork(
      {OnProgressUpdate? onProgressUpdate, Dio? dioTestClient}) async {
    await presenter.initSyncControllerMap();

    onProgressUpdate?.call(0);
    _triggerNotification(resourceManager.getString('R_app_name'),
        resourceManager.getString('R_syncing_data'), 0);

    bool isEventOk = true;
    bool isTeiOk = true;
    bool isDataValue = true;

    final int init = DateTime.now().millisecond;

    onProgressUpdate?.call(25);
    _triggerNotification(resourceManager.getString('R_app_name'),
        resourceManager.getString('R_syncing_events'), 25);
    try {
      await presenter.syncAndDownloadEvents(dioTestClient: dioTestClient);
    } catch (e) {
      if (!ref.read(networkUtilsProvider).isOnline()) {
        presenter.setNetworkUnavailable();
      }
      logError(info: 'Timber.e($e)');
      isEventOk = false;
    }

    try {
      await presenter.syncAndDownloadTeis();
    } catch (e) {
      if (!ref.read(networkUtilsProvider).isOnline()) {
        presenter.setNetworkUnavailable();
      }
      logError(info: 'Timber.e($e)');
      isTeiOk = false;
    }

    onProgressUpdate?.call(75);
    _triggerNotification(resourceManager.getString('R_app_name'),
        resourceManager.getString('R_syncing_data_sets'), 75);

    try {
      await presenter.syncAndDownloadDataValues();
    } catch (e) {
      if (!ref.read(networkUtilsProvider).isOnline()) {
        presenter.setNetworkUnavailable();
      }
      logError(info: 'Timber.e($e)');
      isDataValue = false;
    }

    onProgressUpdate?.call(90);
    _triggerNotification(resourceManager.getString('R_app_name'),
        resourceManager.getString('R_syncing_resources'), 90);

    try {
      await presenter.downloadResources();
    } catch (e) {
      logError(info: 'Timber.e($e)');
    }

    onProgressUpdate?.call(100);
    _triggerNotification(resourceManager.getString('R_app_name'),
        resourceManager.getString('R_syncing_done'), 100);

    presenter.logTimeToFinish(DateTime.now().millisecond - init, DATA_TIME);

    final String lastDataSyncDate =
        DateUtils.dateTimeFormat().format(DateTime.now());
    final SyncResult syncResult = await presenter.checkSyncStatus();

    prefs.setValue(LAST_DATA_SYNC, lastDataSyncDate);
    prefs.setValue(LAST_DATA_SYNC_STATUS,
        isEventOk && isTeiOk && isDataValue && syncResult == SyncResult.SYNC);
    prefs.setValue(SYNC_RESULT, syncResult.name);

    _cancelNotification();

    presenter.startPeriodicDataWork();

    presenter.finishSync();

    return WorkInfo(state: WorkInfoState.SUCCEEDED);
  }

  // Bundle _createOutputData(bool state) {
  //   return Bundle().putBool('DATA_STATE', state);
  // }

  void _cancelNotification() {
    // NotificationManagerCompat notificationManager =
    //         NotificationManagerCompat.from(getApplicationContext());
    // notificationManager.cancel(SYNC_DATA_ID);
  }

  void _triggerNotification(String title, String content, int progress) {
    // NotificationManager notificationManager = (NotificationManager) getApplicationContext().getSystemService(Context.NOTIFICATION_SERVICE);

    // if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
    //     NotificationChannel mChannel = new NotificationChannel(DATA_CHANNEL, "DataSync", NotificationManager.IMPORTANCE_HIGH);
    //     notificationManager.createNotificationChannel(mChannel);
    // }

    // NotificationCompat.Builder notificationBuilder =
    //         new NotificationCompat.Builder(getApplicationContext(), DATA_CHANNEL)
    //                 .setSmallIcon(R_drawable.ic_sync)
    //                 .setContentTitle(title)
    //                 .setContentText(content)
    //                 .setOngoing(true)
    //                 .setOnlyAlertOnce(true)
    //                 .setAutoCancel(false)
    //                 .setProgress(100, progress, false)
    //                 .setPriority(NotificationCompat.PRIORITY_DEFAULT);

    // setForegroundAsync(new ForegroundInfo(SyncDataWorker.SYNC_DATA_ID, notificationBuilder.build()));
  }
}
