import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/evaluation_engine.dart';

abstract class ActionBehaviour {
  ActionBehaviour(this.expression);

  final String expression;

  bool actionIsInEffect(Map<String, dynamic> context) {
    final result = evaluationEngine.evaluateExpression(expression, context);
    return result;
  }

  void applyAction(FormElementInstance<dynamic> element);
}
