// import 'package:d2_remote/modules/datarun/form/shared/rule_action.dart';
// import 'package:mass_pro/data_run/form/form_model/form_model.dart';
//
// /// An abstract class extended by classes that perform rule evaluation.
// abstract class RuleEvaluator {
//   const RuleEvaluator();
//
//   /// evaluate a rule on the [field].
//   EvaluationResult? evaluate(AbstractFieldModel field);
//
//   EvaluationResult? call(AbstractFieldModel field) {
//     return evaluate(field);
//   }
// }
//
// // Composite evaluator that applies multiple rules
// class CompositeRuleEvaluator extends RuleEvaluator {
//   CompositeRuleEvaluator(this.evaluators);
//
//   final List<RuleEvaluator> evaluators;
//
//   @override
//   EvaluationResult? evaluate(AbstractFieldModel field) {
//     for (var evaluator in evaluators) {
//       final action = evaluator(field);
//       if (action != null) {
//         return action; // or accumulate actions depending on your logic
//       }
//     }
//     return null;
//   }
// }
