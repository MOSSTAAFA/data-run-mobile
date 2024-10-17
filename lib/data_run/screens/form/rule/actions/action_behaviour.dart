import 'package:d2_remote/modules/datarun/form/shared/rule/action.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_parse_extension.dart';
import 'package:logger/web.dart';
import 'package:mass_pro/data_run/screens/form/rule/evaluation_engine.dart';

final loggerEvaluation = Logger(
    printer: PrettyPrinter(
        colors: true,
        methodCount: 0,
        printEmojis: false,
        excludeBox: {Level.trace: true, Level.info: true}),
    level: Level.debug);

abstract class ActionBehaviour {
  ActionBehaviour(this.ruleAction);

  final RuleAction ruleAction;

  List<String> get dependencies => ruleAction.dependencies;

  bool isInEffect(Map<String, dynamic> evalContext) {
    final result =
        evaluationEngine.evaluateExpression(ruleAction.expression, evalContext);
    return result;
  }

//
// void applyAction(FormElementInstance<dynamic> element,
//     {required Map<String, dynamic> evalContext});
}
