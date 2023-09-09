import 'package:d2_remote/core/arch/helpers/uids_helper.dart';
import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/common/value_type_device_rendering.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/data/tracker/entities/event.entity.dart';
import 'package:d2_remote/modules/data/tracker/entities/event_data_value.entity.dart';
import 'package:d2_remote/modules/data/tracker/queries/event_data_value.query.dart';
import 'package:d2_remote/modules/metadata/data_element/entities/data_element.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage_data_element.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage_section.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_stage_section_data_element.entity.dart';
import 'package:d2_remote/shared/utilities/sort_order.util.dart';

import '../../commons/extensions/string_extension.dart';
import '../../commons/extensions/value_extensions.dart';
import '../model/field_ui_model.dart';
import '../model/option_set_configuration.dart';
import '../ui/field_view_model_factory.dart';
import 'data_entry_base_repository.dart';

// TODO(NMC): avoid asynchronicity using scopes
/// see:
/// https://docs-v2.riverpod.dev/docs/concepts/scopes#initialization-of-synchronous-provider-for-async-apis
///
class EventRepository extends DataEntryBaseRepository {
  EventRepository({
    required FieldViewModelFactory fieldFactory,
    required this.eventUid,
  }) : super(fieldFactory) {
    _event = D2Remote.trackerModule.event.byId(eventUid ?? '').getOne();
    _programStageSections = _event!.then((event) => D2Remote
        .programModule.programStageSection
        .withDataElements()
        .byProgramStage(event!.programStage)
        .get());

    _sectionMap = _programStageSections.then((sections) =>
        {for (ProgramStageSection section in sections) section.id!: section});
  }

  final String? eventUid;

  Future<Event?>? _event;
  Future<List<ProgramStageSection>> _programStageSections =
      Future.value(<ProgramStageSection>[]);
  Future<Map<String, ProgramStageSection>> _sectionMap = Future.value({});

  @override
  bool isEvent() {
    return true;
  }

  @override
  Future<List<FieldUiModel>> list() async {
    final List<ProgramStageSection> programStageSections =
        await _programStageSections;
    List<FieldUiModel> list = [];
    if (programStageSections.isEmpty) {
      list = await _getFieldsForSingleSection();
    } else {
      list = await _getFieldsForMultipleSections();
    }
    list.add(fieldFactory.createClosingSection());
    return list;
  }

  @override
  Future<List<String>> sectionUids() async {
    return (await _sectionMap).keys.toList();
  }

  Future<List<FieldUiModel>> _getFieldsForMultipleSections() async {
    final Event event = (await _event)!;
    final List<FieldUiModel> fields = [];
    final sectionMap = await _sectionMap;
    for (final programStageSection in sectionMap.values) {
      fields.add(transformSection(
          sectionUid: programStageSection.id!,
          sectionName: programStageSection.displayName));
      await Future.forEach<ProgramStageSectionDataElement>(
          programStageSection.dataElements ?? [], (dataElement) async {
        final programStageDataElement = await D2Remote
            .programModule.programStageDataElement
            .byProgramStage(event.programStage)
            .byDataElement(dataElement.dataElement)
            .getOne();
        if (programStageDataElement != null) {
          fields.add(await _transform(programStageDataElement));
        }
      });
    }
    return fields;
  }

  Future<List<FieldUiModel>> _getFieldsForSingleSection() async {
    final Event event = (await _event)!;

    final ProgramStage programStage = (await D2Remote.programModule.programStage
        .byId(event.programStage)
        .getOne())!;

    final List<ProgramStageDataElement> stageDataElements = await D2Remote
        .programModule.programStageDataElement
        .byProgramStage(programStage.id!)
        .withOptions()
        .orderBy(attribute: 'sortOrder', order: SortOrder.ASC)
        .get();

    final pp = stageDataElements.map((stageDataElement) {
      return _transform(stageDataElement);
    }).toList();
    final ff = Future.wait(
            pp) /* .catchError((onError) {
      if (kDebugMode) {
        print(onError);
      }
    }) */
        ;
    return ff;
  }

