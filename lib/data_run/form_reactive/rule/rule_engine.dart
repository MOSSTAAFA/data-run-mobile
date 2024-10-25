import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/form/shared/form_configuration.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RuleEngine {
  RuleEngine(
    FormConfiguration formConfig, {
    Map<String, Function(FormGroup)> rules = const {},
  }) : this._formConfig = formConfig {
    _rules.addAll(rules);
  }

  final FormConfiguration _formConfig;
  final Map<String, Function(FormGroup)> _rules = {};

  void applyRules(FormGroup formGroup) {
    formGroup.valueChanges.listen((formValues) {
      _rules.forEach((controlName, rule) {
        logDebug(info: '### applyRules, RuleEngine: ${formGroup.value}');
        // final control = formGroup.control(controlName);
        rule(formGroup); // Apply rule to the control
      });
    });
  }
}
