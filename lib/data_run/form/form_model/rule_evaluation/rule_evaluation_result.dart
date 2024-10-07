import 'package:d2_remote/modules/datarun/form/shared/rule/rule_action.dart';

class EvaluationResult {
  // Could be a message, assigned value, etc.

  EvaluationResult({
    required this.action,
    this.value,
  });

  final ActionType action;
  final dynamic value;
}
