import 'package:d2_remote/modules/datarun/form/shared/rule/rule.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_action.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_parse_extension.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/assign_behaviour.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/error_behaviour.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/set_mandatory_behaviour.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/show_behaviour.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/unimplemented_action_behaviour.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/hide_behaviour.dart';

class ActionBehaviourFactory {
  static ActionBehaviour createAction(Rule rule) =>
      switch (rule.ruleAction.action) {
        Action.Assign =>
            AssignBehaviour(rule.evalExpression!,
                value: rule.ruleAction.assignedValue),
        Action.Hide => HideBehaviour(rule.evalExpression!),
        Action.Show => ShowBehaviour(rule.evalExpression!),
        Action.Error =>
            ErrorBehaviour(rule.evalExpression!,
                message: rule.ruleAction.message),
        Action.Warning =>
            WarningBehaviour(rule.evalExpression!,
                message: rule.ruleAction.message),
        Action.Mandatory => MarkMandatoryBehaviour(rule.evalExpression!),
        _ => UnimplementedActionBehaviour(rule.evalExpression!)
      };
}
