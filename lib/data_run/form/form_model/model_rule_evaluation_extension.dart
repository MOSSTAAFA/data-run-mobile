// part of 'form_model.dart';
//
// extension ModelRuleEvaluationExtension on AbstractFieldModel {
//   List<EvaluationResult> _runRuleEvaluators() {
//     final errors = <EvaluationResult>[];
//     for (final evaluator in ruleEvaluators) {
//       final evaluatorAction = evaluator.evaluate(this);
//       if (evaluatorAction != null) {
//         errors.add(evaluatorAction);
//       }
//     }
//
//     return errors;
//   }
//
//   void updateValueAndValidity({
//     bool updateParent = true,
//     bool emitEvent = true,
//   }) {
//     _setInitialStatus();
//     _updateValue();
//     if (enabled) {
//       _cancelExistingSubscription();
//       _evaluationResults = _runRuleEvaluators();
//       _status = _calculateStatus();
//       if (_status == ControlStatus.valid || _status == ControlStatus.pending) {
//         _runAsyncValidators();
//       }
//     }
//
//     if (emitEvent) {
//       _valueChanges.add(value);
//       _statusChanges.add(_status);
//     }
//
//     _updateAncestors(updateParent);
//   }
//
//   FieldStatus _calculateStatus() {
//     if (allFieldsDisabled()) {
//       return FieldStatus.disabled;
//     } else if (allFieldsHidden()) {
//       return FieldStatus.hidden;
//     } else if (hasEvaluationActions) {
//       evaluationResults
//           .firstOrNullWhere((result) => result.action.isVisibility);
//       return FieldStatus.hidden;
//     } else if (allFieldsHidden()) {
//       return FieldStatus.hidden;
//     } else if (allFieldsHidden()) {
//       return FieldStatus.hidden;
//     } else if (hasErrors) {
//       return FieldStatus.invalid;
//     } else if (anyControlsHaveStatus(ControlStatus.pending)) {
//       return FieldStatus.pending;
//     } else if (anyControlsHaveStatus(ControlStatus.invalid)) {
//       return FieldStatus.invalid;
//     }
//
//     return ControlStatus.valid;
//   }
//
//   Future<void> _cancelExistingSubscription() async {
//     await _asyncValidationSubscription?.cancel();
//     _asyncValidationSubscription = null;
//   }
//
//   /// runs async validators to validate the value of current control
//   Future<void> _runAsyncValidators() async {
//     if (_asyncValidators.isEmpty) {
//       return;
//     }
//
//     _status = ControlStatus.pending;
//
//     _debounceTimer?.cancel();
//
//     _debounceTimer = Timer(
//       Duration(milliseconds: _asyncValidatorsDebounceTime),
//       () {
//         final validatorsStream = Stream.fromFutures(asyncValidators
//             .map((validator) => validator.validate(this))
//             .toList());
//
//         final asyncValidationErrors = <String, dynamic>{};
//         _asyncValidationSubscription = validatorsStream.listen(
//           (Map<String, dynamic>? error) {
//             if (error != null) {
//               asyncValidationErrors.addAll(error);
//             }
//           },
//           onDone: () {
//             final allErrors = <String, dynamic>{};
//             allErrors.addAll(errors);
//             allErrors.addAll(asyncValidationErrors);
//
//             setErrors(allErrors, onMarkAsDirty: false);
//           },
//         );
//       },
//     );
//   }
// }
