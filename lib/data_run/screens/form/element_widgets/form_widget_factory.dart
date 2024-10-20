import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/section_element.widget.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/q_date_picker.widget.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/q_drop_down_search_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/q_ou_picker.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/q_switch_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/field.widget.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/q_drop_down_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/field_widgets/q_text_type_field.widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

/// Factory that instantiate form input fields based on a dynamic element tree
class FormElementWidgetFactory {
  static Widget createWidget(FormElementInstance<dynamic> element) {
    // if (element.hidden) {
    //   return SizedBox.shrink();
    // }

    return switch (element) {
      /// [FieldWidget] is a leaf in the tr
      FieldInstance() => FieldWidget(element: element),

      /// a [SectionWidget] with other widgets inside which also call this factory to build the tree recursively until it reaches the leaf which is a [FieldWidget]
      SectionElement() => SectionElementWidget(element: element),
    };
  }
}

/// a Factory that is called by the [FieldWidget] to create the input widget based on ValueType of element
class FieldFactory {
  static Widget fromType<T>({required FieldInstance<T> element}) {
    switch (element.type) {
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.Email:
      case ValueType.FullName:
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
      case ValueType.Number:
      case ValueType.Age:
        return QTextTypeField(element: element);
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return QDatePickerField(element: element);
      case ValueType.Boolean:
      case ValueType.YesNo:
      case ValueType.TrueOnly:
        return QSwitchField(element: element as FieldInstance<bool>);
      // return QDoubleTypeField(element: element as FieldInstance<String>);
      case ValueType.OrganisationUnit:
        return QOrgUnitPickerField(element: element as FieldInstance<String>);

      case ValueType.SelectOne:
        return QDropDownField(element: element as FieldInstance<String>);
      case ValueType.SelectMulti:
        return QDropDownSearchField(
            element: element as FieldInstance<List<String>>);
      default:
        return Text('Unsupported element type: ${element.type}');
    }
  }
}
