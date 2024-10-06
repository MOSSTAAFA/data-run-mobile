import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';

class MarkMandatoryBehaviour extends ActionBehaviour {
  MarkMandatoryBehaviour(super.expression);

  @override
  void applyAction(FormElementInstance<dynamic> element) {
    loggerEvaluation.d({
      'Rule Evaluated': 'Action MarkMandatory= ${actionIsInEffect(element.evalContext)}',
      'mark':
          '${element.name} as ${actionIsInEffect(element.evalContext) ? 'Mandatory' : 'not Mandatory'}'
    });
    element.toggleMandatory(emitEvent: false);
  }
}
