import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:mass_pro/data_run/engine/rule_handler/error_rule_handler.dart';
import 'package:mass_pro/data_run/engine/rule_handler/visibility_rule_handler.dart';
import 'package:mass_pro/data_run/engine/rule_handler/warning_rule_handler.dart';
import 'package:mass_pro/data_run/screens/form/form_state/q_field.model.dart';

/// Chain of handler
abstract class FormRuleHandler {
  FormRuleHandler? nextHandler;

  void setNextHandler(FormRuleHandler handler) {
    nextHandler = handler;
  }

  void handle(QFieldModel field, List<QFieldModel> allFields);

  static FormRuleHandler buildRuleHandlerChain() {
    final visibilityHandler = VisibilityRuleHandler();
    final errorHandler = ErrorRuleHandler();
    final warningHandler = WarningRuleHandler();

    visibilityHandler.setNextHandler(errorHandler);
    errorHandler.setNextHandler(warningHandler);

    return visibilityHandler;
  }
}
