import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule_action.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/data_run/form_reactive/form_model/form_event.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'form_model.freezed.dart';


@freezed
class EvaluationAction with _$EvaluationAction {
  const factory EvaluationAction.assignValue(String path, {dynamic value}) =
  AssignValue;

  const factory EvaluationAction.markAsPending(String path) = MarkAsPending;

  const factory EvaluationAction.markAsHidden(String path) = MarkAsHidden;

  const factory EvaluationAction.markAsVisible(String path) = MarkAsVisible;

  const factory EvaluationAction.markAsMandatory(String path) = MarkAsMandatory;

  const factory EvaluationAction.markAsOptional(String path) = MarkAsOptional;

  const factory EvaluationAction.setError(String path,
      {Map<String, String>? errorMessage}) = SetError;

  const factory EvaluationAction.stopRepeat(String path) = StopRepeat;

  const factory EvaluationAction.setCount(String path) = SetCount;

  const factory EvaluationAction.showHideOptions(String path,
      {@Default(const []) List<String> optionsToShow,
        @Default(const []) List<String> optionsToHide}) = ShowHideOptions;
}

class EventType {
  static final String ValueChanged = ':ValueChanged';
  static final String EvaluationAction = ':EvaluationAction';
}

class EventManager {
  final Map<String, ObserverList<void Function(dynamic)>>
  _valueChangeListeners = {};
  final Map<String, ObserverList<void Function(EvaluationAction?)>>
  _evaluationActionListeners = {};

  void registerValueChangeListener(
      String eventName, void Function(dynamic) listener) {
    if (_valueChangeListeners[eventName] == null) {
      _valueChangeListeners[eventName] = ObserverList();
    }
    _valueChangeListeners[eventName]!.add(listener);
  }

  void dispatchFormElementChanged(String eventName, dynamic data) {
    if (_valueChangeListeners[eventName] != null) {
      for (var listener in _valueChangeListeners[eventName]!) {
        listener(data);
      }
    }
  }

  void dispatchEvaluationAction(String eventName, EvaluationAction? action) {
    if (_evaluationActionListeners[eventName] != null) {
      for (var listener in _evaluationActionListeners[eventName]!) {
        listener(action);
      }
    }
  }

  void removeListeners(String fieldName) {
    _valueChangeListeners.remove(fieldName);
    _evaluationActionListeners.remove(fieldName);
  }
}

class EvaluationHandler {
  EvaluationHandler(
      {required this.fieldName,
        required this.eventManager,
        List<Rule> rules = const [],
        required this.formGroup}) {
    rules.addAll(rules);
    for (final dependency in _dependencies) {
      eventManager.registerValueChangeListener(
          '${dependency}:${EventType.ValueChanged}', (value) {
        onDependencyChanged(dependency, value);
      });
    }
  }

  final String fieldName;
  final EventManager eventManager;
  final List<Rule> rules = [];
  final List<String> _dependencies = [];
  final FormGroup formGroup;

  void onDependencyChanged(String dependency, dynamic newValue) {
    rules.where((rule) => rule.dependencies.contains(dependency)).map((rule) {
      evaluate(fieldName, rule);
    });
  }

  void evaluate(String fieldName, Rule rule) {
    // evaluate rule expression
    bool conditionMet = true;

    if (conditionMet) {
      eventManager.dispatchEvaluationAction(
          '${fieldName}${EventType.EvaluationAction}',
          evaluationAction(fieldName, rule));
    }
  }

  EvaluationAction? evaluationAction(String fieldName, Rule rule) {
    return switch (rule.action) {
      Action.Show => EvaluationAction.markAsVisible(fieldName),
      Action.Hide => EvaluationAction.markAsHidden(fieldName),
      Action.Error =>
          EvaluationAction.setError(fieldName, errorMessage: rule.message),
      Action.Mandatory => EvaluationAction.markAsMandatory(fieldName),
      Action.Filter => EvaluationAction.showHideOptions(fieldName,
          optionsToShow: rule.filterInfo?.optionsToShow ?? const [],
          optionsToHide: rule.filterInfo?.optionsToHide ?? const []),
      Action.StopRepeat => EvaluationAction.stopRepeat(fieldName),
      Action.Assign =>
          EvaluationAction.assignValue(fieldName, value: rule.assignedValue),
      _ => null,
    };
  }
}

