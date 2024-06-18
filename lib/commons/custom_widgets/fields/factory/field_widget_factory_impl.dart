import 'package:flutter/material.dart';
import 'package:mass_pro/sdk/core/common/value_type.dart';
import 'package:mass_pro/sdk/core/common/value_type_rendering_type.dart';
import 'package:mass_pro/sdk/core/program/section_rendering_type.dart';

import '../../form_card.dart';
import '../form_edit_text.widget.dart';

class FieldWidgetFactoryImpl {
  factory FieldWidgetFactoryImpl() {
    return _singleton;
  }

  FieldWidgetFactoryImpl._internal();

  static final FieldWidgetFactoryImpl _singleton =
      FieldWidgetFactoryImpl._internal();

  Widget createWidgetByModel(Type modelClass) {
    // TODO(NMC): implement getLayoutByModel
    throw UnimplementedError();
  }

  Widget createWidgetByType(
      {Key? key,
      ValueType? valueType,

      ///from the renderType of the item's programStageDataElement,
      ///programStageDataElement.renderType()?.mobile()
      ValueTypeRenderingType? renderingType,
      String? optionSet,

      /// from the renderType of the item's programStageSection,
      /// programStageSection?.renderType()?.mobile()?.type()
      SectionRenderingType? sectionRenderingType}) {
    switch (valueType) {
      case ValueType.Age:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_age_custom
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_date_time
      case ValueType.LongText:
        return const FormEditText(); //R.layout.form_long_text_custom
      case ValueType.OrganisationUnit:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_org_unit
      case ValueType.Coordinate:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_coordinate_custom
      case ValueType.Image:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_picture
      case ValueType.Text:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_edit_text_custom
            );
      case ValueType.TrueOnly:
      case ValueType.Boolean:
        switch (renderingType) {
          case ValueTypeRenderingType.HORIZONTAL_RADIOBUTTONS:
          case ValueTypeRenderingType.VERTICAL_RADIOBUTTONS:
          case ValueTypeRenderingType.DEFAULT:
            return Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            ); //R.layout.form_radio_button
          case ValueTypeRenderingType.TOGGLE:
            switch (valueType) {
              case ValueType.TrueOnly:
                return Text(
                  '$valueType Field',
                  style: const TextStyle(fontSize: 20),
                ); //R.layout.form_toggle
              default:
                return Text(
                  '$valueType Field',
                  style: const TextStyle(fontSize: 20),
                ); //R.layout.form_radio_button
            }
          case ValueTypeRenderingType.HORIZONTAL_CHECKBOXES:
          case ValueTypeRenderingType.VERTICAL_CHECKBOXES:
            return Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            ); //R.layout.form_check_button
          default:
            return Text(
              '$valueType Field',
              style: const TextStyle(fontSize: 20),
            ); //R.layout.form_radio_button
        }
      case ValueType.Letter:
        return const FormEditText(); //R.layout.form_letter
      case ValueType.PhoneNumber:
        return const FormEditText(); //R.layout.form_phone_number
      case ValueType.Email:
        return const FormEditText(); //R.layout.form_email
      case ValueType.Number:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_number
            );
      case ValueType.UnitInterval:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_unit_interval
            );
      case ValueType.Percentage:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_percentage
            );
      case ValueType.Integer:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_integer
            );
      case ValueType.IntegerPositive:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_integer_positive
            );
      case ValueType.IntegerNegative:
        return getLayoutForOptionSet(optionSet, sectionRenderingType,
            renderingType, const FormEditText() //R.layout.form_integer_negative
            );
      case ValueType.IntegerZeroOrPositive:
        return getLayoutForOptionSet(
            optionSet,
            sectionRenderingType,
            renderingType,
            const FormEditText() //R.layout.form_integer_zero_positive
            );
      case ValueType.URL:
        return const FormEditText(); //R.layout.form_url
      case ValueType.Reference:
      case ValueType.GeoJson:
      case ValueType.FileResource:
      case ValueType.Username:
      case ValueType.TrackerAssociate:
        return Text(
          '$valueType Field',
          style: const TextStyle(fontSize: 20),
        ); //R.layout.form_unsupported
      default:
        return const FormEditText(); //R.layout.form_edit_text_custom
    }
  }

  Widget createWidgetForSection() {
    return const FormCard(
      // isLast: true,
      children: <Widget>[],
    ); //R.layout.form_section;
  }

  Widget getLayoutForOptionSet(
      String? optionSet,

      /// from the renderType of the item's programStageSection,
      /// programStageSection?.renderType()?.mobile()?.type()
      SectionRenderingType? sectionRenderingType,

      /// from the renderType of the item's programStageDataElement,
      /// programStageDataElement.renderType()?.mobile()
      ValueTypeRenderingType? renderingType,
      /*@LayoutRes*/ Widget defaultLayout) {
    if (shouldRenderAsMatrixImage(
        optionSet, sectionRenderingType, renderingType)) {
      return const Text(
        'form_option_set_matrix',
        style: TextStyle(fontSize: 20),
      ); //R.layout.form_option_set_matrix
    } else if (shouldRenderAsSelector(optionSet, renderingType)) {
      return const Text(
        'form_option_set_selector',
        style: TextStyle(fontSize: 20),
      ); // R.layout.form_option_set_selector
    } else if (shouldRenderAsSpinner(optionSet)) {
      return const Text(
        'form_option_set_spinner',
        style: TextStyle(fontSize: 20),
      ); // R.layout.form_option_set_spinner
    } else if (shouldRenderAsScan(renderingType)) {
      return const Text(
        'form_scan',
        style: TextStyle(fontSize: 20),
      ); // R.layout.form_scan
    } else if (shouldRenderAsSelector(optionSet, renderingType)) {
      return const Text(
        'form_option_set_selector',
        style: TextStyle(fontSize: 20),
      ); // R.layout.form_option_set_selector
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
