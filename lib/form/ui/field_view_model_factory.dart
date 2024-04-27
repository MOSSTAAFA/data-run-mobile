import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/common/value_type_device_rendering.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_tracked_entity_attribute.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/tracked_entity_attribute.entity.dart';

import '../model/field_ui_model.dart';
import '../model/option_set_configuration.dart';

abstract class FieldViewModelFactory {
  FieldViewModelFactory();

  Future<FieldUiModel> create(
      {required String id,
      required String label,
      required ValueType valueType,
      required bool mandatory,
      String? optionSet,
      String? value,
      String? programStageSection,
      required bool allowFutureDates,
      required bool editable,
      SectionRenderingType? renderingType,
      required String? description,
      ValueTypeDeviceRendering? fieldRendering,
      // required ObjectStyle objectStyle = ObjectStyle.builder().build(),
      String? fieldMask,
      OptionSetConfiguration? optionSetConfiguration,
      FeatureType? featureType});

  Future<FieldUiModel> createForAttribute(
      {required TrackedEntityAttribute trackedEntityAttribute,
      ProgramTrackedEntityAttribute? programTrackedEntityAttribute,
      String? value,
      required bool editable,
      OptionSetConfiguration? optionSetConfiguration});

  FieldUiModel createSingleSection(String singleSectionName);

  FieldUiModel createSection(
      String sectionUid,
      String? sectionName,
      String? description,
      bool isOpen,
      int totalFields,
      int completedFields,
      String? rendering);

  FieldUiModel createClosingSection();
}
