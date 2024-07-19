import 'dart:async';

import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:expressions/expressions.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:mass_pro/data_run/form/map_field_value_to_user.dart';
import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';

class RuleEngine {
  RuleEngine(this._evaluator);

  IMap<String, IList<Rule>?> fieldRulesMap = IMap({});
  final ExpressionEvaluator _evaluator;

  /// Gets the context for evaluating expressions based on the current state of fields
  IMap<String, dynamic> getContext(IList<QFieldModel> fields) {
    return IMap.fromIterable<String, dynamic, QFieldModel>(
      fields,
      keyMapper: (field) => field.uid,
      valueMapper: (field) => mapFieldToValueType(field),
    );
  }

  /// Builds a map of field rules from the list of fields
  IMap<String, IList<Rule>?> getFieldRulesMap(IList<QFieldModel> fields) {
    if (fieldRulesMap.isNotEmpty) {
      return fieldRulesMap;
    }
    fieldRulesMap = IMap.fromIterable<String, IList<Rule>?, QFieldModel>(
      fields,
      keyMapper: (field) => field.uid,
      valueMapper: (field) => field.fieldRules,
    );
    return fieldRulesMap;
  }

  /// Applies all rules to the given list of fields and returns the updated list
  FutureOr<IList<QFieldModel>> applyRules(IList<QFieldModel> fields) {
    IList<QFieldModel> updatedFields = _initializeFieldVisibility(fields);
    return _evaluateAndApplyRules(updatedFields);
  }

  /// Initializes the visibility of fields based on 'show' rules
  IList<QFieldModel> _initializeFieldVisibility(IList<QFieldModel> fields) {
    final rulesMap = getFieldRulesMap(fields);
    return fields.map((field) {
      final rules = rulesMap[field.uid];
      if (rules != null) {
        for (final rule in rules) {
          if (rule.action == 'show') {
            return field.builder().setIsVisible(false).build();
          } else if (rule.action == 'hide') {
            return field.builder().setIsVisible(true).build();
          }
        }
      }
      return field;
    }).toIList();
  }

  /// Evaluates rules and applies actions to fields
  FutureOr<IList<QFieldModel>> _evaluateAndApplyRules(
      IList<QFieldModel> fields) {
    final context = getContext(fields);
    final rulesMap = getFieldRulesMap(fields);

    return fields.map((field) {
      final rules = rulesMap[field.uid];
      if (rules != null) {
        for (final rule in rules) {
          if (rule.expression != null) {
            try {
              final expression = Expression.parse(rule.expression!);
              final bool conditionMet =
                  _evaluator.eval(expression, context.unlock);
              if (conditionMet) {
                return _applyAction(field, rule);
              } else {
                return _resetAction(field, rule);
              }
            } catch (e) {
              debugPrint('Error evaluating expression: $e');
            }
          }
        }
      }
      return field;
    }).toIList();
  }

  /// Applies the specified action to the field with the given UID
  QFieldModel _applyAction(QFieldModel field, Rule rule) {
    switch (rule.action) {
      case 'show':
        return field.builder().setIsVisible(true).build();
      case 'hide':
        return field.builder().setIsVisible(false).build();
      case 'error':
        return field
            .builder()
            .setError(getItemLocalString(rule.message))
            .build();
      case 'warning':
        return field
            .builder()
            .setWarning(getItemLocalString(rule.message))
            .build();
      default:
        return field;
    }
  }

  /// Resets the specified action on the field with the given UID
  QFieldModel _resetAction(QFieldModel field, Rule rule) {
    switch (rule.action) {
      case 'show':
        return field.builder().setIsVisible(false).build();
      case 'hide':
        return field.builder().setIsVisible(true).build();
      case 'error':
        return field.builder().setError(null).build();
      case 'warning':
        return field.builder().setWarning(null).build();
      default:
        return field;
    }
  }
}
