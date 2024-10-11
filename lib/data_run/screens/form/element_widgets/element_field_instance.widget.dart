// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:mass_pro/commons/logging/logging.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:mass_pro/data_run/screens/form/element_widgets/form_widget_factory.dart';
//
// /// [ElementFieldInstance] the one that reacts to the initialized
// /// state in [ElementField] parent from which it inherits its element model
// /// initialization happen of state happen in [ElementField]
// class ElementFieldInstanceWidget extends HookWidget {
//   ElementFieldInstanceWidget({super.key, required this.fieldInstance});
//
//   final FieldInstance<dynamic> fieldInstance;
//
//   @override
//   Widget build(BuildContext context) {
//     // final element = FieldElementInheritedWidget.of(context);
//     // /// visibility
//     // if (element.hidden) {
//     //   return SizedBox.shrink();
//     // }
//
//     logDebug('ElementFieldInstanceWidget build(): ${fieldInstance.name}');
//
//     /// a factory method that create widget based on element type
//     /// element type section/repeatSection/field
//     /// section and repeat section widgets might call
//     /// this recursively to create their fields
//     return FieldFactory.fromType(type: fieldInstance.type);
//   }
// }
//
// // final field = switch(element.type) {
// //    ValueType.Text ||
// //    ValueType.LongText||
// //    ValueType.Letter||
// //    ValueType.Email||
// //    ValueType.FullName=>
// //      const QTextTypeField(),
// //    ValueType.Date||
// //    ValueType.Time||
// //    ValueType.DateTime=>
// //    const QDatePickerField(),
// //    ValueType.Boolean||
// //    ValueType.YesNo||
// //    ValueType.TrueOnly=>
// //    const QSwitchField(),
// //    ValueType.Integer||
// //    ValueType.IntegerPositive||
// //    ValueType.IntegerNegative||
// //    ValueType.IntegerZeroOrPositive=>
// //    const QIntTypeField(),
// //    ValueType.Number||
// //    ValueType.Age=>
// //    const  QDoubleTypeField(),
// //    ValueType.OrganisationUnit=>
// //    const  QOrgUnitPickerField(/*element=> element*/),
// //
// //    ValueType.SelectOne=>
// //    const  QDropDownField(),
// //    ValueType.SelectMulti=>
// //    const  QDropDownSearchField(),
// //   _=>
// //      Text('Unsupported element type: ${element.type}'),
// // };
