import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';

class AssignBehaviour extends ActionBehaviour {
  AssignBehaviour(super.expression, {required dynamic value}) : _value = value;

  final dynamic _value;

  @override
  void applyAction(FormElementInstance<dynamic> element) {
    loggerEvaluation.d({
      'Rule Evaluated':
          'Element ${element.name}, Action Assign= ${actionIsInEffect(element.evalContext)}',
      '${actionIsInEffect(element.evalContext) ? 'Assign' : 'reset'}':
          '${element.name} value:  $_value'
    });
    actionIsInEffect(element.evalContext)
        ? element.updateValue(_value, emitEvent: false)
        : element.reset(value: element.template.defaultValue, emitEvent: false);
  }
}
