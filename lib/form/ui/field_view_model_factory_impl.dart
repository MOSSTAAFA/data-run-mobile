import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/common/value_type_device_rendering.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';
import 'package:d2_remote/modules/metadata/program/entities/program_tracked_entity_attribute.entity.dart';
import 'package:d2_remote/modules/metadata/program/entities/tracked_entity_attribute.entity.dart';

import '../../commons/extensions/dynamic_extensions.dart';
import '../../commons/extensions/value_extensions.dart';
import '../../commons/extensions/value_type_rendering_extension.dart';
import '../model/field_ui_model.dart';
import '../model/field_ui_model_impl.dart';
import '../model/option_set_configuration.dart';
import '../model/section_ui_model_impl.dart';
import 'event/ui_event_factory_impl.dart';
import 'field_view_model_factory.dart';
import 'provider/display_name_provider.dart';
import 'provider/hint_provider.dart';
import 'provider/keyboard_action_provider.dart';
import 'provider/ui_event_types_provider.dart';
import 'provider/ui_style_provider.dart';

class FieldViewModelFactoryImpl implements FieldViewModelFactory {
  // LegendValueProvider legendValueProvider;

  FieldViewModelFactoryImpl({
    required this.noMandatoryFields,
    required this.uiStyleProvider,

    /// Replaced by WidgetProvider
    // required this.layoutProvider,
    required this.hintProvider,
    required this.displayNameProvider,
    required this.uiEventTypesProvider,
    required this.keyboardActionProvider,
    /*this.legendValueProvider*/
  });

  final bool noMandatoryFields;
  final UiStyleProvider uiStyleProvider;

  /// Replaced by WidgetProvider
  // final LayoutProvider layoutProvider;
  final HintProvider hintProvider;
  final DisplayNameProvider displayNameProvider;
  final UiEventTypesProvider uiEventTypesProvider;
  final KeyboardActionProvider keyboardActionProvider;

  final String _currentSection = '';

