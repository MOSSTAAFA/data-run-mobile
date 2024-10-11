import 'package:logger/web.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/evaluation_engine.dart';

final loggerEvaluation = Logger(
    printer: PrettyPrinter(
        colors: true,
        methodCount: 0,
        printEmojis: false,
        excludeBox: {Level.trace: true, Level.info: true}),
    level: Level.debug);

abstract class ActionBehaviour {
  ActionBehaviour(this.expression);

  final String expression;

  bool actionIsInEffect(Map<String, dynamic> context) {
    final result = evaluationEngine.evaluateExpression(expression, context);
    return result;
  }

  void applyAction(FormElementInstance<dynamic> element,
      {required Map<String, dynamic> evalContext});
}
