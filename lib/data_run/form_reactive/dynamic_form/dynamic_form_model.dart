import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'dynamic_form_model.freezed.dart';

class FormConfig {
  FormConfig({
    required this.formName,
    List<FormElementConfig> fields = const [],
    Map<String, List<OptionConfig>> options = const {},
    Map<String, List<Rule>> rules = const {},
  }) : this.formControls = buildForm(fields, options: options) {
    this.options.addAll(options);
    this.fields.addAll(fields);
    this.rules.addAll(rules);
  }

  final Map<String, AbstractControl> formControls;

  final String formName;
  final List<FormElementConfig> fields = [];

  /// {fieldName:List<Rules>}
  final Map<String, List<Rule>> rules = {};

  /// {listName:OptionConfig}
  final Map<String, List<OptionConfig>> options = {};

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

  static Map<String, AbstractControl> buildForm(List<FormElementConfig> fields,
      {Map<String, List<OptionConfig>> options = const {}}) {
    final Map<String, AbstractControl> controls = {};

    for (var field in fields ?? []) {
      controls[field.name] = _buildControl(field, optionsList: options);
    }

    return controls;
  }

  static AbstractControl _buildBasicControl(FieldElement element,
      {Map<String, List<OptionConfig>> options = const {}}) {
    switch (element.type) {
      case ValueType.Text:
      case ValueType.LongText:
      case ValueType.Letter:
      case ValueType.Email:
      case ValueType.FullName:
        return FormControl<String>();
      case ValueType.Boolean:
        return FormControl<bool>();
      case ValueType.Date:
      case ValueType.DateTime:
        return FormControl<DateTime>();
      case ValueType.Integer:
      case ValueType.Integer:
      case ValueType.IntegerPositive:
      case ValueType.IntegerNegative:
      case ValueType.IntegerZeroOrPositive:
        return FormControl<int>();
      case ValueType.Number:
      case ValueType.Age:
        return FormControl<double>();
      case ValueType.SelectOne:
        return FormControl<String>();
      case ValueType.SelectMulti:
        return FormArray<String>(
          options[element.listName]
                  ?.map((option) => FormControl<String>())
                  .toList() ??
              [],
        );
      default:
        throw UnsupportedError('Unsupported element type: ${element}');
    }
  }

  static AbstractControl _buildControl(FormElementConfig element,
      {Map<String, List<OptionConfig>> optionsList = const {}}) {
    return element.map(
        fieldElement: (fieldElement) =>
            _buildBasicControl(fieldElement, options: optionsList),
        sectionElement: (sectionElement) => _buildSection(sectionElement),
        repeatableElement: (repeatableElement) =>
            _buildRepeatableSection(repeatableElement));
  }

  static FormGroup _buildSection(SectionElement section) {
    final Map<String, AbstractControl> controls = {};

    for (var field in section.formElements!) {
      controls[field.name] = _buildControl(field);
    }
    return FormGroup(controls);
  }

  static FormArray _buildRepeatableSection(
      RepeatableElement repeatableSection) {
    final List<AbstractControl> initialGroups = [];

    for (var field in repeatableSection.formElements) {
      initialGroups.add(_buildControl(field));
    }
    return FormArray(initialGroups);
  }
}

class OptionConfig {
  OptionConfig(
      {required this.listName,
      required this.name,
      this.order = 0,
      Map<String, String> choiceFilters = const {}}) {
    this.choiceFilters.addAll(choiceFilters);
  }

  final String listName;
  final String name;

  final int order;

  /// {nameOfFilter:valueOfFilter}
  final Map<String, String> choiceFilters = {};
}

/// if available choiceFilter expression
/// the option listName when field is of type select (options)
/// Section, RepeatedSection,Text, Integer, Date, SelectOne, SelectMulti ...
/// [ValueType];
@freezed
class FormElementConfig with _$FormElementConfig {
  const factory FormElementConfig.fieldElement(
      {required String name,
      required ValueType type,
      required bool hidden,
      required ElementProperties properties,
      String? choiceFilter,
      String? listName}) = FieldElement;

  const factory FormElementConfig.sectionElement(
          {required String name,
          required ValueType type,
          required bool hidden,
          required ElementProperties properties,
          @Default(const []) List<FormElementConfig> formElements}) =
      SectionElement;

  const factory FormElementConfig.repeatableElement(
      {required String name,
      required ValueType type,
      required bool hidden,
      required ElementProperties properties,
      @Default(const []) List<FormElementConfig> formElements,
      required int repeatedIndex}) = RepeatableElement;
}

class ElementProperties with EquatableMixin {
  ElementProperties(
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
