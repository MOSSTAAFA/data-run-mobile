// import 'package:d2_remote/modules/datarun/form/shared/rule/action.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
// import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';
//
// class AssignBehaviour extends ActionBehaviour {
//   AssignBehaviour(super.ruleAction)
//       : _value = value;
//
//   final dynamic _value;
//
//   @override
//   void applyAction(FormElementInstance<dynamic> element,
//       {required Map<String, dynamic> evalContext}) {
//     loggerEvaluation.d({
//       'Rule Evaluated':
//           'Element ${element.name}, Action Assign= ${isInEffect(evalContext)}',
//       '${isInEffect(evalContext) ? 'Assign' : 'reset'}':
//           '${element.name} value:  $_value'
//     });
//     isInEffect(evalContext)
//         ? element.reset(value: _value, emitEvent: false)
//         : element.reset(value: element.template.defaultValue, emitEvent: false);
//   }
// }
