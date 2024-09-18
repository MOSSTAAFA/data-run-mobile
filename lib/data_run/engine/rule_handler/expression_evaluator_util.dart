// import 'package:expressions/expressions.dart';
// import 'package:mass_pro/data_run/form/form_model/model.dart';
//
// class ExpressionEvaluatorUtil {
//   final ExpressionEvaluator _evaluator = ExpressionEvaluator();
//
//   bool evaluate(String expression, List<QFieldModel> allFields) {
//     final context = _buildContext(allFields);
//     final expressionString = Expression.parse(expression);
//     return _evaluator.eval(expressionString, context);
//   }
//
//   Map<String, dynamic> _buildContext(List<QFieldModel> allFields) {
//     return {for (final field in allFields) field.name: field.name};
//   }
// }
