import 'package:d2_remote/modules/datarun/form/shared/rule_action.dart';

class EvaluationResult {
  // Could be a message, assigned value, etc.

  EvaluationResult({
    required this.action,
    this.value,
  });

  final Action action;
  final dynamic value;
}
