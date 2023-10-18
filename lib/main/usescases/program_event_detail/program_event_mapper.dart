// ignore_for_file: avoid_dynamic_calls, always_specify_types

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event_data_value.entity.dart';
import 'package:d2_remote/modules/data/tracker/queries/event_data_value.query.dart';
import 'package:d2_remote/modules/metadata/data_element/entities/data_element.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage_data_element.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage_section.entity.dart';
import 'package:d2_remote/shared/utilities/sort_order.util.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/data/event_view_model.dart';
import '../../../commons/data/program_event_view_model.dart';
import '../../../commons/date/date_utils.dart';
import '../../../commons/extensions/standard_extensions.dart';
import '../../../commons/extensions/string_extension.dart';
import '../../../commons/extensions/value_extensions.dart';
import '../../../commons/helpers/collections.dart';
import '../../../core/di/providers.dart';
import '../../../core/event/event_extensions.dart';

part 'program_event_mapper.g.dart';

@riverpod
ProgramEventMapper programEventMapper(ProgramEventMapperRef ref) {
  return ProgramEventMapper(ref);
}

class ProgramEventMapper {
  // final DhisPeriodUtils periodUtils;
  // final CrashReportController crashReportController;
  ProgramEventMapper(this.ref);

  final ProgramEventMapperRef ref;

  Future<EventModel> eventToEventViewModel(Event event) async {
    final ProgramStage programStage = (await D2Remote.programModule.programStage
        .byId(event.programStage)
        .getOne())!;

    // crashReportController.addBreadCrumb(
    //     "ProgramEventMapper.eventToEventViewModel",
    //     "Event: $event"
    // );

    // final DateTime? eventDate = event.eventDate.toDate() ?? event.dueDate.toDate();

    final String? eventDate =
        (event.eventDate.toDate() ?? event.dueDate.toDate())
            ?.let((it) => DateUtils.uiDateFormat().format(it));

    final eventModel = EventModel(
        type: EventViewModelType.EVENT,
        stage: programStage,
        event: event,
        eventCount: 0,
        lastUpdate: event.lastUpdated.toDate(),
        isSelected: false,
        canAddNewEvent: true,
        orgUnitName: (await D2Remote.organisationUnitModule.organisationUnit
                    .byId(event.orgUnit)
                    .getOne())
                ?.displayName ??
            '-',
        activityName: await _getActivityName(event.activity),
        dataElementValues:
            await _getEventValues(event.id!, event.programStage!),
        groupedByStage: true,
        displayDate: eventDate
        // {
        //     periodUtils.getPeriodUIString(
        //         programStage.periodType() ?: PeriodType.Daily,
        //         it,
        //         Locale.getDefault()
        //     )
        // }
        );

    return eventModel;
  }

  Future<ProgramEventViewModel> eventToProgramEvent(Event event) async {
    final String orgUnitName = await _getOrgUnitName(event.orgUnit) ?? '';
    final List<String> showInReportsDataElements = [];
    final List<ProgramStageDataElement> programStageDataElements =
        await _getProgramStageDataElements(event.programStage);
    programStageDataElements.forEach((it) {
      if (it.displayInReports ?? false) {
        showInReportsDataElements.add(it.dataElementId);
      }
    });

    final List<Pair<String, String>> data = await _getData(
        event.dataValues, showInReportsDataElements, event.programStage);
    // TODO(NMC): implement _isExpired()
    final bool hasExpired = false /* _isExpired(event) */;

    // TODO(NMC): implement _checkOrgUnitRange()
    final bool inOrgUnitRange = true;
    // _checkOrgUnitRange(event.orgUnit, event.eventDate!);
    final String activityName = await _getActivityName(event.activity) ?? '';
    // final String attrOptCombo =
    //     if (catOptComb != null && !catOptComb.displayName().equals("default")) {
    //         catOptComb.displayName()!!
    //     } else {
    //         ""
    //     }
    final bool dirty = event.dirty;

    return ProgramEventViewModel(
        uid: event.id!,
        orgUnitUid: event.orgUnit,
        orgUnitName: orgUnitName,
        date: event.eventDate.toDate()!,
        dirty: dirty,
        eventDisplayData: data,
        eventStatus: event.status.toEventStatus!,
        isExpired: hasExpired || !inOrgUnitRange,
        activityUid: event.activity,
        activityName: activityName,
        geometry: event.geometry,
        canBeEdited:
            await ref.read(eventServiceProvider).isEditable(event.id!));
  }

  Future<List<ProgramEventViewModel>> eventsToProgramEvents(
      List<Event> events) async {
    // final result = await Future.forEach(events.where((Event it) => it.geometry != null),
    //         (Event event) =>  eventToProgramEvent(event));
    final eventsWithGeo = events.where((Event it) => it.geometry != null);

    return [
      for (final event in eventsWithGeo) await eventToProgramEvent(event)
    ];
  }

