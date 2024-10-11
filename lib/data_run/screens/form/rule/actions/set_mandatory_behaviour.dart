import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';

class MarkMandatoryBehaviour extends ActionBehaviour {
  MarkMandatoryBehaviour(super.expression);

  @override
  void applyAction(FormElementInstance<dynamic> element,
      {required Map<String, dynamic> evalContext}) {
    loggerEvaluation.d({
      'Rule Evaluated':
          'Action MarkMandatory= ${actionIsInEffect(evalContext)}',
      'mark':
          '${element.name} as ${actionIsInEffect(evalContext) ? 'Mandatory' : 'not Mandatory'}'
    });
    element.toggleMandatory(emitEvent: false);
  }
}
