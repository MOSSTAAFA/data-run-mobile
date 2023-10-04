import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/common/value_type_rendering_type.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';

import '../../model/Ui_render_type.dart';
import 'ui_event_types_provider.dart';

class UiEventTypesProviderImpl implements UiEventTypesProvider {
  const UiEventTypesProviderImpl();

  @override
  UiRenderType provideUiRenderType(
      [FeatureType? featureType,

      /// from the renderType of the item's programStageDataElement,
      /// programStageDataElement.renderType()?.mobile()
      ValueTypeRenderingType? valueTypeRenderingType,

      /// from the renderType of the item's programStageSection,
      /// programStageSection?.renderType()?.mobile()?.type()
      SectionRenderingType? sectionRenderingType]) {
    switch (featureType) {
      case FeatureType.POINT:
        return UiRenderType.POINT;
      case FeatureType.POLYGON:
        return UiRenderType.POLYGON;
      case FeatureType.MULTI_POLYGON:
        return UiRenderType.MULTI_POLYGON;
      default:
    }
    switch (sectionRenderingType) {
      case SectionRenderingType.SEQUENTIAL:
        return UiRenderType.SEQUENCIAL;
      case SectionRenderingType.MATRIX:
        return UiRenderType.MATRIX;
      default:
    }
    switch (valueTypeRenderingType) {
      case ValueTypeRenderingType.VERTICAL_RADIOBUTTONS:
        return UiRenderType.VERTICAL_RADIOBUTTONS;
      case ValueTypeRenderingType.HORIZONTAL_RADIOBUTTONS:
        return UiRenderType.HORIZONTAL_RADIOBUTTONS;
      case ValueTypeRenderingType.VERTICAL_CHECKBOXES:
        return UiRenderType.VERTICAL_CHECKBOXES;
      case ValueTypeRenderingType.HORIZONTAL_CHECKBOXES:
        return UiRenderType.HORIZONTAL_CHECKBOXES;
      case ValueTypeRenderingType.AUTOCOMPLETE:
        return UiRenderType.AUTOCOMPLETE;
      case ValueTypeRenderingType.QR_CODE:
        return UiRenderType.QR_CODE;
      case ValueTypeRenderingType.BAR_CODE:
        return UiRenderType.BAR_CODE;
      default:
    }
    return UiRenderType.DEFAULT;
  }
}
