// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/core/arch/helpers/uids_helper.dart';
import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/maintenance/d2_error.dart';
import 'package:d2_remote/core/mp/enrollment/enrollment_status.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event_data_value.entity.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/metadata/data_element/entities/data_element.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:d2_remote/modules/metadata/organisation_unit/entities/organisation_unit.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage_data_element.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage_section.entity.dart';

import '../../../../commons/extensions/standard_extensions.dart';
import '../../../../commons/extensions/value_extensions.dart';
import '../../../../core/di/providers.dart';
import '../../../../core/event/event_editable_status.dart';
import '../../../../core/event/event_extensions.dart';
import '../../../../core/event/event_object_repository.dart';
import '../../../../core/event/event_projection.dart';
import '../../../../core/event/event_status.dart';
import '../../../../core/organisation_unit/org_unit_extension.dart';
import '../../../../form/data/form_section_view_model.dart';
import '../../../../form/model/field_ui_model.dart';
import '../../../../form/model/option_set_configuration.dart';
import '../../../../form/ui/field_view_model_factory.dart';
import 'di/event_initial_module.dart';
import 'event_initial_repository.dart';

class EventInitialRepositoryImpl implements EventInitialRepository {
  EventInitialRepositoryImpl(this.ref,
      {required final FieldViewModelFactory fieldFactory,
      // final RuleEngineRepository ruleEngineRepository,
      final String? eventUid,
      final String? stageUid})
      : _fieldFactory = fieldFactory,
        // _ruleEngineRepository = ruleEngineRepository,
        _eventUid = eventUid,
        _stageUid = stageUid;

  final EventInitialRepositoryRef ref;
  final FieldViewModelFactory _fieldFactory;

  // final RuleEngineRepository _ruleEngineRepository;
  final String? _eventUid;
  final String? _stageUid;

  @override
  Future<Event> event(String eventId) async {
    return (await D2Remote.trackerModule.event.getOne())!;
  }

  Future<List<OrganisationUnit>> orgUnits(
      String programId, String parentUid) async {
    final List<OrganisationUnit> orgUnits = await D2Remote
        .organisationUnitModule.organisationUnit
        .where(attribute: 'parent', value: parentUid)
        // TODO(NMC): implement OrganisationUnitScope
        // .byOrganisationUnitScope(OrganisationUnitScope.SCOPE_DATA_CAPTURE)
        .get();

    return orgUnits.byProgramUids(programId);
  }

  @override
  Future<String> createEvent(
      String enrollmentUid,
      String? trackedEntityInstanceUid,
      String programUid,
      String programStage,
      DateTime date,
      String orgUnitUid,
      String activityUid,
      Geometry geometry) async {
    final DateTime dateTime = DateTime(date.year, date.month, date.day);

    final Event eventToAdd = (EventCreateProjection.builder()
          ..enrollment = enrollmentUid
          ..programStage = programStage
          // ..program = programUid
          ..activity = activityUid
          ..organisationUnit = orgUnitUid)
        .build();

    await D2Remote.trackerModule.event.setData(eventToAdd).save();

    final EventObjectRepository eventRepository =
        EventObjectRepository(eventToAdd.id!);

    await eventRepository.setEventDate(dateTime);
    final Event? event = await eventRepository.getEvent();

    final FeatureType? featureType = (await D2Remote.programModule.programStage
            .byId(event!.programStage)
            .getOne())
        ?.featureType
        .toFeatureType;

    if (featureType != null) {
      switch (featureType) {
        case FeatureType.POINT:
        case FeatureType.POLYGON:
        case FeatureType.MULTI_POLYGON:
          await eventRepository.setGeometry(geometry);
          break;
        default:
      }
    }
    return event.id!;
  }

  @override
  Future<String> scheduleEvent(
      String enrollmentUid,
      String? trackedEntityInstanceUid,
      String programUid,
      String programStage,
      DateTime dueDate,
      String orgUnitUid,
      String activityUid,
      Geometry geometry) async {
    final DateTime dateTime =
        DateTime(dueDate.year, dueDate.month, dueDate.day);

    final Event eventToAdd = (EventCreateProjection.builder()
          ..enrollment = enrollmentUid
          ..programStage = programStage
          // ..program = programUid
          ..activity = activityUid
          ..organisationUnit = orgUnitUid)
        .build();

    await D2Remote.trackerModule.event.setData(eventToAdd).save();

    final EventObjectRepository eventRepository =
        EventObjectRepository(eventToAdd.id!);

    await eventRepository.setDueDate(dateTime);
    await eventRepository.setStatus(EventStatus.SCHEDULE);
    final Event? event = await eventRepository.getEvent();

    final FeatureType? featureType = (await D2Remote.programModule.programStage
            .byId(event!.programStage)
            .getOne())
        ?.featureType
        .toFeatureType;

    if (featureType != null) {
      switch (featureType) {
        case FeatureType.POINT:
        case FeatureType.POLYGON:
        case FeatureType.MULTI_POLYGON:
          await eventRepository.setGeometry(geometry);
          break;
        default:
      }
    }
    return event.id!;
  }

