import 'package:mass_pro/data_run/engine/rule_handler/expression_evaluator_util.dart';
import 'package:mass_pro/data_run/engine/rule_handler/field_rule_handler.dart';
import 'package:mass_pro/data_run/screens/form/model/q_field.model.dart';

class WarningRuleHandler extends FormRuleHandler {
  FormRuleHandler? nextHandler;
  final ExpressionEvaluatorUtil _expressionEvaluatorUtil =
      ExpressionEvaluatorUtil();

  @override
  void handle(QFieldModel field, List<QFieldModel> allFields) {
    if (field.fieldRules != null) {
      for (var rule in field.fieldRules!) {
        if (rule.action == 'warning') {
          if (_expressionEvaluatorUtil.evaluate(rule.expression!, allFields)) {
            // Apply the warning logic
            field = field.setWarning('Warning message');
          }
        }
      }
    }
    if (nextHandler != null) {
      nextHandler!.handle(field, allFields);
    }
  }
}
