import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/q_date_picker.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/q_double_type_field.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/q_drop_down_search_field.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/q_int_type_field.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/q_ou_picker.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/q_switch_field.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form_reactive/field.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/q_drop_down_field.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/fields/q_text_type_field.widget.dart';
import 'package:mass_pro/data_run/screens/form_reactive/inherited_widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class FormElementWidgetFactory {
  static Widget createWidget(FormElementInstance<dynamic> element) {
    return switch (element) {
      FieldInstance() => FieldWidget(element: element),
      SectionElement() => SectionElementWidget(element: element),
    };
  }
}

class FieldFactory {
  static Widget fromType({required FieldInstance<dynamic> element}) {
    switch (element.type) {
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.Email:
      case ValueType.FullName:
        return QTextTypeField(element: element);
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return QDatePickerField(element: element);
      case ValueType.Boolean:
      case ValueType.YesNo:
      case ValueType.TrueOnly:
        return QSwitchField(element: element);
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return QIntTypeField(element: element);
      case ValueType.Number:
      case ValueType.Age:
        return QDoubleTypeField(element: element);
      case ValueType.OrganisationUnit:
        return QOrgUnitPickerField(element: element);

      case ValueType.SelectOne:
        return QDropDownField(element: element as FieldInstance<String?>);
      case ValueType.SelectMulti:
        return QDropDownSearchField(element: element);
      default:
        return Text('Unsupported element type: ${element.type}');
    }
  }
}
