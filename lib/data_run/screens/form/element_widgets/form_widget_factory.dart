import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/element_section.widget.dart';
import 'package:mass_pro/data_run/screens/form/form_field/q_int_type_field.widget.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/field_widgets.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

/// Factory containing a static method that instantiate form fields recursively based on a dynamic element tree
class FormElementWidgetFactory {
  static Widget createWidget(FormElementInstance<dynamic> element) {
    return switch (element) {
      /// [FieldWidget] is a leaf in the tr
      FieldInstance() => ElementFieldTypeWidget(
          key: Key('field_${element.pathRecursive}'), element: element),

      /// a [SectionWidget] with other widgets inside,
      /// which also call this factory to build the tree
      /// recursively until it reaches the leaf which is a [FieldWidget]
      SectionElement() => ElementSectionWidget(
          key: Key('SectionElement_${element.pathRecursive}'),
          sectionElement: element),
      // RepeatInstance() => ElementSectionWidget(key: Key(element.pathRecursive), sectionElement: element)
    };
  }
}

/// a Factory that is called by the [ElementFieldTypeWidget] to
/// create the input widget based on ValueType of element
/// each QField is a Form Widget which
/// would call element using context from parent [FieldInstanceInheritedWidget]
class FieldFactory {
  static Widget fromType({required FieldInstance<dynamic> fieldElement}) {
    switch (fieldElement.type) {
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.Email:
      case ValueType.FullName:
        return QReactiveTextField<String>(
          key: Key(fieldElement.pathRecursive),
          element: fieldElement as FieldInstance<String>,
        );
      case ValueType.Date:
      case ValueType.Time:
      case ValueType.DateTime:
        return QReactiveDatePickerField(
          key: Key(fieldElement.pathRecursive),
          element: fieldElement as FieldInstance<String>,
        );
      case ValueType.Boolean:
      case ValueType.YesNo:
      case ValueType.TrueOnly:
        return QReactiveSwitchField(
          key: Key(fieldElement.pathRecursive),
          element: fieldElement as FieldInstance<bool>,
        );
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return QReactiveTextField<int>(
          key: Key(fieldElement.pathRecursive),
          element: fieldElement as FieldInstance<int>,
        );
      // return QReactiveIntTypeField(
      //   key: Key(fieldElement.pathRecursive),
      //   element: fieldElement as FieldInstance<int>,
      // );
      case ValueType.Number:
      case ValueType.Age:
        return QReactiveTextField<double>(
          key: Key(fieldElement.pathRecursive),
          element: fieldElement as FieldInstance<double>,
        );
      // return QReactiveDoubleTypeField(
      //   key: Key(fieldElement.pathRecursive),
      //   element: fieldElement as FieldInstance<double>,
      // );
      case ValueType.OrganisationUnit:
        return QReactiveOrgUnitPickerField(
          key: Key(fieldElement.pathRecursive),
          element: fieldElement,
        );

      case ValueType.SelectOne:
        return QReactiveSingleSelect(
          key: Key(fieldElement.pathRecursive),
          element: fieldElement as FieldInstance<String>,
        );
      case ValueType.SelectMulti:
        return QReactiveMultiSelect(
          key: Key(fieldElement.pathRecursive),
          element: fieldElement as FieldInstance<List<String>>,
        );
      default:
        return const Text('Unsupported element type');
    }
  }
}
