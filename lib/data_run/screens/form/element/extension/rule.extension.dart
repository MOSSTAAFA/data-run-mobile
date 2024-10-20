import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/action.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_action.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule_parse_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/rule/evaluation_engine.dart';
import 'package:mass_pro/data_run/screens/form_module/form_template/template_extension.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_forms/reactive_forms.dart';

extension RuleHandler on FieldTemplate {
  List<Rule> rulesToEvaluate(String dependencyName) => rules
      .where((rule) => rule.dependencies.contains(dependencyName))
      .toList();

  Iterable<RuleAction> ruleActions() {
    return rules.map((rule) => rule.ruleAction);
  }

  Iterable<RuleAction> shouldApplyRuleActions(
      Map<String, dynamic> evalContext) {
    return rules
        .where((rule) => rule.ruleAction.shouldApply(evalContext))
        .map((rule) => rule.ruleAction);
  }
}

extension RuleShouldApply on RuleAction {
  bool shouldApply(Map<String, dynamic> evalContext) {
    final result =
        evaluationEngine.evaluateExpression(evalExpression, evalContext);
    return result;
  }
}

extension ApplyAction on RuleAction {
  void apply(FormElementInstance<dynamic> element) {
    logInfo(info: '${element.name}, applying action effect: $action');
    switch (action) {
      case ActionType.Visibility:
        if (element.hidden) {
          element.markAsVisible();
          element.elementControl!.markAsEnabled();
        } else {
          element.markAsHidden();
          element.elementControl!.reset(disabled: true);
        }
        break;
      // return this.copyWith(isInEffect: true);
      case ActionType.Show:
        element.markAsVisible();
        element.elementControl!.markAsEnabled();
        break;
      // return this.copyWith(isInEffect: true);
      case ActionType.Hide:
        element.markAsHidden();
        element.elementControl!.reset(disabled: true);
        break;
      // return this.copyWith(isInEffect: true);
      case ActionType.Error:
        final currentElementErrors = element.elementControl!.errors;
        currentElementErrors[getItemLocalString(message.unlockView)] =
            getItemLocalString(message.unlockView);
        element.elementControl!.setErrors(currentElementErrors);
        break;
      // return this.copyWith(isInEffect: true);
      case ActionType.Mandatory:
        element.markAsMandatory();
        final elementValidators = [
          ...element.elementControl!.validators,
          Validators.required
        ];
        element.elementControl!
            .setValidators(elementValidators, autoValidate: true);
        break;
      // return this.copyWith(isInEffect: true);
      case ActionType.Assign:
        element.updateValue(assignedValue);
        // element.elementControl!.updateValue(assignedValue);
        // element.elementControl!.markAsDirty();
        break;
      // return this.copyWith(isInEffect: true);
      case ActionType.Filter:
      case ActionType.StopRepeat:
      case ActionType.Warning:
      case ActionType.Count:
      case ActionType.Unknown:
        // TODO NOT Implemented
        break;
      // return this.copyWith(isInEffect: true);
    }
  }

  void reset(FormElementInstance<dynamic> element) {
    logInfo(info: '${element.name}, reset action effect to: $action');
    switch (action) {
      case ActionType.Visibility:
        if (element.hidden) {
          element.markAsVisible();
          element.elementControl!.markAsEnabled();
        } else {
          element.markAsHidden();
          element.elementControl!.reset(disabled: true);
        }
        break;
      // return this.copyWith(isInEffect: false);
      case ActionType.Show:
        element.markAsHidden();
        element.elementControl!.reset(disabled: true);
        break;
      // return this.copyWith(isInEffect: false);
      case ActionType.Hide:
        element.markAsVisible();
        element.elementControl!.markAsEnabled();
        break;
      // return this.copyWith(isInEffect: false);
      case ActionType.Error:
        element.elementControl!
            .removeError(getItemLocalString(message.unlockView));
        break;
      // return this.copyWith(isInEffect: false);
      case ActionType.Mandatory:
        element.markAsMandatory();
        final elementValidators = [...element.elementControl!.validators]
          ..remove(Validators.required);
        element.elementControl!
            .setValidators(elementValidators, autoValidate: false);
        break;
      // return this.copyWith(isInEffect: false);
      case ActionType.Assign:
        element.elementControl!.reset(value: element.template.defaultValue);
        break;
      // return this.copyWith(isInEffect: false);
      case ActionType.Filter:
      case ActionType.StopRepeat:
      case ActionType.Warning:
      case ActionType.Count:
      case ActionType.Unknown:
        // TODO NOT Implemented
        break;
      // return this.copyWith(isInEffect: false);
    }
  }
}

extension RuleActionDependencies on RuleAction {
  List<String> get dependencies {
    final fieldPattern = RegExp(r'#\{(.*?)\}');

    return fieldPattern
        .allMatches(expression)
        .map((match) => match.group(1)!)
        .toSet()
        .toList();
  }

  String get evalExpression =>
      expression.replaceAll('#{', '').replaceAll('}', '');
}