  Future<List<Pair<String, String>>> _getData(List<EventDataValue>? dataValues,
      List<String> showInReportsDataElements, String? programStage) async {
    final List<Pair<String, String>> data = [];

    await dataValues?.aLet((it) async {
      final List<ProgramStageSection> stageSections =
          await _getStageSections(programStage);
      stageSections.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
      // stageSections.sortBy { it.sortOrder() }
      final List<String> dataElementsOrder = [];
      if (stageSections.isEmpty) {
        final List<ProgramStageDataElement> programStageDataElements =
            await _getProgramStageDataElements(programStage);
        programStageDataElements.forEach((stage) {
          dataElementsOrder.add(stage.dataElementId);
        });
        // programStageDataElements.forEach { stage ->
        //     stage.dataElement()?.let {
        //         dataElementsOrder.add(it.uid())
        //     }
        // }
      } else {
        stageSections.forEach((it) {
          dataElementsOrder
              .addAll(it.dataElements?.map((e) => e.dataElement) ?? []);
        });
      }

      /// dataValues.sortedWith
      Future.forEach<EventDataValue>(
          dataValues
            ..sort((de1, de2) {
              final pos1 = dataElementsOrder.indexOf(de1.dataElement);
              final pos2 = dataElementsOrder.indexOf(de2.dataElement);
              return pos1.compareTo(pos2);
            }), (it) async {
        final DataElement? dataElement = await _getDataElement(it.dataElement);
        if (dataElement != null &&
            showInReportsDataElements.contains(dataElement.id)) {
          final String? displayName;
          /* if (!dataElement.displayFormName().isNullOrEmpty()) {
                        dataElement.displayFormName()
                    } else  */
          if (!(dataElement.displayName?.isEmpty ?? true)) {
            displayName = dataElement.displayName;
          } else if (!(dataElement.name?.isEmpty ?? true)) {
            displayName = dataElement.name;
          } else {
            displayName = dataElement.id;
          }
          final String value = await it.userFriendlyValue() ?? '';
          if (displayName != null) {
            data.add(Pair(displayName, value));
          }
        }
      });
      dataValues.sort((de1, de2) {
        final pos1 = dataElementsOrder.indexOf(de1.dataElement);
        final pos2 = dataElementsOrder.indexOf(de2.dataElement);
        return pos1.compareTo(pos2);
      });
      dataValues.forEach((it) {});
    });

    return data;
  }

  Future<DataElement?> _getDataElement(String? dataElement) async =>
      await dataElement?.aLet((String it) async =>
          D2Remote.organisationUnitModule.organisationUnit.byId(it).getOne());

  Future<List<ProgramStageSection>> _getStageSections(
          String? programStage) async =>
      (await programStage?.aLet((String it) => D2Remote
          .programModule.programStageSection
          .byId(it)
          .withDataElements()
          .get())) ??
      [];

  Future<String?> _getOrgUnitName(String? orgUnitUid) async =>
      (await orgUnitUid?.aLet((String it) => D2Remote
              .organisationUnitModule.organisationUnit
              .byId(it)
              .getOne()))
          ?.displayName;

  Future<String?> _getActivityName(String? activityUid) async =>
      (await activityUid?.aLet((String it) =>
              D2Remote.activityModule.activity.byId(it).getOne()))
          ?.displayName;

  Future<List<ProgramStageDataElement>> _getProgramStageDataElements(
          String? programStageUid) async =>
      (await programStageUid?.aLet((String it) => D2Remote
          .programModule.programStageDataElement
          .byProgramStage(it)
          .orderBy(attribute: 'sortOrder', order: SortOrder.ASC)
          .get())) ??
      [];

  Future<List<Pair<String, String?>>> _getEventValues(
      String eventUid, String stageUid) async {
    final List<String> displayInListDataElements = (await D2Remote
            .programModule.programStageDataElement
            .byProgramStage(stageUid)
            .get())
        .map((it) => it.dataElementId)
        .toList();
    // d2.programModule().programStageDataElements()
    //     .byProgramStage().eq(stageUid)
    //     .byDisplayInReports().isTrue
    //     .blockingGet().map {
    //         it.dataElement()?.uid()!!
    //     }
    if (displayInListDataElements.isNotEmpty) {
      final List<Pair<String, String?>> list = [];
      await Future.forEach<String>(displayInListDataElements, (it) async {
        final EventDataValueQuery valueRepo = D2Remote
            .trackerModule.eventDataValue
            .byEvent(eventUid)
            .byDataElement(it);

        final DataElement de =
            (await D2Remote.dataElementModule.dataElement.byId(it).getOne())!;
        final int count = await valueRepo.count();
        final dataValue = await valueRepo.getOne();
        String? userFriendlyValue = '-';
        if (count > 0) {
          userFriendlyValue = await dataValue.userFriendlyValue();
        }

        final pair =
            Pair<String, String?>(de.displayName ?? '', userFriendlyValue);
        list.add(pair);
      });
      return list;
    } else {
      return [];
    }
  }
}
