import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:mass_pro/data_run/engine/rule_handler/expression_evaluator_util.dart';
import 'package:mass_pro/data_run/engine/rule_handler/field_rule_handler.dart';
import 'package:mass_pro/data_run/screens/form/form_input_field.model.dart';

class VisibilityRuleHandler extends FormRuleHandler {
  FormRuleHandler? nextHandler;
  final ExpressionEvaluatorUtil _expressionEvaluatorUtil = ExpressionEvaluatorUtil();

  @override
  void handle(FormFieldModel field, List<FormFieldModel> allFields) {
    if (field.fieldRules != null) {
      for (var rule in field.fieldRules!) {
        if (rule.action == 'hide') {
          if (_expressionEvaluatorUtil.evaluate(rule.expression!, allFields)) {
            // Apply the visibility logic
            field = field.copyWith(isVisible: false);
          }
        }
      }
    }
    if (nextHandler != null) {
      nextHandler!.handle(field, allFields);
    }
  }
}
