// import 'package:mass_pro/data_run/engine/rule_handler/expression_evaluator_util.dart';
// import 'package:mass_pro/data_run/engine/rule_handler/field_rule_handler.dart';
// import 'package:mass_pro/data_run/form/form_model/form_model.dart';
//
// class ErrorRuleHandler extends FormRuleHandler {
//   FormRuleHandler? nextHandler;
//   final ExpressionEvaluatorUtil _expressionEvaluatorUtil =
//       ExpressionEvaluatorUtil();
//
//   @override
//   void handle(QFieldModel field, List<QFieldModel> allFields) {
//     if (field.rules != null) {
//       for (var rule in field.rules!) {
//         if (rule.action == 'error') {
//           if (_expressionEvaluatorUtil.evaluate(rule.expression!, allFields)) {
//             // Apply the error logic
//             field = field.setError('Error message');
//           }
//         }
//       }
//     }
//     if (nextHandler != null) {
//       nextHandler!.handle(field, allFields);
//     }
//   }
// }
