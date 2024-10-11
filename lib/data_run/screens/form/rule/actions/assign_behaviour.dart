import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';

class AssignBehaviour extends ActionBehaviour {
  AssignBehaviour(super.expression, {required dynamic value}) : _value = value;

  final dynamic _value;

  @override
  void applyAction(FormElementInstance<dynamic> element,
      {required Map<String, dynamic> evalContext}) {
    loggerEvaluation.d({
      'Rule Evaluated':
          'Element ${element.name}, Action Assign= ${actionIsInEffect(evalContext)}',
      '${actionIsInEffect(evalContext) ? 'Assign' : 'reset'}':
          '${element.name} value:  $_value'
    });
    actionIsInEffect(evalContext)
        ? element.reset(value: _value, emitEvent: false)
        : element.reset(value: element.template.defaultValue, emitEvent: false);
  }
}
