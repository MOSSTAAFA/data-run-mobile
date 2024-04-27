import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/common/value_type_rendering_type.dart';
import 'package:d2_remote/core/program/section_rendering_type.dart';

import 'provider/layout_provider.dart';

// NMCP maybe inject
// private val layouts = mapOf<KClass<*>, Int>()
@Deprecated('replaced by WidgetProviderImpl')
class LayoutProviderImpl implements LayoutProvider {
  const LayoutProviderImpl();

  @override
  int getLayoutByModel(Type modelClass) {
    // TODO: implement getLayoutByModel
    throw UnimplementedError();
  }

  @override
  int getLayoutByType(
      [ValueType? valueType,

      ///from the renderType of the item's programStageDataElement,
      ///programStageDataElement.renderType()?.mobile()
      ValueTypeRenderingType? renderingType,
      String? optionSet,

      /// from the renderType of the item's programStageSection,
      /// programStageSection?.renderType()?.mobile()?.type()
      SectionRenderingType? sectionRenderingType]) {
    switch (valueType) {
      case ValueType.AGE:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); */ //R.layout.form_age_custom
      case ValueType.DATE:
      case ValueType.TIME:
      case ValueType.DATETIME:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); */ //R.layout.form_date_time
      case ValueType.LONG_TEXT:
        return 0; //FormEditText(); //R.layout.form_long_text_custom
      case ValueType.ORGANISATION_UNIT:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        );*/ //R.layout.form_org_unit
      case ValueType.COORDINATE:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        );*/ //R.layout.form_coordinate_custom
      case ValueType.IMAGE:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        );*/ //R.layout.form_picture
      case ValueType.TEXT:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 /*FormEditText()*/ //R.layout.form_edit_text_custom
            );
      case ValueType.TRUE_ONLY:
      case ValueType.BOOLEAN:
        switch (renderingType) {
          case ValueTypeRenderingType.HORIZONTAL_RADIOBUTTONS:
          case ValueTypeRenderingType.VERTICAL_RADIOBUTTONS:
          case ValueTypeRenderingType.DEFAULT:
            return 0;
          /*Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            );*/ //R.layout.form_radio_button
          case ValueTypeRenderingType.TOGGLE:
            switch (valueType) {
              case ValueType.TRUE_ONLY:
                return 0;
              /*Text(
                  '$valueType Field',
                  style: const TextStyle(fontSize: 20),
                );*/ //R.layout.form_toggle
              default:
                return 0;
              /*Text(
                  '$valueType Field',
                  style: const TextStyle(fontSize: 20),
                );*/ //R.layout.form_radio_button
            }
          case ValueTypeRenderingType.HORIZONTAL_CHECKBOXES:
          case ValueTypeRenderingType.VERTICAL_CHECKBOXES:
            return 0;
          /*Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            );*/ //R.layout.form_check_button
          default:
            return 0;
          /*Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            ); */ //R.layout.form_radio_button
        }
      case ValueType.LETTER:
        return 0; //FormEditText(); //R.layout.form_letter
      case ValueType.PHONE_NUMBER:
        return 0; //FormEditText(); //R.layout.form_phone_number
      case ValueType.EMAIL:
        return 0; //FormEditText(); //R.layout.form_email
      case ValueType.NUMBER:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //R.layout.form_number
            );
      case ValueType.UNIT_INTERVAL:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //R.layout.form_unit_interval
            );
      case ValueType.PERCENTAGE:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //R.layout.form_percentage
            );
      case ValueType.INTEGER:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //R.layout.form_integer
            );
      case ValueType.INTEGER_POSITIVE:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //R.layout.form_integer_positive
            );
      case ValueType.INTEGER_NEGATIVE:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //R.layout.form_integer_negative
            );
      case ValueType.INTEGER_ZERO_OR_POSITIVE:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //R.layout.form_integer_zero_positive
            );
      case ValueType.URL:
        return 0; //FormEditText(); //R.layout.form_url
      case ValueType.REFERENCE:
      case ValueType.GEOJSON:
      case ValueType.FILE_RESOURCE:
      case ValueType.USERNAME:
      case ValueType.TRACKER_ASSOCIATE:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        );*/ //R.layout.form_unsupported
      default:
        return 0; //FormEditText(); //R.layout.form_edit_text_custom
    }
  }

  @override
  int getLayoutForSection() {
    return 0; /*const FormCard(
      // isLast: true,
      children: <Widget>[],
    );*/ //R.layout.form_section;
  }

  int getLayoutForOptionSet(
      String? optionSet,

      /// from the renderType of the item's programStageSection,
      /// programStageSection?.renderType()?.mobile()?.type()
      SectionRenderingType? sectionRenderingType,

      /// from the renderType of the item's programStageDataElement,
      /// programStageDataElement.renderType()?.mobile()
      ValueTypeRenderingType? renderingType,
      /*@LayoutRes*/ int defaultLayout) {
    if (shouldRenderAsMatrixImage(
        optionSet, sectionRenderingType, renderingType)) {
      return 0; /*const Text(
        'form_option_set_matrix',
        style: TextStyle(fontSize: 20),
      )*/ //R.layout.form_option_set_matrix
    } else if (shouldRenderAsSelector(optionSet, renderingType)) {
      return 0; /*const Text(
        'form_option_set_selector',
        style: TextStyle(fontSize: 20),
      );*/ // R.layout.form_option_set_selector
    } else if (shouldRenderAsSpinner(optionSet)) {
      return 0; /*const Text(
        'form_option_set_spinner',
        style: TextStyle(fontSize: 20),
      );*/ // R.layout.form_option_set_spinner
    } else if (shouldRenderAsScan(renderingType)) {
      return 0; /*const Text(
        'form_scan',
        style: TextStyle(fontSize: 20),
      );*/ // R.layout.form_scan
    } else if (shouldRenderAsSelector(optionSet, renderingType)) {
      return 0; /*const Text(
        'form_option_set_selector',
        style: TextStyle(fontSize: 20),
      );*/ // R.layout.form_option_set_selector
    } else {
      return defaultLayout;
    }
  }

  bool shouldRenderAsScan(ValueTypeRenderingType? renderingType) {
    switch (renderingType) {
      case ValueTypeRenderingType.QR_CODE:
      case ValueTypeRenderingType.BAR_CODE:
        return true;
      default:
        return false;
    }
  }

  bool shouldRenderAsSpinner(String? optionSet) {
    return optionSet != null;
  }

  bool shouldRenderAsSelector(
      String? optionSet, ValueTypeRenderingType? renderingType) {
    bool isOptionSet = optionSet != null;
    bool isSelectorRendering = false;
    switch (renderingType) {
      case ValueTypeRenderingType.HORIZONTAL_RADIOBUTTONS:
      case ValueTypeRenderingType.VERTICAL_RADIOBUTTONS:
      case ValueTypeRenderingType.HORIZONTAL_CHECKBOXES:
      case ValueTypeRenderingType.VERTICAL_CHECKBOXES:
        isSelectorRendering = true;
        break;
      default:
        isSelectorRendering = false;
    }
    return isOptionSet && isSelectorRendering;
  }

  bool shouldRenderAsMatrixImage(
      String? optionSet,

      /// from the renderType of the item's programStageSection,
      /// programStageSection?.renderType()?.mobile()?.type()
      SectionRenderingType? sectionRenderingType,

      /// from the renderType of the item's programStageDataElement,
      /// programStageDataElement.renderType()?.mobile()
      ValueTypeRenderingType? renderingType) {
    final bool isOptionSet = optionSet != null;
    final bool isDefaultRendering = renderingType == null ||
        renderingType == ValueTypeRenderingType.DEFAULT;
    final bool isSectionRenderingMatrix =
        (sectionRenderingType ?? SectionRenderingType.LISTING) !=
            SectionRenderingType.LISTING;
    return isOptionSet && isDefaultRendering && isSectionRenderingMatrix;
  }
}
