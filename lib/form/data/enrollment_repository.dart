// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:d2_remote/core/arch/helpers/uids_helper.dart';
import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/enrollment.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/tracked-entity.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/tracked_entity_attribute_value.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_section.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_section_attribute.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_tracked_entity_attribute.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/tracked_entity_attribute.entity.dart';
import 'package:d2_remote/shared/utilities/sort_order.util.dart';
import 'package:flutter/foundation.dart';

import '../../commons/extensions/string_extension.dart';
import '../../commons/extensions/value_extensions.dart';
import '../model/enrollment_mode.dart';
import '../model/field_ui_model.dart';
import '../model/option_set_configuration.dart';
import '../ui/field_view_model_factory.dart';
import '../ui/provider/enrollment_form_labels_provider.dart';
import 'data_entry_base_repository.dart';

class EnrollmentRepository extends DataEntryBaseRepository {
  static const String ENROLLMENT_DATA_SECTION_UID =
      'ENROLLMENT_DATA_SECTION_UID';
  static const String ENROLLMENT_DATE_UID = 'ENROLLMENT_DATE_UID';
  static const String INCIDENT_DATE_UID = 'INCIDENT_DATE_UID';
  static const String ORG_UNIT_UID = 'ORG_UNIT_UID';
  static const String TEI_COORDINATES_UID = 'TEI_COORDINATES_UID';
  static const String ENROLLMENT_COORDINATES_UID = 'ENROLLMENT_COORDINATES_UID';

  final String enrollmentUid;

  final EnrollmentMode enrollmentMode;
  final EnrollmentFormLabelsProvider enrollmentFormLabelsProvider;
  Future<Enrollment?>? _enrollment;
  Future<Program?>? _program;
  Future<List<ProgramSection>>? _programSections;

  // TODO(NMC): avoid asynchronicity using scopes
  /// see:
  /// https://docs-v2.riverpod.dev/docs/concepts/scopes#initialization-of-synchronous-provider-for-async-apis
  ///
  EnrollmentRepository(
      {required FieldViewModelFactory fieldFactory,
      required this.enrollmentUid,
      required this.enrollmentMode,
      required this.enrollmentFormLabelsProvider})
      : super(fieldFactory) {
    _enrollment =
        D2Remote.trackerModule.enrollment.byId(enrollmentUid).getOne();

    _program = _enrollment!.then((enrollment) =>
        D2Remote.programModule.program.byId(enrollment!.program).getOne());

    _programSections = _program!.then((program) => D2Remote
        .programModule.programSection
        .byProgram(program!.id!)
        .withAttributes()
        .get());
  }

  @override
  bool isEvent() {
    return false;
  }

  @override
  Future<List<FieldUiModel>> list() async {
    final Program program = (await _program)!;

    final List<ProgramSection> programSections = await D2Remote
        .programModule.programSection
        .byProgram(program.id!)
        .withAttributes()
        .get();

    List<FieldUiModel> list = [];

    if (programSections.isEmpty) {
      final List<FieldUiModel> singleSectionList =
          await _getFieldsForSingleSection();
      list = await _getSingleSectionList();
      list.addAll(singleSectionList);
    } else {
      list = await _getFieldsForMultipleSections();
    }

    final fields = await _getEnrollmentData(program);
    fields.addAll(list);
    fields.add(fieldFactory.createClosingSection());
    return fields;
  }

  @override
  Future<List<String>> sectionUids() async {
    const List<String> sectionUids = [ENROLLMENT_DATA_SECTION_UID];
    final List<ProgramSection> sections = (await _programSections)!;
    sectionUids.addAll(sections.map((section) => section.id!).toList());
    // TODO(NMC): re-visit the throw
    return sectionUids;
    // throw sectionUids;
  }

  Future<List<FieldUiModel>> _getEnrollmentData(Program program) async {
    return [];
  }

  Future<List<FieldUiModel>> _getFieldsForMultipleSections() async {
    final List<FieldUiModel> fields = [];
    final Program program = (await _program)!;
    final List<ProgramSection> programSections = (await _programSections)!;

    for (final ProgramSection section in programSections) {
      fields.add(transformSection(
          sectionUid: section.id!,
          sectionName: section.displayName,
          sectionDescription: section.description));
      await Future.forEach<ProgramSectionAttribute>(section.attributes ?? [],
          (attribute) async {
        final programTrackedEntityAttribute = await D2Remote
            .programModule.programTrackedEntityAttribute
            .byProgram(program.id!)
            .byTrackedEntityAttribute(attribute.id!)
            .getOne();
        if (programTrackedEntityAttribute != null) {
          fields.add(await _transform(programTrackedEntityAttribute,
              sectionUid: section.id!));
        }
      });
    }
    return fields;
  }

  Future<List<FieldUiModel>> _getSingleSectionList() async {
    final Enrollment? enrollment = await _enrollment;

    final TrackedEntityInstance? tei = await D2Remote
        .trackerModule.trackedEntityInstance
        .byId(enrollment!.trackedEntityInstance)
        .getOne();

    final teiType = tei!.trackedEntityType;

    final List<FieldUiModel> fields = [
      fieldFactory.createSingleSection(enrollmentFormLabelsProvider
          .provideSingleSectionLabel
          .format(['$teiType-teiType.displayName']))
    ];

    return fields;
  }

