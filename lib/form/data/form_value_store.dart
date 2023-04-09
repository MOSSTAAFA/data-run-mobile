import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/maintenance/d2_error.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event_data_value.entity.dart';
import 'package:d2_remote/modules/data/tracker/models/geometry.dart';
import 'package:d2_remote/modules/data/tracker/queries/event_data_value.query.dart';
import 'package:d2_remote/modules/data/tracker/queries/tracked_entity_attribute_value.query.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option_group_option.entity.dart';

import '../../commons/date/entry_mode.dart';
import '../../commons/extensions/event_data_value_query_extension.dart';
import '../../commons/extensions/string_extension.dart';
import '../../commons/extensions/tracked_entity_attribute_value_query_extension.dart';
import '../../commons/extensions/value_extensions.dart';
import '../../commons/helpers/lazy.dart';
import '../../commons/network/network_utils.dart';
import '../../commons/resources/resource_manager.dart';
import '../../core/enrollment/enrollment_object_repository.dart';
import '../model/enrollment_detail.dart';
import '../model/store_result.dart';
import '../model/value_store_result.dart';

class FormValueStore {
  FormValueStore(
      {required this.recordUidFuture,
      required this.entryMode,
      required this.enrollmentRepository,
      // this.crashReportController,
      required this.networkUtils,
      required this.resourceManager});

  // String recordUid;
  Future<String> recordUidFuture;
  late final String recordUid;
  EntryMode entryMode;

  EnrollmentObjectRepository? enrollmentRepository;

  // CrashReportController crashReportController;
  NetworkUtils networkUtils;
  ResourceManager resourceManager;

  Lazy<String> get _loadRecordUid =>
      Lazy(() async => recordUid = await recordUidFuture);

  Future<StoreResult> save(String uid, String? value, String? extraData) async {
    switch (entryMode) {
      case EntryMode.DE:
        return await saveDataElement(uid, value);
      case EntryMode.ATTR:
        return await checkStoreEnrollmentDetail(uid, value, extraData);
      case EntryMode.DV:
        throw Exception(
            resourceManager.getString('R.string.data_values_save_error'));
    }
  }

  Future<StoreResult> checkStoreEnrollmentDetail(
      String uid, String? value, String? extraData) async {
    if (uid == EnrollmentDetail.ENROLLMENT_DATE_UID.name) {
      await enrollmentRepository?.setEnrollmentDate(value?.toDate());

      return StoreResult(
          uid: EnrollmentDetail.ENROLLMENT_DATE_UID.name,
          valueStoreResult: ValueStoreResult.VALUE_CHANGED);
    }
    if (uid == EnrollmentDetail.INCIDENT_DATE_UID.name) {
      await enrollmentRepository?.setIncidentDate(value?.toDate());

      return StoreResult(
          uid: EnrollmentDetail.INCIDENT_DATE_UID.name,
          valueStoreResult: ValueStoreResult.VALUE_CHANGED);
    }
    if (uid == EnrollmentDetail.ORG_UNIT_UID.name) {
      return const StoreResult(
          uid: '', valueStoreResult: ValueStoreResult.VALUE_CHANGED);
    }
    if (uid == EnrollmentDetail.TEI_COORDINATES_UID.name) {
      Geometry? geometry;
      // if(value != null) {
      //   if(extraData != null){
      //     geometry = Geometry.builder()
      //         .coordinates(value)
      //         .type(FeatureType.valueOf(it))
      //         .build();
      //   }
      await saveTeiGeometry(geometry);
      return const StoreResult(
          uid: '', valueStoreResult: ValueStoreResult.VALUE_CHANGED);
    }
    if (uid == EnrollmentDetail.ENROLLMENT_COORDINATES_UID.name) {
      Geometry? geometry;
      // if(value != null) {
      //   if(extraData != null){
      //     geometry = Geometry.builder()
      //         .coordinates(value)
      //         .type(FeatureType.valueOf(it))
      //         .build();
      //   }
      try {
        await saveEnrollmentGeometry(geometry);
        return const StoreResult(
            uid: '', valueStoreResult: ValueStoreResult.VALUE_CHANGED);
      } on D2Error catch (d2Error) {
        String errorMessage = '${d2Error.errorDescription}: $geometry';
        // crashReportController.trackError(d2Error, errorMessage);
        return const StoreResult(
            uid: '', valueStoreResult: ValueStoreResult.ERROR_UPDATING_VALUE);
      }
    }

    return saveAttribute(uid, value);
  }

  Future<void> saveTeiGeometry(Geometry? geometry) async {
    // TODO(NMC): Implement
    // var teiRepository = d2.trackedEntityModule().trackedEntityInstances()
    //     .uid(enrollmentRepository?.blockingGet()?.trackedEntityInstance())
    // teiRepository.setGeometry(geometry);
  }

