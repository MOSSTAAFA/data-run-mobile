import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';
class RuleEvaluator {
  RuleEvaluator(this.behaviours);

  final List<ActionBehaviour> behaviours;

  void evaluateAndApply(FormElementInstance<dynamic> element) {
    for (var behaviour in element.actionBehaviours) {
      behaviour.applyAction(element);
    }
  }
}
