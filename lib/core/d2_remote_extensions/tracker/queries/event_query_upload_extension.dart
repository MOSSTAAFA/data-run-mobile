// ignore_for_file: avoid_dynamic_calls, cast_nullable_to_non_nullable

import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
import 'package:d2_remote/modules/activity_management/activity/queries/activity.query.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event_data_value.entity.dart';
import 'package:d2_remote/modules/data/tracker/models/event_import_summary.dart';
import 'package:d2_remote/modules/data/tracker/queries/event.query.dart';
import 'package:d2_remote/modules/data/tracker/queries/event_data_value.query.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:d2_remote/modules/metadata/program/queries/program_stage.query.dart';
import 'package:d2_remote/shared/utilities/http_client.util.dart';
import 'package:dio/dio.dart';
import 'package:queue/queue.dart';

import '../../../arch/call/d2_progress.dart';
import '../../../arch/call/d2_progress_status.dart';
import '../../../tracker/tracker_d2_progress.dart';
import '../../../tracker/tracker_d2_progress_manager.dart';

extension EventQueryUploadExtension on EventQuery {
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

  Future<List<Event>?> uploadProgress(
      void Function(TrackerD2Progress d2progress) callback,
      {Dio? dioTestClient}) async {
    final progressManager = TrackerD2ProgressManager(totalCalls: 3);
    callback(progressManager.increaseProgress(
      resourceName: this.apiResourceName as String,
      message:
          'Retrieving ${this.apiResourceName?.toLowerCase()} from phone database....',
      percentage: 0,
      isComplete: false,
    ));
    List<Event> events = await this
        .where(attribute: 'synced', value: false)
        .where(attribute: 'dirty', value: true)
        .get();

    callback(progressManager
        .setPrograms(events.map((item) => item.program!).toList()));

    // callback(progressManager.increaseProgress(
    //   resourceName: this.apiResourceName as String,
    //   message:
    //       '${events.length} ${this.apiResourceName?.toLowerCase()} retrieved successfully',
    //   percentage: 50,
    //   isComplete: false,
    // ));

    callback(progressManager.increaseProgress(
      resourceName: this.apiResourceName as String,
      message:
          'Uploading ${events.length} ${this.apiResourceName?.toLowerCase()} into the server...',
      percentage: 51,
      isComplete: false,
    ));

    List<String> eventIds = [];
    List<String> eventProgramStageIds = [];
    List<String> eventActivityIds = [];

    events.forEach((event) {
      eventIds.add(event.id as String);

      eventActivityIds.removeWhere((id) => id == event.activity);
      eventActivityIds.add(event.activity);

      eventProgramStageIds.removeWhere((id) => id == event.programStage);
      eventProgramStageIds.add(event.programStage);
    });

    List<EventDataValue> eventDataValues = await EventDataValueQuery()
        .whereIn(attribute: 'event', values: eventIds, merge: false)
        .get();

    List<Activity> activities =
        await ActivityQuery().byIds(eventActivityIds).get();

    List<ProgramStage> programStages =
        await ProgramStageQuery().byIds(eventProgramStageIds).get();

    final eventUploadPayload = events.map((event) {
      event.dataValues = eventDataValues
          .where((dataValue) => dataValue.event == event.id)
          .toList();
      event.programStage = programStages
          .lastWhere((programStage) => programStage.id == event.programStage)
          .toJson();

      event.activity = activities
          .lastWhere((activity) => activity.id == event.activity)
          .toJson();

      return Event.toUpload(event);
    }).toList();

    final response = await HttpClient.post(
        this.apiResourceName as String, {'events': eventUploadPayload},
        database: this.database, dioTestClient: dioTestClient);

    callback(progressManager.increaseProgress(
      resourceName: this.apiResourceName as String,
      message:
          'Upload for ${events.length} ${this.apiResourceName?.toLowerCase()} is completed.',
      percentage: 75,
      isComplete: false,
    ));

    callback(progressManager.increaseProgress(
      resourceName: this.apiResourceName as String,
      message: 'Saving import summaries into the phone database...',
      percentage: 76,
      isComplete: false,
    ));

    final List<dynamic> importSummaries =
        (response.body?['response']?['importSummaries'] ?? []).toList();

    final queue = Queue(parallel: 50);
    num availableItemCount = 0;

    for (var event in events) {
      final importSummary = importSummaries.lastWhere((summary) =>
          summary['reference'] != null && summary['reference'] == event.id);

      if (importSummary != null) {
        availableItemCount++;
        final syncFailed = importSummary['status'] == 'ERROR';
        event.synced = !syncFailed;
        callback(progressManager.updateProgramSyncStatus(
            event.program!,
            syncFailed
                ? D2ProgressSyncStatus.SUCCESS
                : D2ProgressSyncStatus.ERROR,
            message: syncFailed
                ? 'syncFailed-implement get message from importSummary'
                : 'Success'));
        event.dirty = true;
        event.syncFailed = syncFailed;
        event.lastSyncDate = DateTime.now().toIso8601String().split('.')[0];
        event.lastSyncSummary = EventImportSummary.fromJson(importSummary);
        await queue.add(() => EventQuery().setData(event).save());
      }
    }
  }
}
