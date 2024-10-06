import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/rule/actions/action_behaviour.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';

class ErrorBehaviour extends ActionBehaviour {
  ErrorBehaviour(super.expression, {Map<String, String> message = const {}}) {
    _message.clear();
    _message.addAll(message);
  }

  final Map<String, String> _message = {};

  @override
  void applyAction(FormElementInstance<dynamic> element) {
    logDebug(
        info:
            'apply ErrorBehaviour, make: ${element.name} ${actionIsInEffect(element.evalContext) ? '${getItemLocalString(_message)}' : ' Resetting ErrorBehaviour'} ');
    actionIsInEffect(element.evalContext)
        ? element.setErrors({
            getItemLocalString(_message, defaultString: 'error')!:
                getItemLocalString(_message, defaultString: 'error')
          }, markAsDirty: false)
        : element
            .removeError(getItemLocalString(_message, defaultString: 'error')!);
  }
}

class WarningBehaviour extends ActionBehaviour {
  WarningBehaviour(super.expression, {Map<String, String> message = const {}}) {
    _message.clear();
    _message.addAll(message);
  }

  final Map<String, String> _message = {};

  @override
  void applyAction(FormElementInstance<dynamic> element) =>
      actionIsInEffect(element.evalContext)
          ? element.setWarning({
              getItemLocalString(_message, defaultString: 'warning')!:
                  getItemLocalString(_message, defaultString: 'warning')
            }, markAsDirty: false)
          : element.removeWarning(
              getItemLocalString(_message, defaultString: 'warning')!);
}
