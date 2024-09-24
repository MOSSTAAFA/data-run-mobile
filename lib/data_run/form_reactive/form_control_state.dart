import 'dart:async';

import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rxdart/rxdart.dart';

class FormControlState<T> {
  FormControlState(
    this.control, {
    required String name,
    required String path,
    this.order = 0,
    this.section,
    this.valueType,
    List<Rule> rules = const [],
    List<String> dependencies = const [],
    Map<String, String> label = const {},
  })  : _name = name,
        _path = path {
    setDependencies(dependencies);
    setRules(rules);
    setLabel(label);
    control.valueChanges.listen((value) {
      _valueChanges.add(value);
    });
    control.statusChanged.listen((isDisabled) {
      _statusChanges.add(isDisabled);
    });
    control.touchChanges.listen((errors) {
      _touchChanges.add(errors);
    });
  }

  final AbstractControl<T?> control;
  final BehaviorSubject<T?> _valueChanges = BehaviorSubject<T>();
  final BehaviorSubject<ControlStatus> _statusChanges =
      BehaviorSubject<ControlStatus>();
  final BehaviorSubject<bool> _touchChanges = BehaviorSubject<bool>();
  final _visibilityChanges = StreamController<bool>.broadcast();

  String _name;
  String _path;
  int order;
  String? section;
  ValueType? valueType;

  List<Rule> _rules = <Rule>[];
  List<String> _dependencies = <String>[];

  Map<String, String> _label = {};

  String get name => _name;

  String get path => _path;

  Map<String, String>? get label => Map<String, String>.unmodifiable(_label);

  List<Rule> get rules => List<Rule>.unmodifiable(_rules);

  List<Rule> get dependencies => List<Rule>.unmodifiable(_dependencies);

  Stream<ControlStatus> get statusChanged => _statusChanges.stream;

  Stream<T?> get valueChanges => _valueChanges.stream;

  Stream<bool> get touchChanges => _touchChanges.stream;

  void setRules(List<Rule> rules) {
    clearRules();
    _rules.addAll(rules);
  }

  void clearRules() {
    _rules.clear();
  }

  void setLabel(Map<String, String> label) {
    _label.clear();
    _label.addAll(label);
  }

  void setDependencies(List<String> dependencies) {
    clearRules();
    _dependencies.addAll(dependencies);
  }

  void clearDependencies() {
    _dependencies.clear();
  }

  void dispose() {
    _valueChanges.close();
    _statusChanges.close();
    _touchChanges.close();
    _visibilityChanges.close();
  }
}
