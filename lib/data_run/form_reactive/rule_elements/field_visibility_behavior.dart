// import 'package:d2_remote/modules/datarun/form/shared/rule/rule.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class VisibilityRule extends Rule {
//   final List<FormElementInstance<dynamic>> _dependencies = [];
//   final bool Function(dynamic value) condition;
//
//   VisibilityRule({required this.dependency, required this.condition});
//
//   void apply(FormElementInstance<dynamic> element) {
//     if (condition(dependency.value)) {
//       element.show();
//     } else {
//       element.hide();
//     }
//   }
// }
// // class RuleAction {
// //   Value,
// //   Error
// //
// // }
// /// rule evaluation context deps ['field1', 'field2']
// abstract class FieldRule<T> {
//   // Action action;
//   /// rule dependencies
//
//   bool isInEffect(FormElementInstance<dynamic> element);
//
// // bool isVisible(FormElementInstance<dynamic> element) {
// //   return RuleEngine.evaluateRule(element.id, element.visibilityRule);
// // }
// }
//
// class FieldValidityAction {
//   List<Validator<dynamic>> validators(FormElementInstance<dynamic> element) {}
//
//   bool isVisible(FormElementInstance<dynamic> element) {
//     return RuleEngine.evaluateRule(element.name, element.visibilityRule);
//   }
// }
//
// class FormFieldVisibilityBehavior {
//   bool isVisible(FormElementInstance<dynamic> element) {
//     return RuleEngine.evaluateRule(element.id, element.visibilityRule);
//   }
// }
//
// class FormField {
//   final FormFieldVisibilityBehavior visibilityBehavior;
//   final FormFieldValidationBehavior validationBehavior;
//
//   Widget build() {
//     return visibilityBehavior.isVisible(this)
//         ? actualFieldWidget
//         : SizedBox.shrink();
//   }
// }
