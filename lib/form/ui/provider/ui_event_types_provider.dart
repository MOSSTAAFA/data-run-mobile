import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/common/value_type_rendering_type.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';
import '../../model/Ui_render_type.dart';

abstract class UiEventTypesProvider {
  UiRenderType provideUiRenderType(
      [FeatureType? featureType,
      ValueTypeRenderingType? valueTypeRenderingType,
      SectionRenderingType? sectionRenderingType]);
}