  Future<List<FieldUiModel>> _getFieldsForSingleSection() async {
    final program =
        await D2Remote.trackerModule.enrollment.byId(enrollmentUid).getOne();

    final List<ProgramTrackedEntityAttribute> programAttributes = await D2Remote
        .programModule.programTrackedEntityAttribute
        .byProgram(program.id!)
        .orderBy(attribute: 'sortOrder', order: SortOrder.ASC)
        .get();
    final pp = programAttributes.map((programTrackedEntityAttribute) async {
      return _transform(programTrackedEntityAttribute);
    }).toList();
    final ff = Future.wait(pp).catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    });
    return ff;
  }

  Future<FieldUiModel> _transform(
      ProgramTrackedEntityAttribute programTrackedEntityAttribute,
      {String sectionUid = 'SINGLE_SECTION_UID'}) async {
    final TrackedEntityAttribute? attribute = await D2Remote
        .programModule.trackedEntityAttribute
        .byId(programTrackedEntityAttribute.attribute)
        .getOne();

    final Enrollment? enrollment = await _enrollment;

    final valueType = ValueType.valueOf(attribute?.valueType);
    final mandatory = programTrackedEntityAttribute.mandatory;
    final optionSet = attribute?.optionSet;
    // var generated = attribute.generated()!!;

    final orgUnitUid = enrollment!.orgUnit;
    final activityUid = enrollment.activity;

    final TrackedEntityAttributeValue? attrValue = await D2Remote
        .trackerModule.trackedEntityAttributeValue
        .byId('${enrollment.trackedEntityInstance}_${attribute?.id}');
    String? dataValue = await _getAttributeValue(attrValue);

    OptionSetConfiguration? optionSetConfig;
    if (!optionSet.isNullOrEmpty) {
      final int optionCount =
          await D2Remote.optionModule.option.byOptionSet(optionSet!).count();
      final List<Option> options =
          await D2Remote.optionModule.option.byOptionSet(optionSet).get();
      optionSetConfig = OptionSetConfiguration.config(optionCount, () {
        return options;
      });
    }

    String? warning;

    // if (generated && dataValue == null) {
    //   mandatory = true;
    //   // var result = handleAutogeneratedValue(attribute, orgUnitUid!!)
    //   dataValue = result.first;
    //   warning = result.second;
    //   if (!dataValue.isNullOrEmpty) {
    //     attrValueRepository.blockingSet(dataValue)
    //   }
    // }

    // var conflict = conflicts
    //     .find { it.trackedEntityAttribute() == attribute.uid() }

    String? error; // = _getError(conflict, dataValue);

    if ((valueType == ValueType.ORGANISATION_UNIT ||
            valueType?.isDate == true) &&
        !dataValue.isNullOrEmpty) {
      dataValue = attrValue?.value;
    }

    ProgramSection? programSection;
    final List<ProgramSection>? programSections = await _programSections;
    for (final section in programSections!) {
      if (UidsHelper.getUidsList(section.attributes!)
          .contains('${section.id}_${attribute?.id}')) {
        programSection = section;
        break;
      }
    }

    final SectionRenderingType? renderingType =
        _getSectionRenderingType(programSection);

    final FieldUiModel fieldViewModel = await fieldFactory.create(
        id: attribute!.id!,
        label: attribute.displayName ?? '',
        valueType: valueType!,
        mandatory: mandatory,
        optionSet: optionSet,
        value: dataValue,
        programStageSection: sectionUid,
        allowFutureDates:
            programTrackedEntityAttribute.allowFutureDate ?? false,
        editable: true,
        // isEditable(generated),
        renderingType: renderingType,
        description: attribute.description,
        fieldRendering: null,
        //programTrackedEntityAttribute.renderType()?.mobile(),
        // attribute.style(),
        fieldMask: attribute.fieldMask,
        optionSetConfiguration: optionSetConfig,
        featureType:
            valueType == ValueType.COORDINATE ? FeatureType.POINT : null);

    if (!error.isNullOrEmpty) {
      return fieldViewModel.setError(error);
    } else if (warning != null) {
      return fieldViewModel.setWarning(warning);
    } else {
      return fieldViewModel;
    }
  }

  Future<String?> _getAttributeValue(TrackedEntityAttributeValue? attrValue) {
    if (attrValue != null) {
      return attrValue.userFriendlyValue();
    } else {
      return Future.value();
    }
  }

  SectionRenderingType? _getSectionRenderingType(
      ProgramSection? programSection) {
    return SectionRenderingType.valueOf(programSection?.renderType);
  }

// String? _getError(TrackerImportConflict? conflict, String? dataValue) {
//   if (conflict != null) {
//     if (conflict.value == dataValue) {
//       return conflict.displayDescription;
//     }
//   }
//   return null;
// }
}
