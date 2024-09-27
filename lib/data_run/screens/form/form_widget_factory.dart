import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/fields/q_date_picker.widget.dart';
import 'package:mass_pro/data_run/screens/form/fields/q_double_type_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/fields/q_drop_down_search_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/fields/q_int_type_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/fields/q_ou_picker.dart';
import 'package:mass_pro/data_run/screens/form/fields/q_switch_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/model/form_element_model.dart';
import 'package:mass_pro/data_run/screens/form/field.widget.dart';
import 'package:mass_pro/data_run/screens/form/fields/q_drop_down_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/fields/q_text_type_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/inherited_widget.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

/// Factory that instantiate form input fields based on a dynamic element tree
class FormElementWidgetFactory {
  static Widget createWidget(FormElementInstance<dynamic> element) {
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
