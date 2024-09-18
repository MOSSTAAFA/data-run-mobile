import 'package:d2_remote/modules/datarun/form/shared/rule_action.dart';

class EvaluationResult {
  final Action action;
  final dynamic value; // Could be a message, assigned value, etc.

  EvaluationResult({
    required this.action,
    this.value,
  });
}
