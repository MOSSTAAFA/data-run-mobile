import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../commons/helpers/result.dart';
import '../sync_metadata_worker.dart';

abstract class Worker {
  Worker({this.worker});

  /// subscription.cancel() callback
  final Future<void> Function()? worker;

  FutureOr<Result> call(
      {OnProgressUpdate? onProgressUpdate, Dio? dioTestClient});
}
