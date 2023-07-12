// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/maintenance/d2_error.dart';
import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/core/mp/helpers/result.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:dartx/dartx_io.dart';

import '../../../../../commons/date/date_utils.dart';
import '../../../../../commons/extensions/date_format_extensions.dart';
import '../../../../../commons/extensions/feature_type_extension.dart';
import '../../../../../commons/extensions/standard_extensions.dart';
import '../../../../../commons/resources/d2_error_utils.dart';
import '../../../../../core/event/event_editable_status.dart';
import '../../../../../core/event/event_extensions.dart';
import '../../../../../core/event/event_object_repository.dart';
import '../../../../../core/event/event_service.dart';
import '../../../../../core/event/event_status.dart';
import '../../../../../core/organisation_unit/org_unit_extension.dart';
import '../../../../../form/model/field_ui_model.dart';
import '../../../../../form/ui/field_view_model_factory.dart';
import '../../../../mp_logic/authorities.dart';

class EventDetailsRepository {
  const EventDetailsRepository(
      {required this.programUid,
      this.eventUid,
      this.programStageUid,
      required this.fieldFactory,
      required this.d2ErrorMapper,
      required this.eventService});

  final String programUid;
  final String? eventUid;
  final String? programStageUid;
  final FieldViewModelFactory fieldFactory;
  final D2ErrorUtils d2ErrorMapper;

  // TODO(NMC): inside eventModule
  final EventService eventService;

  Future<ProgramStage> getProgramStage() async {
    return (await D2Remote.programModule.programStage
        .byId(programStageUid ?? (await getEvent())?.programStage())
        .getOne())!;
  }

  // ObjectStyle? getObjectStyle()  {
// val programStage: ProgramStage = getProgramStage();
// val program = getProgram();
// return when (program?.registration()) {
// true -> programStage.style();
// else -> program?.style();
// }
// }

  Future<EventEditableStatus?> getEditableStatus() {
    if (eventUid != null) {
      return eventService.getEditableStatus(eventUid!);
    }

    return Future<EventEditableStatus?>.value();
  }

  Future<Event?> getEvent() async {
    return await eventUid
        ?.aLet((it) => D2Remote.trackerModule.event.byId(eventUid!).getOne());
  }

  Future<Program?> getProgram() {
    return D2Remote.programModule.program.byId(programUid).getOne();
  }

  Future<int> getMinDaysFromStartByProgramStage() async {
    final ProgramStage programStage = await getProgramStage();
    if (programStage.minDaysFromStart != null) {
      return programStage.minDaysFromStart!;
    }

    return 0;
  }

  Future<DateTime> getStageLastDate(String? enrollmentUid) async {
    List<Event> activeEvents = [];
    List<Event> scheduleEvents = [];
    if (enrollmentUid != null && programStageUid != null) {
      activeEvents = await D2Remote.trackerModule.event
          .byEnrollment(enrollmentUid)
          .byProgramStage(programStageUid!)
          .get();
      activeEvents = activeEvents.sortedByDescending((Event event) =>
          event.eventDate
              ?.let((it) => DateUtils.databaseDateFormat().parse(it)) ??
          DateTime.now());

      scheduleEvents = await D2Remote.trackerModule.event
          .byEnrollment(enrollmentUid)
          .byProgramStage(programStageUid!)
          .get();
      ;

      scheduleEvents = activeEvents.sortedByDescending((Event event) =>
          event.dueDate
              ?.let((it) => DateUtils.databaseDateFormat().parse(it)) ??
          DateTime.now());
    }

    DateTime? activeDate;
    DateTime? scheduleDate;

    if (activeEvents.isNotEmpty) {
      activeDate =
          DateUtils.databaseDateFormat().parse(activeEvents[0].eventDate!);
    }
    if (scheduleEvents.isNotEmpty) {
      scheduleDate =
          DateUtils.databaseDateFormat().parse(scheduleEvents[0].dueDate!);
    }

    return activeDate ?? scheduleDate ?? DateTime.now();
  }

  Future<bool> hasAccessDataWrite() {
    // TODO(NMC): implement hasAccessDataWrite
// return if (eventUid != null) {
// d2.eventModule().eventService().isEditable(eventUid).blockingGet()
// } else {
// return getProgramStage().access().data().write()
// }
    return Future.value(true);
  }

  Future<bool> isEnrollmentOpen() async {
    Event? event;
    bool isActive = false;
    if (eventUid != null) {
      event = await D2Remote.trackerModule.event.byId(eventUid!).getOne();

      if (event != null) {
        isActive = (await D2Remote.trackerModule.enrollment
                    .byId(event.enrollment)
                    .getOne())
                ?.status
                .toEnrollmentStatus ==
            EnrollmentStatus.ACTIVE;
      } else {
        isActive = false;
      }
    }

    return event?.enrollment == null || isActive;
  }

  Future<DateTime?> getEnrollmentDate(String? uid) async {
    Enrollment? enrollment;
    if (uid != null) {
      enrollment = await D2Remote.trackerModule.enrollment.byId(uid).getOne();
    }

    return DateUtils.databaseDateFormat()
        .parseOrNull(enrollment?.enrollmentDate ?? '');
  }