  @override
  Future<ProgramStage?> programStage(String? programUid) async {
    return programUid?.aLet((it) =>
        D2Remote.programModule.programStage.byProgram(programUid).getOne());
    // return D2Remote.programModule.programStage.byProgram(programUid).getOne();
  }

  @override
  Future<ProgramStage?> programStageWithId(String? programStageUid) async {
    return programStageUid
        ?.aLet((it) => D2Remote.programModule.programStage.byId(it).getOne());
  }

  @override
  Future<ProgramStage?> programStageForEvent(String eventId) async {
    final Event? event =
        await D2Remote.trackerModule.event.byId(eventId).getOne();
    if (event != null) {
      return D2Remote.programModule.programStage
          .byId(event.programStage)
          .getOne();
    }
    return null;
  }

  @override
  Future<bool> accessDataWrite(String programUid) {
    if (_eventUid != null) {
      return ref.read(eventServiceProvider).isEditable(_eventUid!);
    } else {
      // TODO(NMC): implement DataAccess
      // return d2.programModule().programStages().uid(stageUid).get().toObservable()
      //     .map(programStage -> programStage.access().data().write());
      return Future.value(true);
    }
  }

  @override
  Future<void> deleteEvent(String eventId, String trackedEntityInstance) async {
    try {
      await D2Remote.trackerModule.event.byId(eventId).delete();
    } on D2Error catch (d2Error) {
      print('Timber.e($d2Error)');
    }
  }

  @override
  Future<bool> isEnrollmentOpen() async {
    final Event? event =
        await D2Remote.trackerModule.event.byId(_eventUid ?? '').getOne();
    return event == null ||
        event.enrollment == null ||
        (await D2Remote.trackerModule.enrollment
                    .byId(event.enrollment)
                    .getOne())
                ?.status
                .toEnrollmentStatus ==
            EnrollmentStatus.ACTIVE;
  }

  @override
  Future<Program?> getProgramWithId(String? programUid) async {
    return await programUid
        ?.aLet((it) => D2Remote.programModule.program.byId(it).getOne());
  }

  @override
  bool showCompletionPercentage() {
    // if (d2.settingModule().appearanceSettings().blockingExists()) {
    //   String programUid = d2.eventModule().events().uid(eventUid).blockingGet().program();
    //   ProgramConfigurationSetting programConfigurationSetting = d2.settingModule()
    //       .appearanceSettings()
    //       .getProgramConfigurationByUid(programUid);
    //
    //   if (programConfigurationSetting != null &&
    //       programConfigurationSetting.completionSpinner() != null) {
    //     return programConfigurationSetting.completionSpinner();
    //   }
    // }
    return true;
  }

  @override
  Future<List<FormSectionViewModel>> eventSections() {
    return D2Remote.trackerModule.event
        .byId(_eventUid ?? '')
        .getOne()
        .then((eventSingle) async {
      final List<FormSectionViewModel> formSection = [];
      if (eventSingle?.deleted == null || eventSingle?.deleted == false) {
        final ProgramStage? stage = await D2Remote.programModule.programStage
            .byId(eventSingle?.programStage ?? '')
            .getOne();
        final List<ProgramStageSection> stageSections = await D2Remote
            .programModule.programStageSection
            .where(attribute: 'programStage', value: stage?.id)
            .get();
        if (stageSections.length > 0) {
          stageSections
              .sort((one, two) => one.sortOrder.compareTo(two.sortOrder));
          for (final ProgramStageSection section in stageSections) {
            formSection.add(FormSectionViewModel.createForSection(
                _eventUid!,
                section.id!,
                section.displayName!,
                section.renderType != null ? section.renderType : null));
          }
        } else {
          formSection.add(FormSectionViewModel.createForSection(
              _eventUid!, '', '', SectionRenderingType.LISTING.name));
        }
      }
      return formSection;
    });
  }

