import 'dart:async';

import 'package:dio/dio.dart';

import 'sync_presenter.dart';

import '../../../commons/helpers/result.dart';
import '../../../commons/prefs/preference_provider.dart';
import '../../../commons/resources/resource_manager.dart';
import 'work_manager/worker.dart';

typedef OnProgressUpdate = Function(int progress);

class SyncMetadataWorker extends Worker {
  SyncMetadataWorker(
      {super.worker,
      required this.presenter,
      required this.prefs,
      required this.resourceManager});
  final SyncPresenter presenter;

  final PreferenceProvider prefs;

  final ResourceManager resourceManager;

  @override
  FutureOr<Result> call(
      {OnProgressUpdate? onProgressUpdate, Dio? dioTestClient}) async {
    try {
      await presenter.syncMetadata(dioTestClient: dioTestClient);
      return Result.success('data');
    } catch (error) {
      // TODO(NMC): parse Error using resourceManager
      return Result.failure(Exception(error.toString()));
    }
  }
}
