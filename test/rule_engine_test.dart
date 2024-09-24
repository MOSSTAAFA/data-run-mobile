
import 'package:fast_expressions/fast_expressions.dart';

// RegExp phoneRegex = RegExp(r'^\+?[0-9]{1,3}?[-. ]?(\d{1,4})[-. ]?(\d{1,4})[-. ]?(\d{1,9})$');
// final s1 = "regex(x,'^(([0-9]{1})*[- .(]*([0-9]{3})[- .)]*[0-9]{3}[- .]*[0-9]{4})+\$$')";
// final s2 = "regex(.,'^(([0-9]{1})*[- .(]*([0-9]{3})[- .)]*[0-9]{3}[- .]*[0-9]{4})+$')";
// final s3 = "regex(x, '^\\+?[0-9]{1,3}?[-. ]?(\\d{1,4})[-. ]?(\\d{1,4})[-. ]?(\\d{1,9})\$')";
// RegExp(r'^\+?[0-9]{1,3}?[-. ]?(\d{1,4})[-. ]?(\d{1,4})[-. ]?(\d{1,9})$');

dynamic validateField(String expression, Map<String, dynamic> formFields) {

  final r = parseExpression(
    expression,
    context: formFields,
    resolve: (object, member) => formFields[member],
  );

  return r();  // Evaluate the expression and print the result (true or false)
}

void main() {
  final expression = 'regex(x, pattern)';
  final formFieldsContext = {
    'pattern': '^\\+?[0-9]{1,3}?[-. ]?(\\d{1,4})[-. ]?(\\d{1,4})[-. ]?(\\d{1,9})\$',
    'x': 'f123-456-7890',
    'regex': (String x, String pattern) => RegExp(pattern).hasMatch(x)
  };

  // final formFields = {
  //   'x': '+123-456-7890',
  //   'regex': (String x, String pattern) => RegExp(pattern).hasMatch(x),
  // };

  // Parsing the expression
  final parsedExpression = parseExpression(
    expression,
    context: formFieldsContext,
  );

  // Evaluating the expression
  final result = parsedExpression();

  // print(result); // Outputs: true

  // const expression = "regex(x, r'^\+?[0-9]{1,3}?[-. ]?(\d{1,4})[-. ]?(\d{1,4})[-. ]?(\d{1,9})\$')";

  // final r = validateField(expression, formFields);
  // debugPrint(r);
}
