import 'dart:async';

import 'package:dio/dio.dart';

import 'sync_presenter.dart';

import '../../../commons/helpers/result.dart';
import '../../../commons/prefs/preference_provider.dart';
import 'work_manager/worker.dart';

class SyncDataWorker extends Worker {
  SyncDataWorker({super.worker, required this.presenter, required this.prefs});
  final SyncPresenter presenter;

  final PreferenceProvider prefs;

  @override
  FutureOr<Result> call({Dio? dioTestClient}) async {
    try {
      await presenter.syncMetadata(dioTestClient: dioTestClient);
      return Result.success('data');
    } catch (error) {
      return Result.failure(Exception(error.toString()));
    }
  }
}
