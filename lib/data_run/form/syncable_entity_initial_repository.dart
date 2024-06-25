// ignore_for_file: avoid_dynamic_calls

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/datarun/form/entities/dynamic_form.entity.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/chv_register.entity.dart';
import 'package:d2_remote/modules/datarun/iccm/entities/chv_session.entity.dart';
import 'package:d2_remote/modules/datarun/itns/entities/itns_village.entity.dart';
import 'package:d2_remote/modules/datarun_shared/entities/syncable.entity.dart';
import 'package:d2_remote/modules/datarun_shared/queries/syncable.query.dart';
import 'package:d2_remote/modules/metadatarun/activity/entities/d_activity.entity.dart';
import 'package:d2_remote/modules/metadatarun/teams/entities/d_team.entity.dart';
import 'package:mass_pro/commons/extensions/standard_extensions.dart';
import 'package:mass_pro/data_run/form/syncable_query_mapping_repository.dart';
import 'package:mass_pro/data_run/form/syncable_form_repository.dart';
import 'package:mass_pro/data_run/form/syncable_object_repository.dart';
import 'package:mass_pro/data_run/form/syncable_status.dart';
import 'package:mass_pro/sdk/core/maintenance/d2_error.dart';

class SyncableEntityInitialRepository {
  SyncableEntityInitialRepository(this.ref,
      {required SyncableQueryMappingRepository syncableQueryMappingRepository,
      String? syncableUid})
      : _syncableUid = syncableUid,
        _syncableQueryMappingRepository = syncableQueryMappingRepository;

  final String? _syncableUid;

  final SyncableEntityInitialRepositoryRef ref;

  final SyncableQueryMappingRepository _syncableQueryMappingRepository;

  SyncableQuery getQuery() {
    return _syncableQueryMappingRepository.getEntityQuery();
  }

  SyncableEntity initSyncable(
      String formCode, String activityUid, String teamUid) {
    // fix in Ui When tha main field is
    // location set at adding new entity,
    // now it's the default behaviour
    final locationUidTempTest = 'CawDJJ2iVzj';

    return when<String?, SyncableEntity>(formCode, {
      'CHV_PATIENTS_FORM': () => ChvRegister(
        location: locationUidTempTest,
          activity: activityUid, team: teamUid, status: 'ACTIVE', dirty: true),
      'CHV_SESSIONS_FORM': () => ChvSession(
          activity: activityUid, team: teamUid, status: 'ACTIVE', dirty: true),
      'ITN_DISTRIBUTION_FORM': () => ItnsVillage(
          activity: activityUid, team: teamUid, status: 'ACTIVE', dirty: true),
    }).orElse(() => throw Exception(
        'UnAvailable Entity for Form: ${_syncableQueryMappingRepository.formCode}'));
  }

  Future<SyncableEntity?> syncableObject(String syncableId) async {
    return (await getQuery().byId(syncableId).getOne())!;
  }

  Future<String> createSyncable(
      {required String activityUid,
      required String teamUid,
      DateTime? date,
      String? mainFieldValue,
      Geometry? geometry}) async {

    final DateTime dateTime = date != null
        ? DateTime(date.year, date.month, date.day)
        : DateTime.now();

    final formCode = _syncableQueryMappingRepository.formCode;

    final SyncableEntity syncableToAdd =
        initSyncable(formCode, activityUid, teamUid);

    await getQuery().setData(syncableToAdd).save();

    final SyncableObjectRepository syncableRepository =
        SyncableObjectRepository(syncableToAdd.id!, getQuery());

    await syncableRepository.setStartEntryTime(dateTime);
    final SyncableEntity? syncable = await syncableRepository.getSyncable();

    if (geometry != null) {
      await syncableRepository.setGeometry(geometry);
    }

    return syncable!.id!;
  }

  Future<void> deleteSyncable(String syncableId) async {
    try {
      await getQuery().byId(syncableId).delete();
    } on D2Error catch (d2Error) {
      print('Timber.e($d2Error)');
    }
  }