  @override
  Future<List<FieldUiModel>> list() {
    return D2Remote.trackerModule.event
        .withDataValues()
        .byId(_eventUid ?? '')
        .getOne()
        .then((Event? event) async {
      final List<FieldUiModel> fields = [];
      final ProgramStage? stage = await D2Remote.programModule.programStage
          .byId(event?.programStage)
          .getOne();
      final List<ProgramStageSection> sections = await D2Remote
          .programModule.programStageSection
          .withDataElements()
          .byProgramStage(stage?.id ?? '')
          .get();
      final List<ProgramStageDataElement> stageDataElements = await D2Remote
          .programModule.programStageDataElement
          .byProgramStage(stage?.id ?? '')
          .get();
      if (sections.isNotEmpty) {
        for (final ProgramStageSection stageSection in sections) {
          for (final ProgramStageDataElement programStageDataElement
              in stageDataElements) {
            if (UidsHelper.getUidsList(stageSection.dataElements ?? [])
                .contains(programStageDataElement.dataElementId)) {
              final DataElement dataelement = await D2Remote
                  .dataElementModule.dataElement
                  .byId(programStageDataElement.dataElementId)
                  .getOne();
              fields.add(await _transform(
                  programStageDataElement,
                  dataelement,
                  _searchValueDataElement(programStageDataElement.dataElementId,
                      event?.dataValues ?? []),
                  stageSection.id,
                  event!.status.toEventStatus!));
            }
          }
        }
      } else {
        for (final ProgramStageDataElement programStageDataElement
            in stageDataElements) {
          final DataElement dataElement = await D2Remote
              .dataElementModule.dataElement
              .byId(programStageDataElement.dataElementId)
              .getOne();
          fields.add(await _transform(
              programStageDataElement,
              dataElement,
              _searchValueDataElement(programStageDataElement.dataElementId,
                  event?.dataValues ?? []),
              null,
              event!.status.toEventStatus!));
        }
      }
      return fields;
    });
  }

  Future<FieldUiModel> _transform(
      ProgramStageDataElement stage,
      DataElement dataElement,
      String value,
      String? programStageSection,
      EventStatus eventStatus) async {
    final String uid = dataElement.id!;
    final String displayName = dataElement.displayName!;
    final String valueTypeName = dataElement.valueType;
    final bool mandatory = stage.compulsory ?? false;
    final String? optionSet = dataElement.optionSet;
    String? dataValue = value;
    final List<Option> option = optionSet != null
        ? await D2Remote.optionModule.option
            .byOptionSet(optionSet)
            .where(attribute: 'code', value: dataValue)
            .get()
        : [];
    final bool allowFutureDates = stage.allowFutureDate ?? true;
    final String? formName = dataElement.displayName;
    final String? description = dataElement.description;

    OptionSetConfiguration? optionSetConfig;
    if (optionSet != null) {
      final List<Option> dataValueOptions = await D2Remote.optionModule.option
          .byOptionSet(optionSet)
          .where(attribute: 'code', value: dataValue)
          .get();
      if (!dataValueOptions.isEmpty) {
        dataValue = option[0].displayName;
      }

      final int optionCount =
          await D2Remote.optionModule.option.byOptionSet(optionSet).count();
      final List<Option> options =
          await D2Remote.optionModule.option.byOptionSet(optionSet).get();
      optionSetConfig =
          OptionSetConfiguration.config(optionCount, () => options);
    }

    // ValueTypeDeviceRendering fieldRendering = stage.renderType == null ? null : stage.renderType().mobile();
    //
    // ObjectStyle objectStyle = d2.dataElementModule().dataElements().uid(uid).blockingGet().style();

    return _fieldFactory.create(
        id: uid,
        label: formName ?? displayName,
        valueType: valueTypeName.toValueType!,
        mandatory: mandatory,
        optionSet: optionSet,
        value: dataValue,
        programStageSection: programStageSection,
        allowFutureDates: allowFutureDates,
        editable: eventStatus == EventStatus.ACTIVE,
        renderingType: null,
        description: description,
        fieldRendering: null,
        // objectStyle:objectStyle,
        fieldMask: dataElement.fieldMask,
        optionSetConfiguration: optionSetConfig,
        featureType: null);
  }

  String _searchValueDataElement(
      String dataElement, List<EventDataValue> dataValues) {
    for (final EventDataValue dataValue in dataValues) {
      if (dataValue.dataElement == dataElement) {
        return dataValue.value;
      }
    }

    return '';
  }

  @override
  Future<EventEditableStatus> getEditableStatus() {
    return ref.read(eventServiceProvider).getEditableStatus(_eventUid ?? '');
  }

  /// Sometimes it might be nessascary to refer a patient to a different Organisation unit. To refer a
  /// TEI:
  /// 1- Open the Tracker Capture app.
  /// 2- Open an existing TEI dashboard.
  /// 3- In the Timeline Data entry or Tabular data entry widget, click the Arrow icon.
  /// 4- Select a Programstage, Organisation unit and set a **Report date**.
  /// 5- Click either One-time referral which will only refer TEI for one single event or Move
  /// permanently which will move TEI ownership to the selected Organisation Unit. Further
  /// access to the TEI will be based on the ownership organisation unit
  @override
  Future<String> permanentReferral(
      String enrollmentUid,
      String teiUid,
      String programUid,
      String programStage,
      DateTime dueDate,
      String orgUnitUid,
      String activityUid,
      Geometry geometry) {
    // TODO(NMC): implement ownership
    // d2.trackedEntityModule().ownershipManager()
    //     .blockingTransfer(teiUid, programUid, orgUnitUid);
    return scheduleEvent(enrollmentUid, teiUid, programUid, programStage,
        dueDate, orgUnitUid, activityUid, geometry);
  }
}
