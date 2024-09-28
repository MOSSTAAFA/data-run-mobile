import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule_parse_extension.dart';

List<String> dependenciesList(Pattern pattern, String expression) {
  return pattern
      .allMatches(expression)
      .map((match) => match.group(1)!)
      .toSet()
      .toList();
}

String removePlaceholders(Pattern pattern, String expression) {
    return expression.replaceAllMapped(
        pattern, (match) => match.group(1)!);
}

List<String?> extractDependencies(String expression) {
  final regex = RegExp(r'#{(\w+)}|\d+|\"(.*?)\"');
  final matches = regex.allMatches(expression);
  return matches.map((match) => match.group(1) ?? match.group(0)).toList();
}

void main() {
  // Example expression
  String expression = "#{transaction} == 'supply' || #{transaction} == 'dispense' || #{item} == 'return'";
  String expression2 = "#{list.length} == 'supply' || #{transaction} == 'dispense' || #{item} == 'return'";
  String expression3 = "regionFilter == 'return'";


  // Parse the dependencies
  List<String?> dependencies = extractDependencies(expression3);

  final fieldPattern1 = RegExp(r'#\{(.*?)\}');
  // final fieldPattern2 = RegExp(r'#\{(\w+)\}');
  // final fieldPattern3 = RegExp(r'#\{([\w\.]+)\}');

  final result11 = dependenciesList(fieldPattern1, expression2);
  // final result12 = dependenciesList(fieldPattern2, expression2);
  // final result13 = dependenciesList(fieldPattern3, expression2);

  final repPattern1 = RegExp(r'#\{(.*?)\}');
  // final repPattern2 = RegExp(r'#\{(\w+)\}');
  // final repPattern3 = RegExp(r'#\{([\w\.]+)\}');

  final repResult1 = removePlaceholders(repPattern1, expression2);
  // final repResult2 = removePlaceholders(repPattern2, expression2);
  // final repResult3 = removePlaceholders(repPattern3, expression2);


  String leftSideConditionForEvaluation = expression2
      .replaceAll('#{', '')
      .replaceAll('}', '');
  // Output the result
  // print(dependencies);  // Output: [transaction, item]
}
//
// void main() {
//   final List<Map<String, dynamic>> samples = formSample;
//   final List<FieldTemplate> templates = [];
//
//   final Map<String, List<String>> dep = {};
//   for (final sample in samples) {
//     final FieldTemplate field = FieldTemplate.fromJson(sample);
//     dep[field.name] = field.dependencies;
//     templates.add(field);
//   }
//
// }