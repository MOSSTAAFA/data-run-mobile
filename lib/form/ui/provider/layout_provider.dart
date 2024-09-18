import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';
import 'package:mass_pro/data_run/screens/form_section/model/section_rendering_type.dart';

@Deprecated('replaced by WidgetProvider')
abstract class LayoutProvider {
  int getLayoutByModel(Type modelClass);

  int getLayoutByType(
      [ValueType? valueType,

      /// from the renderType of the item's programStageDataElement,
      /// programStageDataElement.renderType()?.mobile()
      ValueTypeRenderingType? renderingType,
      String? optionSet,

      /// from the renderType of the item's programStageSection,
      /// programStageSection?.renderType()?.mobile()?.type()
      SectionRenderingType? sectionRenderingType]);

  int getLayoutForSection();
}
