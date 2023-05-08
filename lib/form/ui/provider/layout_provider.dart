import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/common/value_type_rendering_type.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';

abstract class LayoutProvider {
  int getLayoutByModel(Type modelClass);

  int getLayoutByType(
      [ValueType? valueType,
        ValueTypeRenderingType? renderingType,
        String? optionSet,
        SectionRenderingType? sectionRenderingType]);

  int getLayoutForSection();
}
