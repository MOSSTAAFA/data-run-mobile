import 'dart:convert';

import 'package:fast_expressions/fast_expressions.dart';

// RegExp phoneRegex = RegExp(r'^\+?[0-9]{1,3}?[-. ]?(\d{1,4})[-. ]?(\d{1,4})[-. ]?(\d{1,9})$');
// final s1 = "regex(x,'^(([0-9]{1})*[- .(]*([0-9]{3})[- .)]*[0-9]{3}[- .]*[0-9]{4})+\$$')";
// final s2 = "regex(.,'^(([0-9]{1})*[- .(]*([0-9]{3})[- .)]*[0-9]{3}[- .]*[0-9]{4})+$')";
// final s3 = "regex(x, '^\\+?[0-9]{1,3}?[-. ]?(\\d{1,4})[-. ]?(\\d{1,4})[-. ]?(\\d{1,9})\$')";
// RegExp(r'^\+?[0-9]{1,3}?[-. ]?(\d{1,4})[-. ]?(\d{1,4})[-. ]?(\d{1,9})$');

void main() {
  // Sample JSON form with a user-friendly regex
  const jsonString = '''
  {
    "expression": "hasMatch(phoneNumber, '^\\\\+?[0-9]{1,3}?[-. ]?(\\\\d{1,4})[-. ]?(\\\\d{1,4})[-. ]?(\\\\d{1,9})\$')"
  }
  ''';

  // Parse JSON
  final formData = jsonDecode(jsonString);

  // Retrieve the expression string
  String userExpression = formData['expression'];

  // Process the regex to escape backslashes
  String processedExpression = escapeRegex(userExpression);

  // Evaluate the expression
  validateField(processedExpression, {
    'phoneNumber': '+123-456-7890',
    'hasMatch': (String x, String regEx) => RegExp(regEx).hasMatch(x),
  });
}

// Function to escape backslashes in regex strings
String escapeRegex(String expression) {
  return expression.replaceAllMapped(RegExp(r"(?<!\\)\\([^\\])"), (match) {
    return '\\\\${match[1]}';
  });
}

// Function to validate a field using the processed expression
void validateField(String expression, Map<String, dynamic> formFields) {
  final r = parseExpression(
    expression,
    context: formFields,
    resolve: (object, member) => formFields[member],
  );

  print(r());  // Evaluate the expression and print the result (true or false)
}

