import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';
import 'package:mass_pro/sdk/core/program/section_rendering_type.dart';

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
      case ValueType.Age:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); */ //layout.form_age_custom
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); */ //layout.form_date_time
      case ValueType.LongText:
        return 0; //FormEditText(); //layout.form_long_text_custom
      case ValueType.OrganisationUnit:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        );*/ //layout.form_org_unit
      case ValueType.Coordinate:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        );*/ //layout.form_coordinate_custom
      case ValueType.Image:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        );*/ //layout.form_picture
      case ValueType.Text:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 /*FormEditText()*/ //layout.form_edit_text_custom
            );
      case ValueType.TrueOnly:
      case ValueType.Boolean:
        switch (renderingType) {
          case ValueTypeRenderingType.HORIZONTAL_RADIOBUTTONS:
          case ValueTypeRenderingType.VERTICAL_RADIOBUTTONS:
          case ValueTypeRenderingType.DEFAULT:
            return 0;
          /*Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            );*/ //layout.form_radio_button
          case ValueTypeRenderingType.TOGGLE:
            switch (valueType) {
              case ValueType.TrueOnly:
                return 0;
              /*Text(
                  '$valueType Field',
                  style: const TextStyle(fontSize: 20),
                );*/ //layout.form_toggle
              default:
                return 0;
              /*Text(
                  '$valueType Field',
                  style: const TextStyle(fontSize: 20),
                );*/ //layout.form_radio_button
            }
          case ValueTypeRenderingType.HORIZONTAL_CHECKBOXES:
          case ValueTypeRenderingType.VERTICAL_CHECKBOXES:
            return 0;
          /*Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            );*/ //layout.form_check_button
          default:
            return 0;
          /*Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            ); */ //layout.form_radio_button
        }
      case ValueType.Letter:
        return 0; //FormEditText(); //layout.form_letter
      case ValueType.PhoneNumber:
        return 0; //FormEditText(); //layout.form_phone_number
      case ValueType.Email:
        return 0; //FormEditText(); //layout.form_email
      case ValueType.Number:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //layout.form_number
            );
      case ValueType.UnitInterval:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //layout.form_unit_interval
            );
      case ValueType.Percentage:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //layout.form_percentage
            );
      case ValueType.Integer:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //layout.form_integer
            );
      case ValueType.IntegerPositive:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //layout.form_integer_positive
            );
      case ValueType.IntegerNegative:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //layout.form_integer_negative
            );
      case ValueType.IntegerZeroOrPositive:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, 0 //layout.form_integer_zero_positive
            );
      case ValueType.URL:
        return 0; //FormEditText(); //layout.form_url
      case ValueType.Reference:
      case ValueType.GeoJson:
      case ValueType.FileResource:
      case ValueType.Username:
      case ValueType.TrackerAssociate:
        return 0;
      /*Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        );*/ //layout.form_unsupported
      default:
        return 0; //FormEditText(); //layout.form_edit_text_custom
    }
  }

  @override
  int getLayoutForSection() {
    return 0; /*const FormCard(
      // isLast: true,
      children: <Widget>[],
    );*/ //layout.form_section;
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
      )*/ //layout.form_option_set_matrix
    } else if (shouldRenderAsSelector(optionSet, renderingType)) {
      return 0; /*const Text(
        'form_option_set_selector',
        style: TextStyle(fontSize: 20),
      );*/ // layout.form_option_set_selector
    } else if (shouldRenderAsSpinner(optionSet)) {
      return 0; /*const Text(
        'form_option_set_spinner',
        style: TextStyle(fontSize: 20),
      );*/ // layout.form_option_set_spinner
    } else if (shouldRenderAsScan(renderingType)) {
      return 0; /*const Text(
        'form_scan',
        style: TextStyle(fontSize: 20),
      );*/ // layout.form_scan
    } else if (shouldRenderAsSelector(optionSet, renderingType)) {
      return 0; /*const Text(
        'form_option_set_selector',
        style: TextStyle(fontSize: 20),
      );*/ // layout.form_option_set_selector
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
