import 'package:mass_pro/data_run/engine/rule_handler/expression_evaluator_util.dart';
import 'package:mass_pro/data_run/engine/rule_handler/field_rule_handler.dart';
import 'package:mass_pro/data_run/screens/form/fields_widgets/q_field.model.dart';

class ErrorRuleHandler extends FormRuleHandler {
  FormRuleHandler? nextHandler;
  final ExpressionEvaluatorUtil _expressionEvaluatorUtil =
      ExpressionEvaluatorUtil();

  @override
  void handle(QFieldModel field, List<QFieldModel> allFields) {
    if (field.fieldRules != null) {
      for (var rule in field.fieldRules!) {
        if (rule.action == 'error') {
          if (_expressionEvaluatorUtil.evaluate(rule.expression!, allFields)) {
            // Apply the error logic
            field = field.copyWith(error: 'Error message');
          }
        }
      }
    }
    if (nextHandler != null) {
      nextHandler!.handle(field, allFields);
    }
  }
}
