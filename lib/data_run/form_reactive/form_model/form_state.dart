import 'package:d2_remote/modules/datarun/form/shared/rule/rule.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:d2_remote/shared/utilities/dhis_uid_generator.util.dart';
import 'package:equatable/equatable.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Form {
  Form({String? uid, required this.formName, required this.label})
      : this.uid = uid != null ? uid : DhisUidGenerator.generate();

  final String uid;
  final String formName;
  final String label;
  final List<FieldConfig> fields = [];

  // listName:Option
  final Map<String, List<SelectOption>> options = {};

  /// dependencyMap example:
  ///
  ///```dart
  ///   final Map<String, List<String>> dependencyMap = {
  ///   'continentQ': ['countryQ'],
  ///   'transaction': ['voucherId', 'receivedQuantity'],
  ///   'anotherFieldName1': ['voucherId'],
  ///   'anotherFieldName2': ['voucherId'],
  ///   'this': ['voucherId'],
  /// };
  ///```
  final Map<String, List<String>> dependencyMap = {};
}

class SelectOption {
  SelectOption(
      {required this.listName,
      required this.name,
      required this.label,
      Map<String, String> choiceFilters = const {}}) {
    this.choiceFilters.addAll(choiceFilters);
  }

  final String listName;
  final String name;
  final String label;

  // nameOfFilter:valueOfFilter
  final Map<String, String> choiceFilters = {};
}

class FieldConfig {
  FieldConfig(
      {String? uid,
      required this.key,
      required this.groupId,
      this.expressionProperties,
      required this.type,
      required this.defaultValue,
      required this.initialValue,
      required this.templateOptions,
      required this.validationMessages,
      required this.validators,
      required this.asyncValidators,
      required this.fieldGroup,
      required this.fieldArray,
      required this.hidden,
      required this.mandatory,
      this.choiceFilter,
      this.listName,
      List<String> dependencies = const []})
      : this.uid = uid != null ? uid : DhisUidGenerator.generate() {
    this.dependencies.addAll(dependencies);
  }

  final String uid;
  final String key;
  final int? groupId;

  /// Section, RepeatedSection,Text, Integer, Date, ...
  final ValueType type;

  final dynamic defaultValue;
  final dynamic initialValue;
  final FormElementProperties? templateOptions;
  final Map<String, String>? validationMessages;
  final List<Map<String, dynamic>? Function(AbstractControl<dynamic> value)>? validators;
  final List<dynamic>? asyncValidators;
  final List<dynamic>? fieldGroup;
  final FieldConfig? fieldArray;
  final Map<String, dynamic>? expressionProperties;
  final bool hidden;

  //
  final bool mandatory;
  final String? choiceFilter;
  final String? listName;
  final List<String> dependencies = [];
}

class FormElementProperties with EquatableMixin {
  FormElementProperties(
      {this.order,
      required this.placeholder,
      required this.label,
      required this.disabled,
      required this.readonly,
      required this.mandatory});

  final String? label;
  final String? placeholder;
  final bool disabled;
  final bool readonly;
  final bool mandatory;
  final int? order;

  @override
  List<Object?> get props =>
      [label, placeholder, disabled, readonly, mandatory, order];
}

class FormState {
  Map<String, ControlState<dynamic>> controls;
  FormSubmissionState submissionState;
  AsyncActionState asyncActionState;

  FormState({
    required this.controls,
    required this.submissionState,
    required this.asyncActionState,
  });

  void initialize() {
    // Initialize controls, rules, and other state elements
  }

  void submitForm() {
    // Trigger form submission, handle async actions, and sync state
  }
}

class ControlState<T> {
  T? value;
  bool isEnabled;
  bool isVisible;
  bool isMandatory;
  bool isValid;
  List<String> errors;

  ControlState({
    required this.value,
    this.isEnabled = true,
    this.isVisible = true,
    this.isValid = true,
    this.isMandatory = false,
    this.errors = const [],
  });

  void setValue(T newValue) {
    value = newValue;
  }

  void setEnabled(bool enabled) {
    isEnabled = enabled;
  }

  void setVisible(bool visible) {
    isVisible = visible;
  }

  void setValid(bool valid, [List<String>? validationErrors]) {
    isValid = valid;
    errors = validationErrors ?? [];
  }
}

class AsyncActionState {
  bool isLoading;
  String? errorMessage;
  dynamic result;

  AsyncActionState({
    this.isLoading = false,
    this.errorMessage,
    this.result,
  });

  void startLoading() {
    isLoading = true;
    errorMessage = null;
  }

  void setError(String error) {
    isLoading = false;
    errorMessage = error;
  }

  void setResult(dynamic data) {
    isLoading = false;
    result = data;
  }
}

class FormField {
  FormField({
    required this.name,
    required this.type,
    required this.listName,
    this.choiceFilter,
    this.rules = const [],
    this.dependencies = const [],
  });

  String name;
  String type;
  String listName;
  String? choiceFilter;
  List<Rule> rules;
  List<String> dependencies;
}

class FormSubmissionState {
  FormSubmissionState({
    this.isDirty = false,
    this.isSynced = false,
    this.isComplete = false,
    this.isSyncPending = false,
    this.isSyncFailed = false,
  });

  bool isDirty;
  bool isSynced;
  bool isComplete;
  bool isSyncPending;
  bool isSyncFailed;

  void markDirty() {
    isDirty = true;
  }

  void markSynced() {
    isDirty = false;
    isSynced = true;
    isSyncPending = false;
    isSyncFailed = false;
  }

  void markSyncPending() {
    isSyncPending = true;
  }

  void markSyncFailed() {
    isSyncFailed = true;
    isSyncPending = false;
  }
}
