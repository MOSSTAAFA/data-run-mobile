// import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
// import 'package:d2_remote/modules/datarun/form/shared/rule_action.dart';
// import 'package:mass_pro/data_run/screens/form/model/form_element_model.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// class FormDependencyManager {
//   final _dependencyMap = <FormElementInstance<dynamic>, List<FormElementInstance<dynamic>>>{};
//
//   void addDependency(FormElementInstance<dynamic> source, FormElementInstance<dynamic> dependent) {
//     _dependencyMap.putIfAbsent(source, () => []).add(dependent);
//   }
//
//   void notifyDependents(FormElementInstance<dynamic> element) {
//     if (_dependencyMap.containsKey(element)) {
//       for (var dependent in _dependencyMap[element]!) {
//         dependent.evaluateRules();
//       }
//     }
//   }
// }
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
//
// abstract class RuleEffect<T> {
//   // Action action;
//   /// rule dependencies
//
//   T apply(FormElementInstance<dynamic> element);
//
//   // bool isVisible(FormElementInstance<dynamic> element) {
//   //   return RuleEngine.evaluateRule(element.id, element.visibilityRule);
//   // }
// }
//
//
// class FormFieldValidityBehavior {
//   List<Validator<dynamic>> validators(FormElementInstance<dynamic> element) {
//
//   }
//   bool isVisible(FormElementInstance<dynamic> element) {
//     return RuleEngine.evaluateRule(element.id, element.visibilityRule);
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
//     return visibilityBehavior.isVisible(this) ? actualFieldWidget : SizedBox.shrink();
//   }
// }