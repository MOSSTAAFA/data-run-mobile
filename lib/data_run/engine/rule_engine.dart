import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:expressions/expressions.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/form/map_field_value_to_user.dart';
import 'package:mass_pro/data_run/screens/form/fields_widgets/q_field.model.dart';

class RuleEngine {
  RuleEngine(this._evaluator);

  IMap<String, IList<Rule>?> fieldRulesMap = IMap({});
  final ExpressionEvaluator _evaluator;

  IMap<String, dynamic> getContext(IList<QFieldModel> fields) {
    return IMap.fromIterable<String, dynamic, QFieldModel>(fields,
        keyMapper: (field) => field.uid,
        valueMapper: (field) => mapFieldToValueType(field));
  }

  IMap<String, IList<Rule>?> getRules(IList<QFieldModel> fields) {
    if (fieldRulesMap.isNotEmpty) {
      return fieldRulesMap;
    }

    fieldRulesMap = IMap.fromIterable<String, IList<Rule>?, QFieldModel>(
        fields,
        keyMapper: (field) => field.uid,
        valueMapper: (field) => field.fieldRules);
    return fieldRulesMap;
  }

  Future<IList<QFieldModel>> applyRules(IList<QFieldModel> fields) async {
    final context = getContext(fields);
    final rulesMap = getRules(fields);

    IList<QFieldModel> updatedFields =
        initializeFieldVisibility(fields, rulesMap);
    return evaluateAndApplyRules(updatedFields, rulesMap, context);
  }

  /// Initializes the visibility of fields based on 'show' rules, hide when
  /// starting iteration
  IList<QFieldModel> initializeFieldVisibility(
      IList<QFieldModel> fields, IMap<String, IList<Rule>?> rulesMap) {
    IList<QFieldModel> updatedFields = fields;
    for (final field in fields) {
      final rules = rulesMap.get(field.uid);
      if (rules != null) {
        for (final rule in rules) {
          if (rule.action == 'show') {
            updatedFields =
                applyAction(updatedFields, field.uid, 'hide', rule.message);
            break;
          }
        }
      }
    }
    return updatedFields;
  }

  /// Evaluates rules and applies actions to fields
  Future<IList<QFieldModel>> evaluateAndApplyRules(
      IList<QFieldModel> fields,
      IMap<String, IList<Rule>?> rulesMap,
      IMap<String, dynamic> context) async {
    IList<QFieldModel> updatedFields = fields;
    for (final field in fields) {
      final rules = rulesMap.get(field.uid);
      if (rules != null) {
        for (final rule in rules) {
          final ruleExpression = rule.expression;
          if (ruleExpression != null) {
            final Expression expression = Expression.parse(ruleExpression);
            final bool conditionMet =
                _evaluator.eval(expression, context.unlock);
            if (conditionMet) {
              updatedFields = applyAction(
                  updatedFields, field.uid, rule.action, rule.message);
            }
          }
        }
      }
    }
    return updatedFields;
  }

  IList<QFieldModel> applyAction(IList<QFieldModel> fields, String uid,
      String? action, String? message) {
    final fieldsMap = _getFieldsModelMap(fields);
    switch (action) {
      case 'show':
        return fieldsMap
            .update(uid, (field) => field.copyWith(isVisible: true))
            .values
            .toIList();
      case 'hide':
        return fieldsMap
            .update(uid, (field) => field.copyWith(isVisible: false))
            .values
            .toIList();
      case 'error':
        return fieldsMap
            .update(uid, (field) => field.copyWith(error: message))
            .values
            .toIList();
      case 'warning':
        return fieldsMap
            .update(uid, (field) => field.copyWith(warning: message))
            .values
            .toIList();
      default:
        return fields;
    }
  }

  IMap<String, QFieldModel> _getFieldsModelMap(
      IList<QFieldModel> fields) {
    return IMap.fromIterable<String, QFieldModel, QFieldModel>(fields,
        keyMapper: (field) => field.uid, valueMapper: (field) => field);
  }
}
