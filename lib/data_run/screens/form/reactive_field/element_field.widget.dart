import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mass_pro/data_run/form_state/element_providers.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element_widgets/form_widget_factory.dart';
import 'package:mass_pro/data_run/screens/form/hooks/register_dependencies.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/get_error_widget.dart';

class ElementFieldTypeWidget extends HookWidget {
  const ElementFieldTypeWidget({super.key, required this.element});

  final FormFieldElement<dynamic> element;

  @override
  Widget build(BuildContext context) {
    /// a hook that init some data, listeners
    // final initFieldElement = useRegisterDependencies(element);

    // final selectedField = FieldFactory.fromType(fieldElement: initFieldElement);
    // final selectedField = switch (initFieldElement.type) {
    //   ValueType.Text ||
    //   ValueType.LongText ||
    //   ValueType.Letter ||
    //   ValueType.Email ||
    //   ValueType.FullName =>
    //     QTextTypeField(
    //         key: Key('field_${initFieldElement.pathRecursive}'),
    //               element: initFieldElement
    //         ),
    //   ValueType.Date || ValueType.Time || ValueType.DateTime => QDatePickerField(
    //       key: Key('field_${initFieldElement.pathRecursive}'),
    //               element: initFieldElement
    //       ),
    //   ValueType.Boolean || ValueType.YesNo || ValueType.TrueOnly => QSwitchField(
    //       key: Key('field_${initFieldElement.pathRecursive}'),
    //               element: initFieldElement
    //       ),
    //   ValueType.Integer ||
    //   ValueType.IntegerPositive ||
    //   ValueType.IntegerNegative ||
    //   ValueType.IntegerZeroOrPositive =>
    //     QIntTypeField(
    //         key: Key('field_${initFieldElement.pathRecursive}'),
    //               element: initFieldElement
    //         ),
    //   ValueType.Number || ValueType.Age => QDoubleTypeField(
    //       key: Key('field_${initFieldElement.pathRecursive}'),
    //               element: initFieldElement
    //       ),
    //   ValueType.OrganisationUnit => QOrgUnitPickerField(
    //       key: Key('field_${initFieldElement.pathRecursive}'),
    //               element: initFieldElement
    //       ),
    //   ValueType.SelectOne => QDropDownField(
    //       key: Key('field_${initFieldElement.pathRecursive}'),
    //               element: initFieldElement
    //       ),
    //   ValueType.SelectMulti => QDropDownSearchField(
    //       key: Key('field_${initFieldElement.pathRecursive}'),
    //               element: initFieldElement
    //       ),
    //   _ => Text('Unsupported element type: ${initFieldElement.type}'),
    // };

    return FieldFactory.fromType(fieldElement: element);

    // final field = FieldElementInheritedWidget(
    //     key: ObjectKey(fieldElement),
    //     fieldInstance: fieldElement,
    //     child: selectedField);
    //
    // return FormElementConsumer(
    //     formElement: fieldElement,
    //     builder: (BuildContext context, FieldInstance<dynamic> elementState,
    //         Widget? child) {
    //       // if (elementState.visible) {
    //       //   return SizedBox.shrink();
    //       // } else {
    //       //   return child!;
    //       // }
    //
    //       return Visibility(visible: elementState.visible, child: child!);
    //     },
    //     child: field);
  }
}
