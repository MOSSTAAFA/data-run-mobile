import 'dart:async';

import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:expressions/expressions.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/form/map_field_value_to_user.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';

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

    fieldRulesMap = IMap.fromIterable<String, IList<Rule>?, QFieldModel>(fields,
        keyMapper: (field) => field.uid,
        valueMapper: (field) => field.fieldRules);
    return fieldRulesMap;
  }

  FutureOr<IList<QFieldModel>> applyRules(IList<QFieldModel> fields) {
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
  FutureOr<IList<QFieldModel>> evaluateAndApplyRules(IList<QFieldModel> fields,
      IMap<String, IList<Rule>?> rulesMap, IMap<String, dynamic> context) {
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
            } else {
              // Reset action if condition is not met
              updatedFields =
                  _resetAction(updatedFields, field.uid, rule.action);
            }
          }
        }
      }
    }
    return updatedFields;
  }

  IList<QFieldModel> applyAction(IList<QFieldModel> fields, String uid,
      String? action, Map<String, String>? message) {
    final fieldsMap = _getFieldsModelMap(fields);
    switch (action) {
      case 'show':
        return fieldsMap
            .update(uid, (field) => field.builder().setIsVisible(true).build())
            .values
            .toIList();
      case 'hide':
        return fieldsMap
            .update(uid, (field) => field.builder().setIsVisible(false).build())
            .values
            .toIList();
      case 'error':
        return fieldsMap
            .update(
                uid,
                (field) => field
                    .builder()
                    .setError(getItemLocalString(message))
                    .build())
            .values
            .toIList();
      case 'warning':
        return fieldsMap
            .update(
                uid,
                (field) => field
                    .builder()
                    .setWarning(getItemLocalString(message))
                    .build())
            .values
            .toIList();
      default:
        return fields;
    }
  }

  IList<QFieldModel> _resetAction(
      IList<QFieldModel> fields, String uid, String? action) {
    final fieldsMap = _getFieldsModelMap(fields);
    switch (action) {
      case 'show':
        return fieldsMap
            .update(uid, (field) => field.builder().setIsVisible(false).build())
            .values
            .toIList();
      case 'hide':
        return fieldsMap
            .update(uid, (field) => field.builder().setIsVisible(false).build())
            .values
            .toIList();
      case 'error':
        return fieldsMap
            .update(uid, (field) => field.builder().setError(null).build())
            .values
            .toIList();
      case 'warning':
        return fieldsMap
            .update(uid, (field) => field.builder().setWarning(null).build())
            .values
            .toIList();
      default:
        return fields;
    }
  }

  IMap<String, QFieldModel> _getFieldsModelMap(IList<QFieldModel> fields) {
    return IMap.fromIterable<String, QFieldModel, QFieldModel>(fields,
        keyMapper: (field) => field.uid, valueMapper: (field) => field);
  }
}
