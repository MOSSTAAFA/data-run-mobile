// ignore_for_file: avoid_dynamic_calls, cast_nullable_to_non_nullable

import 'package:d2_remote/shared/entities/base.entity.dart';
import 'package:d2_remote/shared/queries/base.query.dart';
import 'package:dio/dio.dart';

import '../../../tracker/tracker_d2_progress.dart';
import '../../../tracker/tracker_d2_progress_manager.dart';

extension EventQueryDownloadExtension<T extends BaseEntity> on BaseQuery<T> {
  Future<List<T>?> downloadWithProgress(
      void Function(TrackerD2Progress d2progress) callback,
      {Dio? dioTestClient}) async {
    final progressManager = TrackerD2ProgressManager(totalCalls: 3);

    return download((requestProgress, isComplete) => callback(
        progressManager.increaseProgress(
            resourceName: requestProgress.resourceName,
            message: requestProgress.message,
            percentage: requestProgress.percentage,
            isComplete: isComplete)));
  }
}
