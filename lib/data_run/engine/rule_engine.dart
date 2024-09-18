// import 'dart:async';
//
// import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
// import 'package:d2_remote/modules/datarun/form/shared/rule_action.dart';
// import 'package:expressions/expressions.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter/foundation.dart';
// import 'package:mass_pro/data_run/form/form_configuration.dart';
// import 'package:mass_pro/data_run/form/form_model/form_model.dart';
// import 'package:mass_pro/data_run/form/map_field_value_to_user.dart';
// import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
//
// class RuleEngine {
//   RuleEngine({required this.evaluator, required this.formConfiguration});
//
//   IMap<String, List<Rule>?> _fieldRulesMap = IMap({});
//   final ExpressionEvaluator evaluator;
//   final FormConfiguration formConfiguration;
//
//   /// Applies all rules to the given list of fields and returns the updated list
//   FutureOr<IList<QFieldModel>> applyRules(IList<QFieldModel> fields) {
//     return _evaluateAndApplyRules(fields);
//   }
//
//   /// Evaluates rules and applies actions to fields
//   IList<QFieldModel> _evaluateAndApplyRules(IList<QFieldModel> fields) {
//     final context = _getContext(fields);
//     return fields.map((field) => _applyFieldRules(field, context)).toIList();
//   }
//
//   QFieldModel _applyFieldRules(
//       QFieldModel field, IMap<String, dynamic> context) {
//     final rules = formConfiguration.fieldRules.get(field.name)?.toList() ?? [];
//     for (final rule in rules) {
//       if (rule.expression != null) {
//         try {
//           final expression = Expression.parse(rule.expression!);
//           final bool conditionMet = evaluator.eval(expression, context.unlock);
//           if (conditionMet) {
//             field = _applyAction(field, rule);
//           } else {
//             field = _resetAction(field, rule);
//           }
//         } catch (e) {
//           debugPrint('Error evaluating expression: $e');
//         }
//       }
//     }
//     return field;
//   }
//
//   /// Gets the context for evaluating expressions based on the current state of fields
//   IMap<String, dynamic> _getContext(IList<QFieldModel> fields) {
//     return IMap.fromIterable<String, dynamic, QFieldModel>(
//       fields,
//       keyMapper: (field) => field.name,
//       valueMapper: (field) => mapFieldToValueType(
//           value: field.value,
//           valueType: field.valueType?.name),
//     );
//   }
//
//   /// Builds a map of field rules from the list of fields
//   IMap<String, List<Rule>?> _getFieldRulesMap(IList<QFieldModel> fields) {
//     if (_fieldRulesMap.isNotEmpty) {
//       return _fieldRulesMap;
//     }
//
//     final fieldsWithRules = fields.takeWhile((field) => field.rules.isNotEmpty);
//
//     _fieldRulesMap = IMap.fromIterable<String, List<Rule>?, QFieldModel>(
//       fieldsWithRules,
//       keyMapper: (field) => field.name,
//       valueMapper: (field) => field.rules,
//     );
//
//     return _fieldRulesMap;
//   }
//
//   /// Applies the specified action to the field with the given UID
//   QFieldModel _applyAction(QFieldModel field, Rule rule) {
//     switch (rule.action) {
//       case Action.Show:
//         return field.builder().setIsVisible(true).build();
//       case Action.Hide:
//         return field.builder().setIsVisible(false).build();
//       case Action.Error:
//         return field
//             .builder()
//             .setError(getItemLocalString(rule.message))
//             .build();
//       case Action.Filter:
//         return _applyFilter(field, rule);
//       default:
//         return field;
//     }
//   }
//
//   /// Resets the specified action on the field with the given UID
//   QFieldModel _resetAction(QFieldModel field, Rule rule) {
//     switch (rule.action) {
//       case Action.Show:
//         return field.builder().setIsVisible(false).build();
//       case Action.Hide:
//         return field.builder().setIsVisible(true).build();
//       case Action.Error:
//         return field.builder().setError(null).build();
//       case Action.Filter:
//         return _resetFilter(field, rule);
//       default:
//         return field;
//     }
//   }
//
//   QFieldModel _applyFilter(QFieldModel field, Rule rule) {
//     if (rule.filterInfo == null) return field;
//
//     final optionsToShow = rule.filterInfo!.optionsToShow ?? [];
//     final optionsToHide = rule.filterInfo!.optionsToHide ?? [];
//
//     // if (field.optionConfiguration?.options != null) {
//     //   final applyToShowAndToHide = field.optionConfiguration!.updateToShowToHid(
//     //       optionsToShow: optionsToShow, optionsToHide: optionsToHide);
//     //
//     //   field =
//     //       field.builder().setOptionConfiguration(applyToShowAndToHide).build();
//     // }
//
//     return field;
//   }
//
//   QFieldModel _resetFilter(QFieldModel field, Rule rule) {
//     if (rule.filterInfo == null) return field;
//
//     // final fieldToFilter = rule.filterInfo!.fieldToFilter;
//     final optionsToShow = rule.filterInfo!.optionsToShow ?? [];
//     final optionsToHide = rule.filterInfo!.optionsToHide ?? [];
//
//     // if (field.optionConfiguration?.options != null) {
//     //   return field
//     //       .builder()
//     //       .setOptionConfiguration(field.optionConfiguration!.resetToShowToHide(
//     //           optionsToShow: optionsToShow, optionsToHide: optionsToHide))
//     //       .build();
//     // }
//
//     return field;
//   }
// }
