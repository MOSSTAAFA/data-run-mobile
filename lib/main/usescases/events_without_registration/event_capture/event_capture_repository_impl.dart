// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/core/maintenance/d2_error.dart';
import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/activity_management/activity/entities/activity.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:d2_remote/shared/utilities/merge_mode.util.dart';
import 'package:d2_remote/shared/utilities/save_option.util.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/foundation.dart';

import '../../../../commons/date/date_utils.dart';
import '../../../../commons/extensions/string_extension.dart';
import '../../../../core/di/providers.dart';
import '../../../../core/event/event_editable_status.dart';
import '../../../../core/event/event_extensions.dart';
import '../../../../core/event/event_status.dart';
import '../../../mp_logic/authorities.dart';
import 'di/event_capture_module.dart';
import 'event_capture_contract.dart';

class EventCaptureRepositoryImpl implements EventCaptureRepository {
  EventCaptureRepositoryImpl(this.ref, String? eventUid) : _eventUid = eventUid;
  final EventCaptureRepositoryRef ref;

  final String? _eventUid;

  Future<Event> _getCurrentEvent() async {
    return (await D2Remote.trackerModule.event.byId(_eventUid ?? '').getOne())!;
    // return await d2.eventModule().events().uid(eventUid).blockingGet();
  }

  @override
  Future<bool> isEnrollmentOpen() async {
    final Event currentEvent = await _getCurrentEvent();
    final enrollmentService = ref.read(enrollmentServiceProvider);
    return currentEvent.enrollment == null ||
        (await enrollmentService.isOpen(currentEvent.enrollment));
  }

  @override
  Future<bool> isEnrollmentCancelled() async {
    final Event currentEvent = await _getCurrentEvent();
    final Enrollment? enrollment = await D2Remote.trackerModule.enrollment
        .byId(currentEvent.enrollment)
        .getOne();
    if (enrollment == null) {
      return false;
    } else {
      return enrollment.status.toEnrollmentStatus == EnrollmentStatus.CANCELLED;
    }
  }

  @override
  Future<bool> isEventEditable(String eventUid) {
    return ref.read(eventServiceProvider).isEditable(eventUid);
  }

  @override
  Future<String> programStageName() async {
    final Event currentEvent = await _getCurrentEvent();
    final ProgramStage? prgramStage = await D2Remote.programModule.programStage
        .byId(currentEvent.programStage)
        .getOne();
    return prgramStage!.displayName!;
  }

  @override
  Future<String> eventDate() async {
    final Event currentEvent = await _getCurrentEvent();
    return currentEvent.eventDate != null
        ? DateUtils.uiDateFormat().format(currentEvent.eventDate.toDate()!)
        : '';
  }

  @override
  Future<OrganisationUnit> orgUnit() async {
    final Event currentEvent = await _getCurrentEvent();
    final orgUnit = await D2Remote.organisationUnitModule.organisationUnit
        .byId(currentEvent.orgUnit)
        .getOne();
    return orgUnit;
  }

  @override
  Future<Activity> activity() async {
    final Event currentEvent = await _getCurrentEvent();
    return (await D2Remote.activityModule.activity
        .byId(currentEvent.activity)
        .getOne())!;
  }

