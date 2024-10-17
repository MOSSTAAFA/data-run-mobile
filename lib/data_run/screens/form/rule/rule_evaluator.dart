import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';

class RuleEvaluator {
  RuleEvaluator(this.behaviours, {required this.evalContext});

  final List<ActionBehaviour> behaviours;
  final Map<String, dynamic> evalContext;

  void evaluateAndApply(FormElementInstance<dynamic> element) {
    for (var behaviour in behaviours) {
      behaviour.applyAction(element, evalContext: evalContext);
    }
  }
}
