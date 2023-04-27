// ignore_for_file: avoid_dynamic_calls, cast_nullable_to_non_nullable

import 'package:d2_remote/modules/data/tracker/queries/tracked_entity_instance.query.dart';
import 'package:dio/dio.dart';

import '../../../arch/call/d2_progress.dart';
import '../../../tracker/tracker_d2_progress.dart';
import '../../../tracker/tracker_d2_progress_manager.dart';

extension TeiQueryUploadExtension on TrackedEntityInstanceQuery {
  Future<D2Progress?> uploadWithProgress(
      void Function(TrackerD2Progress d2progress) callback,
      {Dio? dioTestClient}) async {
    final progressManager = TrackerD2ProgressManager(totalCalls: 3);
    upload((requestProgress, isCompleted) => callback(
        progressManager.increaseProgress(
            resourceName: requestProgress.resourceName,
            percentage: requestProgress.percentage,
            message: requestProgress.message,
            isComplete: isCompleted)));
    return progressManager.getProgress();
  }
}
