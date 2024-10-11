import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';

class ShowBehaviour extends ActionBehaviour {
  ShowBehaviour(super.expression);

  @override
  void applyAction(FormElementInstance<dynamic> element,
      {required Map<String, dynamic> evalContext}) {
    loggerEvaluation.d({
      'Rule Evaluated':
          'Element: ${element.name}, Action Show= ${actionIsInEffect(evalContext)}',
      'Mark':
          'As ${actionIsInEffect(evalContext) ? 'Visible' : 'Hidden'}'
    });
    actionIsInEffect(evalContext)
        ? element.markAsVisible(emitEvent: false)
        : element.markAsHidden(emitEvent: false);
  }
}
