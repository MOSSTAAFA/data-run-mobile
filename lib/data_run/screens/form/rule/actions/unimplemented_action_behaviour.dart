import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';

class UnimplementedActionBehaviour extends ActionBehaviour {
  UnimplementedActionBehaviour(super.expression);

  @override
  void applyAction(FormElementInstance<dynamic> element) =>
      logError(error: 'UnImplemented Rule Action Behaviour');
}