  Future<void> saveEnrollmentGeometry(Geometry? geometry) async {
    await enrollmentRepository?.setGeometry(geometry);
  }

  Future<StoreResult> saveAttribute(String uid, String? value) async {
    String? teiUid;

    switch (entryMode) {
      case EntryMode.DE:
        await _loadRecordUid();
        final Event event =
            (await D2Remote.trackerModule.event.byId(recordUid).getOne())!;
        Enrollment enrollment = (await D2Remote.trackerModule.enrollment
            .byId(event.enrollment.id)
            .getOne())!;

        teiUid = enrollment.trackedEntityInstance.id;
        break;
      case EntryMode.ATTR:
        await _loadRecordUid();
        teiUid = recordUid;
        break;
      case EntryMode.DV:
        break;
    }

    if (teiUid == null) {
      return StoreResult(
          uid: uid, valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }

    if (!(await checkUniqueFilter(uid, value, teiUid!))) {
      return StoreResult(
          uid: uid, valueStoreResult: ValueStoreResult.VALUE_NOT_UNIQUE);
    }

    final TrackedEntityAttributeValueQuery valueRepository = D2Remote
        .trackerModule.trackedEntityAttributeValue
        .byAttribute(uid)
        .byTrackedEntityInstance(teiUid);

    final ValueType valueType =
        (await D2Remote.programModule.trackedEntityAttribute.byId(uid).getOne())
            ?.valueType
            .toValueType();

    String newValue = value.withValueTypeCheck(valueType) ?? '';

    if (valueType == ValueType.IMAGE && value != null) {
      newValue = await saveFileResource(value);
    }

    String? currentValue;
    if (await valueRepository.blockingExists()) {
      currentValue =
          (await valueRepository.getOne())?.value.withValueTypeCheck(valueType);
    } else {
      currentValue = '';
    }

    if (currentValue != newValue) {
      if (!value.isNullOrEmpty) {
        await valueRepository.blockingSetCheck(uid, newValue,
            (String attrUid, String value) {
          // crashReportController.addBreadCrumb(
          //     'blockingSetCheck Crash',
          //     'Attribute: $attrUid, value: $value'
          // );
        });
      } else {
        await valueRepository.blockingDeleteIfExist();
      }
      return StoreResult(
          uid: uid, valueStoreResult: ValueStoreResult.VALUE_CHANGED);
    } else {
      return StoreResult(
          uid: uid, valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }
  }

  Future<bool> checkUniqueFilter(
      String uid, String? value, String teiUid) async {
    // NMC: TODO
    // if (!networkUtils.isOnline()) {
    //   return isTrackedEntityAttributeValueUnique(uid, value, teiUid);
    // } else {
    //   var programUid = enrollmentRepository?.blockingGet()?.program();
    //   return isUniqueTEIAttributeOnline(uid, value, teiUid, programUid);
    // }
    return true;
  }

  ////////////////////////////////////////////////////////////
/////////////////////////////////////////
  Future<String> saveFileResource(String path) async {
    // TODO(NMC): implement
    // var file = FileResizerHelper.resizeFile(
    //     File(path), FileResizerHelper.Dimension.MEDIUM);
    // return d2.fileResourceModule().fileResources().blockingAdd(file)
    return '';
  }

  Future<StoreResult> saveDataElement(String uid, String? value) async {
    await _loadRecordUid();
    final EventDataValueQuery valueRepository = D2Remote
        .trackerModule.eventDataValue
        .byEvent(recordUid)
        .byDataElement(uid);

    final ValueType? valueType =
        (await D2Remote.dataElementModule.dataElement.byId(uid).getOne())
            ?.valueType
            .toValueType;

    String newValue = value.withValueTypeCheck(valueType) ?? '';
    if (valueType == ValueType.IMAGE && value != null) {
      newValue = await saveFileResource(value);
    }

    final EventDataValue? currentDataValue = await valueRepository.getOne();

    String? currentValue;
    if (currentDataValue != null) {
      currentValue = currentDataValue.value.withValueTypeCheck(valueType);
    } else {
      currentValue = '';
    }

    if (currentValue != newValue) {
      if (!value.isNullOrEmpty) {
        if (await valueRepository.blockingSetCheck(uid, newValue)) {
          return StoreResult(
              uid: uid, valueStoreResult: ValueStoreResult.VALUE_CHANGED);
        } else {
          return StoreResult(
              uid: uid,
              valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
        }
      } else {
        valueRepository.blockingDeleteIfExist();
        return StoreResult(
            uid: uid, valueStoreResult: ValueStoreResult.VALUE_CHANGED);
      }
    } else {
      return StoreResult(
          uid: uid, valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }
  }

  Future<StoreResult> saveWithTypeCheck(String uid, String? value) async {
    final dataElement = await D2Remote.dataElementModule.dataElement.byId(uid);
    if (dataElement != null) {
      return await saveDataElement(uid, value);
    }

    final trackedEntityAttribute =
        await D2Remote.programModule.trackedEntityAttribute.byId(uid);
    if (trackedEntityAttribute != null) {
      return await saveAttribute(uid, value);
    } else {
      return StoreResult(
          uid: uid, valueStoreResult: ValueStoreResult.UID_IS_NOT_DE_OR_ATTR);
    }
  }

  Future<StoreResult> deleteOptionValueIfSelected(
      String field, String optionUid) async {
    switch (entryMode) {
      case EntryMode.DE:
        return await deleteDataElementValue(field, optionUid);
      case EntryMode.ATTR:
        return await deleteAttributeValue(field, optionUid);
      case EntryMode.DV:
        throw ArgumentError(
            resourceManager.getString('R.string.data_values_save_error'));
    }
  }

  Future<StoreResult> deleteDataElementValue(
      String field, String optionUid) async {
    final Option option =
        (await D2Remote.optionModule.option.byId(optionUid).getOne())!;
    List<String> possibleValues = [option.name!, option.code!];
    await _loadRecordUid();
    EventDataValueQuery valueRepository = D2Remote.trackerModule.eventDataValue
        .byEvent(recordUid)
        .byDataElement(field);
    if ((await valueRepository.blockingExists()) &&
        possibleValues.contains((await valueRepository.getOne())?.value)) {
      return await saveDataElement(field, null);
    } else {
      return StoreResult(
          uid: field, valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }
  }

  Future<StoreResult> deleteAttributeValue(
      String field, String optionUid) async {
    final Option option =
        (await D2Remote.optionModule.option.byId(optionUid).getOne())!;
    List<String> possibleValues = [option.name!, option.code!];
    await _loadRecordUid();
    TrackedEntityAttributeValueQuery valueRepository = D2Remote
        .trackerModule.trackedEntityAttributeValue
        .byAttribute(field)
        .byTrackedEntityInstance(recordUid);
    if ((await valueRepository.blockingExists()) &&
        possibleValues.contains((await valueRepository.getOne())?.value)) {
      return await saveAttribute(field, null);
    } else {
      return StoreResult(
          uid: field, valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }
  }

  Future<StoreResult> deleteOptionValueIfSelectedInGroup(
      String field, String optionGroupUid, bool isInGroup) async {
    final List<OptionGroupOption>? optionGroupOptions = (await D2Remote
            .optionModule.optionGroup
            .withOptions()
            .byId(optionGroupUid)
            .getOne())
        ?.options;

    List<String> optionsInGroup = [];

    optionGroupOptions?.map((OptionGroupOption option) async {
      String code = (await D2Remote.optionModule.option.getOne())!.code!;
      optionsInGroup.add(code);
    });

    switch (entryMode) {
      case EntryMode.DE:
        return await deleteDataElementValueIfNotInGroup(
            field, optionsInGroup, isInGroup);
      case EntryMode.ATTR:
        return await deleteAttributeValueIfNotInGroup(
            field, optionsInGroup, isInGroup);
      case EntryMode.DV:
        throw ArgumentError(
            "DataValues can't be saved using these arguments. Use the other one.");
    }
  }

  Future<StoreResult> deleteAttributeValueIfNotInGroup(
      String field, List<String> optionCodesToShow, bool isInGroup) async {
    await _loadRecordUid();
    TrackedEntityAttributeValueQuery valueRepository = D2Remote
        .trackerModule.trackedEntityAttributeValue
        .byAttribute(field)
        .byTrackedEntityInstance(recordUid);
    if ((await valueRepository.blockingExists()) &&
        optionCodesToShow.contains((await valueRepository.getOne())?.value) ==
            isInGroup) {
      return await saveAttribute(field, null);
    } else {
      return StoreResult(
          uid: field, valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }
  }

  Future<StoreResult> deleteDataElementValueIfNotInGroup(
      String field, List<String> optionCodesToShow, bool isInGroup) async {
    await _loadRecordUid();
    EventDataValueQuery valueRepository = D2Remote.trackerModule.eventDataValue
        .byEvent(recordUid)
        .byDataElement(field);
    if ((await valueRepository.blockingExists()) &&
        optionCodesToShow.contains((await valueRepository.getOne())?.value) ==
            isInGroup) {
      return await saveDataElement(field, null);
    } else {
      return StoreResult(
          uid: field, valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }
  }
}
