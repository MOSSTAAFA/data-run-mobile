//
// Future<IList<FormFieldModel>> applyRules(IList<FormFieldModel> fields) async {
//   final context = getContext(fields);
//   final rulesMap = getFieldRules(fields);
//
//   IList<FormFieldModel> updatedFields = fields;
//   for (final field in fields) {
//     final rules = rulesMap.get(field.uid);
//     if (rules != null) {
//       // Initially set the field to hidden if it has a show rule
//       for (final rule in rules) {
//         if (rule.action == 'show') {
//           updatedFields = updatedFields.update(
//               field.uid, (f) => f.copyWith(isVisible: false));
//           break;
//         }
//       }
//
//       // Evaluate rules and apply actions
//       for (final rule in rules) {
//         final ruleExpression = rule.expression;
//         if (ruleExpression != null) {
//           final Expression expression = Expression.parse(ruleExpression);
//           final bool conditionMet =
//           evaluator.eval(expression, context.unlock);
//           if (conditionMet) {
//             updatedFields = applyAction(
//                 updatedFields, field.uid, rule.action, rule.message);
//           }
//         }
//       }
//     }
//   }
//   return updatedFields;
// }
  // /// Evaluates rules and applies actions to fields
  // Future<IList<FormFieldModel>> evaluateAndApplyRules(
  //     IList<FormFieldModel> fields,
  //     IMap<String, IList<Rule>?> rulesMap,
  //     IMap<String, dynamic> context) async {
  //   IList<FormFieldModel> updatedFields = fields;
  //   for (final field in fields) {
  //     final rules = rulesMap.get(field.uid);
  //     if (rules != null) {
  //       for (final rule in rules) {
  //         final ruleExpression = rule.expression;
  //         if (ruleExpression != null) {
  //           final Expression expression = Expression.parse(ruleExpression);
  //           final bool conditionMet =
  //           evaluator.eval(expression, context.unlock);
  //           if (conditionMet) {
  //             updatedFields = applyAction(updatedFields, field.uid, rule);
  //           }
  //         }
  //       }
  //     }
  //   }
  //

// import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
// import 'package:fast_expressions/fast_expressions.dart';
// import 'package:fast_expressions/fast_expressions.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
//
// class RuleEngine {
//   Map<String, dynamic> formState;
//   late Map<String, dynamic> context;
//
//   RuleEngine({required this.formState}) {
//     context = adaptFormState(formState);
//   }
//
//   dynamic evaluateExpression(String expression) {
//     // Use fast_expressions to evaluate the expression in the context of formState
//     final result = parseExpression(expression, context: context)();
//     return result;
//   }
//
//   void applyRules(List<Rule> rules) {
//     for (var rule in rules) {
//       final result = evaluateExpression(rule.expression!);
//       if (result) {
//         _applyAction(rule);
//       }
//     }
//   }
//
//   void _applyAction(Rule rule) {
//     switch (rule.action) {
//       case 'show':
//         formState[rule.field]['visible'] = true;
//         break;
//       case 'hide':
//         formState[rule.field]['visible'] = false;
//         break;
//       case 'error':
//         formState[rule.field]['error'] = rule.message;
//         break;
//       case 'warning':
//         formState[rule.field]['warning'] = rule.message;
//         break;
//     // Add more actions as needed
//     }
//   }
//
//   static Map<String, dynamic> adaptFormState(Map<String, dynamic> formState) {
//     return formState.map((key, value) => MapEntry(key, value['value']));
//   }
// }
//
//   // static Future<Map<String, dynamic>> execute(
//   //     {required Map<String, dynamic> formState,
//   //       String? entityUid,
//   //       DynamicFormField? changedEventDataValue}) async {
//   //   Map<String, dynamic> context = adaptFormState(formState);
//
//     // List<ProgramRule> programRules = await ProgramRuleQuery()
//     //     .withActions()
//     //     .where(attribute: 'program', value: program)
//     //     .get();
//
//     // List<ProgramRuleVariable> programRuleVariables =
//     // await ProgramRuleVariableQuery()
//     //     .where(attribute: 'program', value: program)
//     //     .get();
//     //
//     // List<EventDataValue> eventDataValues = await EventDataValueQuery()
//     //     .where(attribute: 'event', value: event.id)
//     //     .get();
//
//     // final dataValueEntities =
//     // DataValueEntities.fromEventDataValues(eventDataValues);
//
//     // List<ProgramRuleAction> programRuleActions = ProgramRuleEngine.execute(
//     //     dataValueEntities: dataValueEntities,
//     //     programRules: programRules,
//     //     programRuleVariables: programRuleVariables);
//     //
//     // final queue = Queue(parallel: 50);
//     // num availableItemCount = 0;
//
//     // programRuleActions.forEach((programRuleAction) {
//     //   if (programRuleAction.programRuleActionType == 'ASSIGN') {
//     //     availableItemCount++;
//     //     queue.add(() => EventDataValueQuery()
//     //         .setData(EventDataValue(
//     //         dirty: true,
//     //         dataElement: programRuleAction.dataElement as String,
//     //         event: event.id,
//     //         value: programRuleAction.data as String))
//     //         .save());
//     //   }
//     // });
//     //
//     //   if (availableItemCount == 0) {
//     //     queue.cancel();
//     //   } else {
//     //     await queue.onComplete;
//     //   }
//     //
//     //   Event updatedEvent =
//     //       await EventQuery().withDataValues().byId(event.id as String).getOne();
//     //
//     //   return EventRuleResult(
//     //       event: updatedEvent, programRuleActions: programRuleActions);
//     // }
//
//
// // import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// // import 'package:d2_remote/modules/datarun/form/shared/field_rule.dart';
// //
// // class RuleEngine {
// //
// //   bool evaluate(Map<String, dynamic> formData, DynamicFormField field) {
// //     if(field.fieldRules ==  null) {
// //       return true;
// //     }
// //
// //
// //
// //     final fieldValue = formData[field.relevantFieldId];
// //     final relevantFieldValue = formData[relevantFieldId];
// //     switch (rule) {
// //       case '=':
// //         return relevantFieldValues?.contains(relevantFieldValue) ?? true;
// //       case '!=':
// //         return !relevantFieldValues.contains(relevantFieldValue);
// //       case '>':
// //       // Handle numerical or date comparisons as needed
// //       // ...
// //       case '>=':
// //       // ...
// //       case '<':
// //       // ...
// //       case '<=':
// //       // ...
// //
// //       // Textual comparison (optional)
// //       case 'contains': // Textual comparison (optional)
// //         return relevantFieldValue?.toString().toLowerCase().contains(
// //           relevantFieldValues[0].toLowerCase(),
// //         ) ?? false;
// //       case 'in':
// //
// //       case 'empty':
// //       //
// //       case 'notEmpty':
// //       default:
// //         throw Exception('Unsupported rule operator: $rule');
// //     }
// //   }
// //
// //   static _parseRuleValue(value) {
// //     if (value == null) {
// //       return '';
// //     }
// //
// //     bool isDouble = false;
// //
// //     try {
// //       double.parse(value);
// //       isDouble = true;
// //     } catch (e) {}
// //
// //     if (isDouble) {
// //       return value;
// //     }
// //
// //     bool isInt = false;
// //     try {
// //       int.parse(value);
// //       isInt = true;
// //     } catch (e) {}
// //
// //     if (isInt) {
// //       return value;
// //     }
// //
// //     return "'$value'";
// //   }
// // }