  Future<List<OrganisationUnit>> getFilteredOrgUnits(
      String? date, String? parentUid) async {
    List<OrganisationUnit> organisationUnits;
    if (parentUid != null) {
      organisationUnits = await _getOrgUnitsByParentUid(parentUid);
    } else {
      organisationUnits = await getOrganisationUnits();
    }

    if (date != null) {
      return organisationUnits.filter((OrganisationUnit orgUnit) {
        return DateUtils.databaseDateFormat()
                    .parseOrNull(orgUnit.openingDate)
                    ?.isAfter(DateUtils.databaseDateFormat().parse(date)) ==
                false &&
            DateUtils.databaseDateFormat()
                    .parseOrNull(orgUnit.closedDate ?? '')
                    ?.isBefore(DateUtils.databaseDateFormat().parse(date)) ==
                false;
      }).toList();
    }

    return organisationUnits;
  }

  Future<List<OrganisationUnit>> _getOrgUnitsByParentUid(
      String parentUid) async {
    final List<OrganisationUnit> orgUnits = await D2Remote
        .organisationUnitModule.organisationUnit
        .where(attribute: 'parent', value: parentUid)
        // TODO(NMC): implement OrganisationUnitScope
        // .byOrganisationUnitScope(OrganisationUnitScope.SCOPE_DATA_CAPTURE)
        .get();
    return orgUnits.byProgramUids(programUid);
  }

  Future<OrganisationUnit?> getOrganisationUnit(String orgUnitUid) async {
    return D2Remote.organisationUnitModule.organisationUnit
        .byId(orgUnitUid)
        .getOne();
  }

  Future<List<OrganisationUnit>> getOrganisationUnits() async {
    final List<OrganisationUnit> orgUnits = await D2Remote
        .organisationUnitModule.organisationUnit
        // TODO(NMC): implement OrganisationUnitScope
        // .byOrganisationUnitScope(OrganisationUnitScope.SCOPE_DATA_CAPTURE)
        .get();
    return orgUnits.byProgramUids(programUid);
  }

  Future<FieldUiModel> getGeometryModel() async {
    final List<EventStatus?> nonEditableStatus = [];
    nonEditableStatus.add(EventStatus.COMPLETED);
    nonEditableStatus.add(EventStatus.SKIPPED);

    final bool shouldBlockEdition = eventUid != null &&
        await eventService.isEditable(eventUid!) &&
        nonEditableStatus.contains(
            (await D2Remote.trackerModule.event.byId(eventUid!).getOne())
                ?.status
                .toEventStatus);

    final FeatureType? featureType =
        (await getProgramStage()).featureType.toFeatureType;
    final bool accessDataWrite =
        await hasAccessDataWrite() && await isEnrollmentOpen();
    final String? coordinatesValue = await eventUid?.aLet((it) async =>
        (await D2Remote.trackerModule.event.byId(it).getOne())?.coordinate);

    return fieldFactory.create(
        id: '',
        label: '',
        valueType: ValueType.COORDINATE,
        mandatory: false,
        value: coordinatesValue,
        editable: accessDataWrite && !shouldBlockEdition,
        allowFutureDates: false,
        description: null,
        featureType: featureType);
  }

  Future<Event> updateEvent(
    DateTime selectedDate,
    String? selectedOrgUnit,
    String? catOptionComboUid,
    String? coordinates,
  ) async {
    Geometry?
        geometry; /*coordinates?.let {
      Geometry.builder()
          .coordinates(it)
          .type(getProgramStage().featureType())
          .build()
    }*/

    final eventRepository = EventObjectRepository(eventUid!);

    await eventRepository.setEventDate(selectedDate);
    if (selectedOrgUnit != null) {
      await eventRepository.setOrganisationUnitUid(selectedOrgUnit);
    }

    final FeatureType? featureType = (await D2Remote.programModule.programStage
            .byId((await eventRepository.getEvent())!.programStage)
            .getOne())
        ?.featureType
        .toFeatureType;
    switch (featureType) {
      case FeatureType.POINT:
      case FeatureType.POLYGON:
      case FeatureType.MULTI_POLYGON:
        await eventRepository.setGeometry(geometry);
        break;
      default:
    }

    return (await eventRepository.getEvent())!;
  }

  Future<bool> getCanReopen() async {
    return await (await getEvent())?.aLet((Event it) async =>
            it.status.toEventStatus == EventStatus.COMPLETED &&
            await _hasReopenAuthority()) ??
        false;
  }

  Future<bool> _hasReopenAuthority() async {
    return (await D2Remote.userModule.user.getOne())!
            .authorities
            ?.map((authority) => authority.name)
            .containsAny(<String>[AUTH_UNCOMPLETE_EVENT, AUTH_ALL]) ??
        false;
  }

  Future<Result<String, dynamic>> reopenEvent() async {
    try {
      await eventUid?.aLet((String it) =>
          EventObjectRepository(it).setStatus(EventStatus.ACTIVE));

      return Result.success('');
    } on D2Error catch (d2Error) {
      return Result.failure(Exception(d2ErrorMapper.getErrorMessage(d2Error)));
    }
  }
}