  /// transform Section Entity to [FieldUiModelImpl] for the UI
  Future<FieldUiModel> _transform(
      ProgramStageDataElement programStageDataElement) async {
    final DataElement de = await D2Remote.dataElementModule.dataElement
        .byId(programStageDataElement.dataElementId)
        .getOne();

    final EventDataValueQuery valueRepository = D2Remote
        .trackerModule.eventDataValue
        .byEvent(eventUid!)
        .byDataElement(de.id!);

    ProgramStageSection? programStageSection;
    final sectionMapValues = (await _sectionMap).values;
    for (final section in sectionMapValues) {
      if (UidsHelper.getUidsList/*<ProgramStageSectionDataElement>*/(
              section.dataElements ?? [])
          .contains('${section.id}_${de.id}')) {
        programStageSection = section;
        break;
      }
    }

    final String uid = de.id!;
    final String displayName = de.displayName!;
    final ValueType? valueType = ValueType.valueOf(de.valueType);
    final bool mandatory = programStageDataElement.compulsory ?? false;
    final String optionSet = de.optionSet ?? '';
    final EventDataValue? eventDataValue = await valueRepository.getOne();
    String? dataValue = eventDataValue?.value;

    final String? friendlyValue = await eventDataValue.userFriendlyValue();

    final bool allowFutureDates =
        programStageDataElement.allowFutureDate ?? false;
    final String? formName = de.formName;
    final String? description = de.description;

    OptionSetConfiguration? optionSetConfig;
    if (!optionSet.isNullOrEmpty) {
      final Option? option = await D2Remote.optionModule.option
          .byOptionSet(optionSet)
          .where(attribute: 'code', value: dataValue)
          .getOne();

      if (!dataValue.isNullOrEmpty && option != null) {
        dataValue = option.displayName;
      }
      final int optionCount =
          await D2Remote.optionModule.option.byOptionSet(optionSet).count();
      final List<Option> options = await D2Remote.optionModule.option
          .byOptionSet(optionSet)
          .orderBy(attribute: 'sortOrder', order: SortOrder.ASC)
          .get();
      optionSetConfig = OptionSetConfiguration.config(optionCount, () {
        return options;
      });
    }

    ValueTypeDeviceRendering?
        fieldRendering; // = _getValueTypeDeviceRendering(programStageDataElement);
    // var objectStyle = getObjectStyle(de);
    final String error = ''; //checkConflicts(de.uid(), dataValue);
    final isOrgUnit = valueType == ValueType.ORGANISATION_UNIT;

    final isDate = valueType != null && valueType.isDate;

    if (!isOrgUnit && !isDate) {
      dataValue = friendlyValue;
    }
    final renderingType = _getSectionRenderingType(programStageSection);
    final featureType = _getFeatureType(valueType);

    final fieldViewModel = await fieldFactory.create(
        id: uid,
        label: formName ?? displayName,
        valueType: valueType!,
        mandatory: mandatory,
        optionSet: optionSet,
        value: dataValue,
        programStageSection: programStageSection?.id,
        allowFutureDates: allowFutureDates,
        editable: true,
        //isEventEditable(),
        renderingType: renderingType,
        description: description,
        fieldRendering: fieldRendering,
        // objectStyle,
        fieldMask: null,
        //de.fieldMask,
        optionSetConfiguration: optionSetConfig,
        featureType: featureType);

    if (error.isNotEmpty) {
      return fieldViewModel.setError(error);
    } else {
      return fieldViewModel;
    }
  }

  SectionRenderingType? _getSectionRenderingType(
      ProgramStageSection? programStageSection) {
    return SectionRenderingType.valueOf(programStageSection?.renderType);
  }

  FeatureType? _getFeatureType(ValueType? valueType) {
    if (valueType == ValueType.COORDINATE) {
      return FeatureType.POINT;
    }
    return null;
  }

  ValueTypeDeviceRendering? _getValueTypeDeviceRendering(
      ProgramStageDataElement programStageDataElement) {
    // if (programStageDataElement.renderType != null) programStageDataElement.renderType()!!
    //     .mobile() else null
    return null;
  }
}
