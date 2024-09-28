import 'package:expressions/expressions.dart';

class Evaluator3 {
  final evaluator = ExpressionEvaluator();

  dynamic evaluateExpression(String ex, EvaluationContext context) {
    try {

      Expression expression = Expression.parse(ex);
      var result = evaluator.eval(expression, context.values);

      return result;
    } catch (e) {
      // Handle evaluation errors (e.g., invalid expression, missing variables)
      print("Error evaluating expression: $e");
      return null;
    }
  }
}

class EvaluationContext {
  final Map<String, dynamic> values = {};

  void updateValue(String fieldName, dynamic newValue) {
    values[fieldName] = newValue;
  }
}