  @override
  Future<bool> completeEvent() async {
    try {
      final Event currentEvent = await _getCurrentEvent();
      currentEvent.status = EventStatus.COMPLETED.name;
      D2Remote.trackerModule.enrollment.mergeMode = MergeMode.Merge;
      await D2Remote.trackerModule.event
          .setData(currentEvent)
          .save(saveOptions: SaveOptions(skipLocalSyncStatus: true));
      D2Remote.trackerModule.enrollment.mergeMode = MergeMode.Replace;
      return true;
    } on D2Error catch (d2Error) {
      debugPrint(d2Error.stackTrace.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteEvent() async {
    return await D2Remote.trackerModule.event
        .byId(_eventUid ?? '')
        .delete()
        .then((value) => true);
  }

  @override
  Future<bool> updateEventStatus(EventStatus status) async {
    ///
    final Event currentEvent = await _getCurrentEvent();
    currentEvent.status = status.name;
    D2Remote.trackerModule.enrollment.mergeMode = MergeMode.Merge;
    await D2Remote.trackerModule.event
        .setData(currentEvent)
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: true));
    D2Remote.trackerModule.enrollment.mergeMode = MergeMode.Replace;
    return true;
  }

  @override
  Future<bool> rescheduleEvent(DateTime newDate) async {
    final Event currentEvent = await _getCurrentEvent();
    currentEvent.dueDate = DateUtils.databaseDateFormat().format(newDate);
    currentEvent.status = EventStatus.SCHEDULE.name;
    D2Remote.trackerModule.enrollment.mergeMode = MergeMode.Merge;
    await D2Remote.trackerModule.event
        .setData(currentEvent)
        .save(saveOptions: SaveOptions(skipLocalSyncStatus: true));
    D2Remote.trackerModule.enrollment.mergeMode = MergeMode.Replace;
    return true;
  }

  @override
  Future<String> programStage() async {
    ///
    final Event currentEvent = await _getCurrentEvent();
    return currentEvent.programStage;
  }

  @override
  Future<bool> getAccessDataWrite() {
    return Future.value(true);
    // return d2.eventModule().eventService().blockingHasDataWriteAccess(eventUid);
  }

  @override
  Future<EventStatus> eventStatus() async {
    ///
    final Event currentEvent = await _getCurrentEvent();
    return currentEvent.status.toEventStatus!;
  }

  @override
  Future<bool> canReOpenEvent() async {
    return (await D2Remote.userModule.user.getOne())!
            .authorities
            ?.map((authority) => authority.name)
            .containsAny(<String>[AUTH_UNCOMPLETE_EVENT, AUTH_ALL]) ??
        false;
  }

  @override
  Future<bool> isCompletedEventExpired(String eventUid) async {
    final EventEditableStatus editableStatus =
        await ref.read(eventServiceProvider).getEditableStatus(eventUid);
    return editableStatus.map(
        editable: (editable) => false,
        nonEditable: (nonEditable) =>
            nonEditable.reason == EventNonEditableReason.EXPIRED);
  }

  @override
  Future<bool> eventIntegrityCheck() async {
    final Event currentEvent = await _getCurrentEvent();
    final DateTime? currentEventDate = currentEvent.eventDate.toDate();

    return (currentEvent.status.toEventStatus == EventStatus.COMPLETED ||
            currentEvent.status.toEventStatus == EventStatus.ACTIVE) &&
        currentEvent.eventDate != null &&
        !(currentEventDate?.isAfter(DateTime.now()) ?? false);
  }

  @override
  Future<int> getNoteCount() {
    return Future.value(0);
    // TODO(NMC): implement Notes Query
    // return d2.noteModule().notes().byEventUid().eq(eventUid).count();
  }

  @override
  Future<bool> showCompletionPercentage() async {
    //
    return Future.value(false);
    // TODO(NMC): implement completionSpinner
    final Event currentEvent = await _getCurrentEvent();
    // if (d2.settingModule().appearanceSettings().blockingExists()) {
    //   ProgramConfigurationSetting programConfigurationSetting = d2
    //       .settingModule()
    //       .appearanceSettings()
    //       .getProgramConfigurationByUid(_getCurrentEvent().program());

    //   if (programConfigurationSetting != null &&
    //       programConfigurationSetting.completionSpinner() != null) {
    //     return programConfigurationSetting.completionSpinner();
    //   }
    // }
    // return true;
  }

  @override
  Future<bool> hasAnalytics() {
    return Future.value(false);
    // TODO(NMC): implement hasAnalytics

    // final Event currentEvent = _getCurrentEvent();
    // final bool hasProgramIndicators = !d2.programModule().programIndicators().byProgramUid().eq(currentEvent.program()).blockingIsEmpty();
    // List<ProgramRule> programRules = d2.programModule().programRules().withProgramRuleActions()
    //         .byProgramUid().eq(currentEvent.program()).blockingGet();
    // bool hasProgramRules = false;
    // for (ProgramRule rule : programRules) {
    //     for (ProgramRuleAction action : Objects.requireNonNull(rule.programRuleActions())) {
    //         if (action.programRuleActionType() == ProgramRuleActionType.DISPLAYKEYVALUEPAIR ||
    //                 action.programRuleActionType() == ProgramRuleActionType.DISPLAYTEXT) {
    //             hasProgramRules = true;
    //         }
    //     }
    // }
    // return hasProgramIndicators || hasProgramRules;
  }

  @override
  Future<bool> hasRelationships() {
    return Future.value(false);
    // TODO(NMC): implement Relationships
    // return !d2.relationshipModule().relationshipTypes()
    //         .byAvailableForEvent(eventUid)
    //         .blockingIsEmpty();
  }
}