  @override
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
      String? description,
      ValueTypeDeviceRendering? fieldRendering,
      String? fieldMask,
      OptionSetConfiguration? optionSetConfiguration,
      FeatureType? featureType}) async {
    bool isMandatory = mandatory;
    isNull(valueType, 'type must be supplied');

    if (noMandatoryFields) isMandatory = false;

    // TODO(NMC): avoid asynchronicity using scopes
    /// see:
    /// https://docs-v2.riverpod.dev/docs/concepts/scopes#initialization-of-synchronous-provider-for-async-apis
    ///
    final String? displayName = await displayNameProvider.provideDisplayName(
        valueType, value, optionSet);

    return FieldUiModelImpl(
        uid: id,
        // layoutId: layoutProvider.getLayoutByType(
        //     valueType,
        //     ValueTypeRenderingType.valueOf(fieldRendering?.type),
        //     optionSet,
        //     renderingType),
        /// NMC added
        sectionRenderingType: renderingType,

        /// NMC added
        fieldRendering: fieldRendering?.type.toValueTypeRenderingType,
        value: value,
        focused: false,
        error: null,
        editable: editable,
        warning: null,
        mandatory: isMandatory,
        label: label,
        programStageSection: programStageSection,
        style: uiStyleProvider.provideStyle(valueType),
        hint: hintProvider.provideDateHint(valueType),
        description: description,
        valueType: valueType,
        // legend: legendValueProvider.provideLegendValue(id, value),
        optionSet: optionSet,
        allowFutureDates: allowFutureDates,
        uiEventFactory: UiEventFactoryImpl(
            uid: id,
            label: label,
            description: description,
            valueType: valueType,
            allowFutureDates: allowFutureDates,
            optionSet: optionSet),
        displayName: displayName,
        renderingType: uiEventTypesProvider.provideUiRenderType(featureType,
            fieldRendering?.type.toValueTypeRenderingType, renderingType),
        optionSetConfiguration: optionSetConfiguration,
        keyboardActionType:
            keyboardActionProvider.provideKeyboardAction(valueType),
        fieldMask: fieldMask);
  }

  @override
  Future<FieldUiModel> createForAttribute(
      {required TrackedEntityAttribute trackedEntityAttribute,
      ProgramTrackedEntityAttribute? programTrackedEntityAttribute,
      String? value,
      required bool editable,
      OptionSetConfiguration? optionSetConfiguration}) async {
    isNull(trackedEntityAttribute.valueType, 'type must be supplied');

    return create(
      id: trackedEntityAttribute.id!,
      // label: trackedEntityAttribute.displayFormName() ?? '',
      label: trackedEntityAttribute.formName ?? '',
      valueType: trackedEntityAttribute.valueType.toValueType!,
      mandatory: programTrackedEntityAttribute?.mandatory ?? false,
      // optionSet: trackedEntityAttribute.optionSet?.uid(),
      optionSet: trackedEntityAttribute.optionSet,
      value: value,
      programStageSection: null,
      allowFutureDates: programTrackedEntityAttribute?.allowFutureDate ?? true,
      editable: editable,
      renderingType: SectionRenderingType.LISTING,
      // description: programTrackedEntityAttribute?.displayDescription()?? trackedEntityAttribute.displayDescription(),
      description: programTrackedEntityAttribute?.description ??
          trackedEntityAttribute.description,
      // fieldRendering: programTrackedEntityAttribute?.renderType()?.mobile(),
      // objectStyle: trackedEntityAttribute.style() ? : ObjectStyle.builder()
      //     .build(),
      fieldMask: trackedEntityAttribute.fieldMask,
      optionSetConfiguration: optionSetConfiguration,
      featureType:
          trackedEntityAttribute.valueType.toValueType == ValueType.COORDINATE
              ? FeatureType.POINT
              : null,
    );
  }

  @override
  FieldUiModel createSingleSection(String singleSectionName) {
    return SectionUiModelImpl(
        uid: SectionUiModelImpl.SINGLE_SECTION_UID,
        // layoutId: layoutProvider.getLayoutForSection(),
        value: null,
        focused: false,
        error: null,
        editable: false,
        warning: null,
        mandatory: false,
        label: singleSectionName,
        programStageSection: null,
        style: null,
        hint: null,
        description: null,
        valueType: null,
        // legend: null,
        optionSet: null,
        allowFutureDates: false,
        uiEventFactory: null,
        displayName: null,
        renderingType: null,
        keyboardActionType: null,
        fieldMask: null,
        isOpen: true,
        totalFields: 0,
        completedFields: 0,
        errors: 0,
        warnings: 0,
        rendering: SectionRenderingType.LISTING.name,
        selectedField: _currentSection);
  }

  @override
  FieldUiModel createSection(
      String sectionUid,
      String? sectionName,
      String? description,
      bool isOpen,
      int totalFields,
      int completedFields,
      String? rendering) {
    return SectionUiModelImpl(
        uid: sectionUid,
        // layoutId: layoutProvider.getLayoutForSection(),
        value: null,
        focused: false,
        error: null,
        editable: false,
        warning: null,
        mandatory: false,
        label: sectionName ?? '',
        programStageSection: sectionUid,
        style: null,
        hint: null,
        description: description,
        valueType: null,
        // legend: null,
        optionSet: null,
        allowFutureDates: false,
        uiEventFactory: null,
        displayName: null,
        renderingType: null,
        keyboardActionType: null,
        fieldMask: null,
        isOpen: isOpen,
        totalFields: totalFields,
        completedFields: completedFields,
        errors: 0,
        warnings: 0,
        rendering: rendering,
        selectedField: _currentSection);
  }

  @override
  FieldUiModel createClosingSection() {
    return SectionUiModelImpl(
        uid: SectionUiModelImpl.CLOSING_SECTION_UID,
        // layoutId: layoutProvider.getLayoutForSection(),
        value: null,
        focused: false,
        error: null,
        editable: false,
        warning: null,
        mandatory: false,
        label: SectionUiModelImpl.CLOSING_SECTION_UID,
        programStageSection: null,
        style: null,
        hint: null,
        description: null,
        valueType: null,
        // legend: null,
        optionSet: null,
        allowFutureDates: false,
        uiEventFactory: null,
        displayName: null,
        renderingType: null,
        keyboardActionType: null,
        fieldMask: null,
        isOpen: false,
        totalFields: 0,
        completedFields: 0,
        errors: 0,
        warnings: 0,
        rendering: SectionRenderingType.LISTING.name,
        selectedField: _currentSection);
  }
}
