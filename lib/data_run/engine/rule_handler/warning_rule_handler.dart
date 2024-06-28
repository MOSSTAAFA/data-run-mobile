import 'package:mass_pro/data_run/engine/rule_handler/expression_evaluator_util.dart';
import 'package:mass_pro/data_run/engine/rule_handler/field_rule_handler.dart';
import 'package:mass_pro/data_run/screens/form/form_input_field.model.dart';

class WarningRuleHandler extends FormRuleHandler {
  FormRuleHandler? nextHandler;
  final ExpressionEvaluatorUtil _expressionEvaluatorUtil =
      ExpressionEvaluatorUtil();

  @override
  void handle(FormFieldModel field, List<FormFieldModel> allFields) {
    if (field.fieldRules != null) {
      for (var rule in field.fieldRules!) {
        if (rule.action == 'warning') {
          if (_expressionEvaluatorUtil.evaluate(rule.expression!, allFields)) {
            // Apply the warning logic
            field = field.copyWith(warning: 'Warning message');
          }
        }
      }
    }
    if (nextHandler != null) {
      nextHandler!.handle(field, allFields);
    }
  }
}
