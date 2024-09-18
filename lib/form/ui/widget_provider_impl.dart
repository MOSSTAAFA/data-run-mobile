import 'package:flutter/material.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';
import 'package:mass_pro/data_run/screens/form_section/model/section_rendering_type.dart';

import 'package:mass_pro/commons/custom_widgets/fields/form_edit_text.widget.dart';
import 'package:mass_pro/commons/custom_widgets/form_card.dart';
import 'package:mass_pro/form/model/field_ui_model.dart';
import 'package:mass_pro/form/ui/provider/widget_provider.dart';

// NMCP added in place of LayoutProviderImpl
// private val layouts = mapOf<KClass<*>, Int>()
@Deprecated('Remove, replaced by ItemWidget')
class WidgetProviderImpl implements WidgetProvider {
  const WidgetProviderImpl();

  @override
  Widget getWidgetByModel(Type modelClass) {
    // TODO: implement getLayoutByModel
    throw UnimplementedError();
  }

  @override
  Widget getWidgetByType(FieldUiModel item) {
    final valueType = item.valueType;
    switch (valueType) {
      case ValueType.Age:
        return FormEditText(item: item);
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return FormEditText(item: item);
      case ValueType.LongText:
        return FormEditText(item: item);
      case ValueType.OrganisationUnit:
        return Text(
          '$valueType Field, value: ${item.value}',
          style: const TextStyle(fontSize: 20),
        );
      case ValueType.Coordinate:
        return Text(
          '$valueType Field, value: ${item.value}',
          style: const TextStyle(fontSize: 20),
        );
      case ValueType.Image:
        return Text(
          '$valueType Field, value: ${item.value}',
          style: const TextStyle(fontSize: 20),
        ); //layout.form_picture
      case ValueType.Text:
        return getLayoutForOptionSet(
            item, FormEditText(item: item) //layout.form_edit_text_custom
            );
      case ValueType.TrueOnly:
      case ValueType.Boolean:
        switch (item.fieldRendering) {
          case ValueTypeRenderingType.HORIZONTAL_RADIOBUTTONS:
          case ValueTypeRenderingType.VERTICAL_RADIOBUTTONS:
          case ValueTypeRenderingType.DEFAULT:
            return Text(
              '$valueType Field, value: ${item.value}',
              style: const TextStyle(fontSize: 20),
            );
          case ValueTypeRenderingType.TOGGLE:
            switch (valueType) {
              case ValueType.TrueOnly:
                return Text(
                  '$valueType Field, value: ${item.value}',
                  style: const TextStyle(fontSize: 20),
                );
              default:
                return Text(
                  '$valueType Field, value: ${item.value}',
                  style: const TextStyle(fontSize: 20),
                );
            }
          case ValueTypeRenderingType.HORIZONTAL_CHECKBOXES:
          case ValueTypeRenderingType.VERTICAL_CHECKBOXES:
            return Text(
              '$valueType Field, value: ${item.value}',
              style: const TextStyle(fontSize: 20),
            );
          default:
            return Text(
              '$valueType Field, value: ${item.value}',
              style: const TextStyle(fontSize: 20),
            );
        }
      case ValueType.Letter:
        return FormEditText(item: item); //layout.form_letter
      case ValueType.PhoneNumber:
        return FormEditText(item: item); //layout.form_phone_number
      case ValueType.Email:
        return FormEditText(item: item); //layout.form_email
      case ValueType.Number:
        return getLayoutForOptionSet(
            item, FormEditText(item: item) //layout.form_number
            );
      case ValueType.UnitInterval:
        return getLayoutForOptionSet(
            item, FormEditText(item: item) //layout.form_unit_interval
            );
      case ValueType.Percentage:
        return getLayoutForOptionSet(
            item, FormEditText(item: item) //layout.form_percentage
            );
      case ValueType.Integer:
        return getLayoutForOptionSet(
            item, FormEditText(item: item) //layout.form_integer
            );
      case ValueType.IntegerPositive:
        return getLayoutForOptionSet(
            item, FormEditText(item: item) //layout.form_integer_positive
            );
      case ValueType.IntegerNegative:
        return getLayoutForOptionSet(
            item, FormEditText(item: item) //layout.form_integer_negative
            );
      case ValueType.IntegerZeroOrPositive:
        return getLayoutForOptionSet(
            item, FormEditText(item: item) //layout.form_integer_zero_positive
            );
      case ValueType.URL:
        return FormEditText(item: item); //layout.form_url
      case ValueType.Reference:
      case ValueType.GeoJson:
      case ValueType.FileResource:
      case ValueType.Username:
      case ValueType.TrackerAssociate:
        return Text(
          '$valueType Field, value: ${item.value}',
          style: const TextStyle(fontSize: 20),
        ); //layout.form_unsupported
      default:
        return FormEditText(item: item); //layout.form_edit_text_custom
    }
  }

  @override
  Widget getWidgetForSection() {
    return const FormCard(
      // isLast: true,
      children: <Widget>[],
    ); //layout.form_section;
  }

  Widget getLayoutForOptionSet(
      FieldUiModel item,
      /*@LayoutRes*/
      Widget defaultLayout) {
    if (shouldRenderAsMatrixImage(
        item.optionSet, item.sectionRenderingType, item.fieldRendering)) {
      return FormEditText(item: item); //layout.form_option_set_matrix
    } else if (shouldRenderAsSelector(item.optionSet, item.fieldRendering)) {
      return FormEditText(
          item:
              item); /*const Text(
        'form_option_set_selector',
        style: TextStyle(fontSize: 20),
      );*/ // layout.form_option_set_selector
    } else if (shouldRenderAsSpinner(item.optionSet)) {
      return FormEditText(
          item:
              item); /*const Text(
        'form_option_set_spinner',
        style: TextStyle(fontSize: 20),
      );*/ // layout.form_option_set_spinner
    } else if (shouldRenderAsScan(item.fieldRendering)) {
      return FormEditText(
          item:
              item); /*const Text(
        'form_scan',
        style: TextStyle(fontSize: 20),
      );*/ // layout.form_scan
    } else if (shouldRenderAsSelector(item.optionSet, item.fieldRendering)) {
      return FormEditText(
          item:
              item); /*const Text(
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
