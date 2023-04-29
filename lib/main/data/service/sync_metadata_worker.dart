import 'dart:async';

import 'package:d2_remote/core/maintenance/d2_error.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/constants.dart';
import '../../../commons/date/date_utils.dart';
import '../../../commons/network/network_utils.dart';
import '../../../main.dart';
import '../../usescases/bundle/bundle.dart';
import 'sync_presenter.dart';

import '../../../commons/helpers/result.dart';
import '../../../commons/prefs/preference_provider.dart';
import '../../../commons/resources/resource_manager.dart';
import 'work_manager/nmc_worker/worker.dart';

typedef OnProgressUpdate = Function(int progress);

class SyncMetadataWorker extends Worker {
  SyncMetadataWorker(
      {required this.presenter,
      required this.prefs,
      required this.resourceManager});
  final SyncPresenter presenter;

  final PreferenceProvider prefs;

  final ResourceManager resourceManager;

  @override
  FutureOr<Result> call(
      {OnProgressUpdate? onProgressUpdate, Dio? dioTestClient}) async {
    if (await D2Remote.isAuthenticated()) {
      _triggerNotification(resourceManager.getString('R_app_name'),
          resourceManager.getString('R_syncing_configuration'), 0);

      bool isMetaOk = true;
      bool noNetwork = false;
      StringBuffer message = StringBuffer();

      final int init = DateTime.now().microsecond;
      try {
        presenter.syncMetadata(
          onProgressUpdate: (progress) {
            _triggerNotification(resourceManager.getString('R_app_name'),
                resourceManager.getString('R_syncing_configuration'), progress);
          },
        );
      } catch (e) {
        print('Timber.e($e)');
        isMetaOk = false;
        if (!NetworkUtils(navigatorKey.currentContext!).isOnline()) {
          noNetwork = true;
        }
        if (e is D2Error) {
          D2Error error = e;
          message.write(_composeErrorMessageInfo(error));
          // } else if (e.getCause() is D2Error) {
          //     D2Error error = (D2Error) e.getCause();
          //     message.write(_composeErrorMessageInfo(error));
        } else {
          message.write(e.toString().split('\n\t')[0]);
        }
      } finally {
        presenter.logTimeToFinish(
            DateTime.now().microsecond - init, METADATA_TIME);
      }

      final String lastDataSyncDate =
          DateUtils.dateTimeFormat().format(DateTime.now());

      prefs.setValue(LAST_META_SYNC, lastDataSyncDate);
      prefs.setValue(LAST_META_SYNC_STATUS, isMetaOk);
      prefs.setValue(LAST_META_SYNC_NO_NETWORK, noNetwork);

      _cancelNotification();

      if (!isMetaOk)
        return Result.failure(
            Exception(_createOutputData(false, message.toString())));

      presenter.startPeriodicMetaWork();

      return Result.success(_createOutputData(true, message.toString()));
    } else {
      return Result.failure(Exception(_createOutputData(
          false, resourceManager.getString('R_error_init_session'))));
    }
  }

  String _errorStackTrace(Exception? exception) {
    if (exception == null) {
      return '';
    }
    // WriteBuffer writer = new WriteBuffer();
    // exception.printStackTrace(new PrintWriter(writer));
    // return writer.toString();
    return '';
  }

  StringBuffer _composeErrorMessageInfo(D2Error error) {
    StringBuffer builder = StringBuffer('Cause: ');
    builder
      ..write(resourceManager.parseD2Error(error))
      ..write('\n\n')
      ..write('Exception: ')
      ..write(_errorStackTrace((error).originalException).split('\n\t')[0])
      ..write('\n\n');

    if (error.created != null) {
      builder
        ..write('Created: ')
        ..write(error.created.toString())
        ..write('\n\n');
    }

    if (error.httpErrorCode != null) {
      builder
        ..write('Http Error Code: ')
        ..write(error.httpErrorCode)
        ..write('\n\n');
    }

    if (error.errorComponent != null) {
      builder
        ..write('Error component: ')
        ..write(error.errorComponent)
        ..write('\n\n');
    }

    if (error.url != null) {
      builder
        ..write('Url: ')
        ..write(error.url)
        ..write('\n\n');
    }

    builder
      ..write('StackTrace: ')
      ..write(_errorStackTrace(error).split('\n\t')[0])
      ..write('\n\n');

    return builder;
  }

  Bundle _createOutputData(bool state, String message) {
    return Bundle()
      ..putBool('DATA_STATE', state)
      ..putString(METADATA_MESSAGE, message);
  }

  void _triggerNotification(String title, String content, int progress) {
    //     NotificationManager notificationManager = (NotificationManager) getApplicationContext().getSystemService(Context.NOTIFICATION_SERVICE);
    //     if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
    //         NotificationChannel mChannel = new NotificationChannel(METADATA_CHANNEL, "MetadataSync", NotificationManager.IMPORTANCE_HIGH);
    //         notificationManager.createNotificationChannel(mChannel);
    //     }
    //     NotificationCompat.Builder notificationBuilder =
    //             new NotificationCompat.Builder(getApplicationContext(), METADATA_CHANNEL)
    //                     .setSmallIcon(R_drawable.ic_sync)
    //                     .setContentTitle(title)
    //                     .setContentText(content)
    //                     .setOngoing(true)
    //                     .setOnlyAlertOnce(true)
    //                     .setAutoCancel(false)
    //                     .setProgress(100, progress, false)
    //                     .setPriority(NotificationCompat.PRIORITY_DEFAULT);

    //     setForegroundAsync(new ForegroundInfo(SyncMetadataWorker.SYNC_METADATA_ID, notificationBuilder.build()));
    // }
  }

  void _cancelNotification() {
    // NotificationManagerCompat notificationManager =
    //         NotificationManagerCompat.from(getApplicationContext());
    // notificationManager.cancel(SYNC_METADATA_ID);
  }
}