  Future<bool> isFormOpen() async {
    final SyncableEntity? syncable =
        await getQuery().byId(_syncableUid ?? '').getOne();

    final syncableStatus = SyncableStatusUtil.getEnumValue(syncable?.status);

    return syncable == null || syncableStatus == SyncableStatus.ACTIVE;
  }

  Future<DynamicForm> syncableForm() async {
    final form = await D2Remote.formModule.form
        .byId(_syncableQueryMappingRepository.formCode)
        .getOne();
    return form!;
  }

  Future<DTeam?> syncableTeam() async {
    final SyncableEntity? syncable = await syncableObject(_syncableUid ?? '');

    return D2Remote.teamModuleD.team.byId(syncable?.team ?? '').getOne();
  }

  Future<DActivity?> syncableActivity() async {
    final SyncableEntity? syncable = await syncableObject(_syncableUid ?? '');

    return D2Remote.activityModuleD.activity
        .byId(syncable?.activity ?? '')
        .getOne();
  }

// Future<String> scheduleEvent(
//     String enrollmentUid,
//     String? trackedEntityInstanceUid,
//     String programUid,
//     String programStage,
//     DateTime dueDate,
//     String orgUnitUid,
//     String activityUid,
//     Geometry geometry) async {
//   final DateTime dateTime =
//       DateTime(dueDate.year, dueDate.month, dueDate.day);
//
//   final Event eventToAdd = (EventCreateProjection.builder()
//         ..enrollment = enrollmentUid
//         ..programStage = programStage
//         // ..program = programUid
//         ..activity = activityUid
//         ..organisationUnit = orgUnitUid)
//       .build();
//
//   await D2Remote.trackerModule.event.setData(eventToAdd).save();
//
//   final EventObjectRepository eventRepository =
//       EventObjectRepository(eventToAdd.id!);
//
//   await eventRepository.setDueDate(dateTime);
//   await eventRepository.setStatus(EventStatus.SCHEDULE);
//   final Event? event = await eventRepository.getEvent();
//
//   final FeatureType? featureType = (await D2Remote.programModule.programStage
//           .byId(event!.programStage)
//           .getOne())
//       ?.featureType
//       .toFeatureType;
//
//   if (featureType != null) {
//     switch (featureType) {
//       case FeatureType.POINT:
//       case FeatureType.POLYGON:
//       case FeatureType.MULTI_POLYGON:
//         await eventRepository.setGeometry(geometry);
//         break;
//       default:
//     }
//   }
//   return event.id!;
// }

// Future<ProgramStage?> programStage(String? programUid) async {
//   return programUid?.aLet((it) =>
//       D2Remote.programModule.programStage.byProgram(programUid).getOne());
//   // return D2Remote.programModule.programStage.byProgram(programUid).getOne();
// }

// Future<ProgramStage?> programStageWithId(String? programStageUid) async {
//   return programStageUid
//       ?.aLet((it) => D2Remote.programModule.programStage.byId(it).getOne());
// }

// Future<ProgramStage?> programStageForEvent(String eventId) async {
//   final Event? event =
//       await D2Remote.trackerModule.event.byId(eventId).getOne();
//   if (event != null) {
//     return D2Remote.programModule.programStage
//         .byId(event.programStage)
//         .getOne();
//   }
//   return null;
// }

// Future<bool> accessDataWrite(String programUid) {
//   if (_eventUid != null) {
//     return ref.read(eventServiceProvider).isEditable(_eventUid!);
//   } else {
//     // TODO(NMC): implement DataAccess
//     // return d2.programModule().programStages().uid(stageUid).get().toObservable()
//     //     .map(programStage -> programStage.access().data().write());
//     return Future.value(true);
//   }
// }

// Future<Program?> getProgramWithId(String? programUid) async {
//   return await programUid
//       ?.aLet((it) => D2Remote.programModule.program.byId(it).getOne());
// }

// bool showCompletionPercentage() {
//   // if (d2.settingModule().appearanceSettings().blockingExists()) {
//   //   String programUid = d2.eventModule().events().uid(eventUid).blockingGet().program();
//   //   ProgramConfigurationSetting programConfigurationSetting = d2.settingModule()
//   //       .appearanceSettings()
//   //       .getProgramConfigurationByUid(programUid);
//   //
//   //   if (programConfigurationSetting != null &&
//   //       programConfigurationSetting.completionSpinner() != null) {
//   //     return programConfigurationSetting.completionSpinner();
//   //   }
//   // }
//   return true;
// }

// Future<List<FormSectionViewModel>> eventSections() {
//   return D2Remote.trackerModule.event
//       .byId(_eventUid ?? '')
//       .getOne()
//       .then((eventSingle) async {
//     final List<FormSectionViewModel> formSection = [];
//     if (eventSingle?.deleted == null || eventSingle?.deleted == false) {
//       final ProgramStage? stage = await D2Remote.programModule.programStage
//           .byId(eventSingle?.programStage ?? '')
//           .getOne();
//       final List<ProgramStageSection> stageSections = await D2Remote
//           .programModule.programStageSection
//           .where(attribute: 'programStage', value: stage?.id)
//           .get();
//       if (stageSections.length > 0) {
//         stageSections
//             .sort((one, two) => one.sortOrder.compareTo(two.sortOrder));
//         for (final ProgramStageSection section in stageSections) {
//           formSection.add(FormSectionViewModel.createForSection(
//               _eventUid!,
//               section.id!,
//               section.displayName!,
//               section.renderType != null ? section.renderType : null));
//         }
//       } else {
//         formSection.add(FormSectionViewModel.createForSection(
//             _eventUid!, '', '', SectionRenderingType.LISTING.name));
//       }
//     }
//     return formSection;
//   });
// }

// Future<List<FieldUiModel>> list() {
//   return D2Remote.trackerModule.event
//       .withDataValues()
//       .byId(_eventUid ?? '')
//       .getOne()
//       .then((Event? event) async {
//     final List<FieldUiModel> fields = [];
//     final ProgramStage? stage = await D2Remote.programModule.programStage
//         .byId(event?.programStage)
//         .getOne();
//     final List<ProgramStageSection> sections = await D2Remote
//         .programModule.programStageSection
//         .withDataElements()
//         .byProgramStage(stage?.id ?? '')
//         .get();
//     final List<ProgramStageDataElement> stageDataElements = await D2Remote
//         .programModule.programStageDataElement
//         .byProgramStage(stage?.id ?? '')
//         .get();
//     if (sections.isNotEmpty) {
//       for (final ProgramStageSection stageSection in sections) {
//         for (final ProgramStageDataElement programStageDataElement
//             in stageDataElements) {
//           if (UidsHelper.getUidsList(stageSection.dataElements ?? [])
//               .contains(programStageDataElement.dataElementId)) {
//             final DataElement dataelement = await D2Remote
//                 .dataElementModule.dataElement
//                 .byId(programStageDataElement.dataElementId)
//                 .getOne();
//             fields.add(await _transform(
//                 programStageDataElement,
//                 dataelement,
//                 _searchValueDataElement(programStageDataElement.dataElementId,
//                     event?.dataValues ?? []),
//                 stageSection.id,
//                 event!.status.toEventStatus!));
//           }
//         }
//       }
//     } else {
//       for (final ProgramStageDataElement programStageDataElement
//           in stageDataElements) {
//         final DataElement dataElement = await D2Remote
//             .dataElementModule.dataElement
//             .byId(programStageDataElement.dataElementId)
//             .getOne();
//         fields.add(await _transform(
//             programStageDataElement,
//             dataElement,
//             _searchValueDataElement(programStageDataElement.dataElementId,
//                 event?.dataValues ?? []),
//             null,
//             event!.status.toEventStatus!));
//       }
//     }
//     return fields;
//   });
// }

// Future<FieldUiModel> _transform(
//     ProgramStageDataElement stage,
//     DataElement dataElement,
//     String value,
//     String? programStageSection,
//     EventStatus eventStatus) async {
//   final String uid = dataElement.id!;
//   final String displayName = dataElement.displayName!;
//   final String valueTypeName = dataElement.valueType;
//   final bool mandatory = stage.compulsory ?? false;
//   final String? optionSet = dataElement.optionSet;
//   String? dataValue = value;
//   final List<Option> option = optionSet != null
//       ? await D2Remote.optionModule.option
//           .byOptionSet(optionSet)
//           .where(attribute: 'code', value: dataValue)
//           .get()
//       : [];
//   final bool allowFutureDates = stage.allowFutureDate ?? true;
//   final String? formName = dataElement.displayName;
//   final String? description = dataElement.description;
//
//   OptionSetConfiguration? optionSetConfig;
//   if (optionSet != null) {
//     final List<Option> dataValueOptions = await D2Remote.optionModule.option
//         .byOptionSet(optionSet)
//         .where(attribute: 'code', value: dataValue)
//         .get();
//     if (!dataValueOptions.isEmpty) {
//       dataValue = option[0].displayName;
//     }
//
//     final int optionCount =
//         await D2Remote.optionModule.option.byOptionSet(optionSet).count();
//     final List<Option> options =
//         await D2Remote.optionModule.option.byOptionSet(optionSet).get();
//     optionSetConfig =
//         OptionSetConfiguration.config(optionCount, () => options);
//   }
//
//   // ValueTypeDeviceRendering fieldRendering = stage.renderType == null ? null : stage.renderType().mobile();
//   //
//   // ObjectStyle objectStyle = d2.dataElementModule().dataElements().uid(uid).blockingGet().style();
//
//   return _fieldFactory.create(
//       id: uid,
//       label: formName ?? displayName,
//       valueType: valueTypeName.toValueType!,
//       mandatory: mandatory,
//       optionSet: optionSet,
//       value: dataValue,
//       programStageSection: programStageSection,
//       allowFutureDates: allowFutureDates,
//       editable: eventStatus == EventStatus.ACTIVE,
//       renderingType: null,
//       description: description,
//       fieldRendering: null,
//       // objectStyle:objectStyle,
//       fieldMask: dataElement.fieldMask,
//       optionSetConfiguration: optionSetConfig,
//       featureType: null);
// }

// String _searchValueDataElement(
//     String dataElement, List<EventDataValue> dataValues) {
//   for (final EventDataValue dataValue in dataValues) {
//     if (dataValue.dataElement == dataElement) {
//       return dataValue.value;
//     }
//   }
//
//   return '';
// }

// Future<EventEditableStatus> getEditableStatus() {
//   return ref.read(eventServiceProvider).getEditableStatus(_eventUid ?? '');
// }

  /// Sometimes it might be nessascary to refer a patient to a different Organisation unit. To refer a
  /// TEI:
  /// 1- Open the Tracker Capture app.
  /// 2- Open an existing TEI dashboard.
  /// 3- In the Timeline Data entry or Tabular data entry widget, click the Arrow icon.
  /// 4- Select a Programstage, Organisation unit and set a **Report date**.
  /// 5- Click either One-time referral which will only refer TEI for one single event or Move
  /// permanently which will move TEI ownership to the selected Organisation Unit. Further
  /// access to the TEI will be based on the ownership organisation unit
// Future<String> permanentReferral(
//     String enrollmentUid,
//     String teiUid,
//     String programUid,
//     String programStage,
//     DateTime dueDate,
//     String orgUnitUid,
//     String activityUid,
//     Geometry geometry) {
//   // TODO(NMC): implement ownership
//   // d2.trackedEntityModule().ownershipManager()
//   //     .blockingTransfer(teiUid, programUid, orgUnitUid);
//   return scheduleEvent(enrollmentUid, teiUid, programUid, programStage,
//       dueDate, orgUnitUid, activityUid, geometry);
// }
}
