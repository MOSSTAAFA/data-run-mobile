import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';

class HideBehaviour extends ActionBehaviour {
  HideBehaviour(super.expression);

  @override
  void applyAction(FormElementInstance<dynamic> element) {
    loggerEvaluation.d({
      'Rule Evaluated': 'Element ${element.name}, Action Hide= ${actionIsInEffect(element.evalContext)}',
      'Mark as':
      '${actionIsInEffect(element.evalContext) ? 'Hidden' : 'Visible'}'
    });
    actionIsInEffect(element.evalContext)
        ? element.markAsHidden(emitEvent: false)
        : element.markAsVisible(emitEvent: false);
  }
}
