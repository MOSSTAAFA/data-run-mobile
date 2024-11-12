import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/action.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_action.dart';
import 'package:datarun/commons/logging/logging.dart';
import 'package:datarun/data_run/screens/form/element/form_element.dart';
import 'package:datarun/core/utils/get_item_local_string.dart';

extension RuleHandler on FieldTemplate {
  Iterable<RuleAction> ruleActions() {
    return rules.map((rule) => rule.ruleAction);
  }
}

extension ApplyAction on RuleAction {
  void apply(FormElementInstance<dynamic> element) {
    switch (action) {
      case ActionType.Visibility:
        if (element.hidden) {
          logDebug(
              info: '${element.name}, applying action: ${ActionType.Show}');
          element.markAsVisible();
        } else {
          logDebug(
              info: '${element.name}, applying action: ${ActionType.Hide}');
          element.markAsHidden();
        }
        break;
      case ActionType.Show:
        logDebug(info: '${element.name}, applying action: ${ActionType.Show}');
        element.markAsVisible();
        break;
      case ActionType.Hide:
        logDebug(info: '${element.name}, applying action: ${ActionType.Hide}');
        element.markAsHidden();
        break;
      case ActionType.Error:
        final currentElementErrors = {...element.elementControl!.errors};
        currentElementErrors[getItemLocalString(message.unlockView)] =
            getItemLocalString(message.unlockView);
        element.setErrors(currentElementErrors);
        break;
      case ActionType.Mandatory:
        element.markAsMandatory();
        break;
      case ActionType.Assign:
        element.updateValue(assignedValue);
        break;
      case ActionType.Filter:
      case ActionType.StopRepeat:
      case ActionType.Warning:
      case ActionType.Count:
      case ActionType.Unknown:
        // TODO NOT Implemented
        break;
    }
  }

  void reset(FormElementInstance<dynamic> element) {
    switch (action) {
      case ActionType.Visibility:
        if (element.hidden) {
          element.markAsVisible();
        } else {
          logDebug(
              info: '${element.name}, resetting action to: ${ActionType.Hide}');
          element.markAsHidden();
        }
        break;
      case ActionType.Show:
        logDebug(
            info: '${element.name}, resetting action to: ${ActionType.Hide}');
        element.markAsHidden();
        break;
      case ActionType.Hide:
        logDebug(
            info: '${element.name}, resetting action to: ${ActionType.Show}');
        element.markAsVisible();
        break;
      case ActionType.Error:
        element.removeError(getItemLocalString(message.unlockView));
        break;
      case ActionType.Mandatory:
        element.markAsMandatory();
        break;
      case ActionType.Assign:
        element.elementControl!.reset(value: element.template.defaultValue);
        break;
      case ActionType.Filter:
      case ActionType.StopRepeat:
      case ActionType.Warning:
      case ActionType.Count:
      case ActionType.Unknown:
        // TODO NOT Implemented
        break;
    }
  }
}
