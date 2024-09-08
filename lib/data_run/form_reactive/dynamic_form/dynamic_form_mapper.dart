import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mass_pro/data_run/errors_management/errors/d_exception.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'dynamic_form_mapper.freezed.dart';

@immutable
class FormConfig {
  FormConfig({
    required this.formName,
    List<FormElement> fields = const [],
    Map<String, List<OptionConfig>> options = const {},
    Map<String, List<Rule>> rules = const {},
  }) {
    this.options.addAll(options);
    this.fields.addAll(fields);
    this.rules.addAll(rules);
    // this.formControls = buildForm(fields, options: options)
  }

  // final Map<String, AbstractControl> formControls;

  final String formName;

  /// all form fields Configuration Parsed from form Submission
  final List<FormElement> fields = [];

  /// {fieldName:Rules}
  final Map<String, List<Rule>> rules = {};

  /// {listName:optionConfigs}
  final Map<String, List<OptionConfig>> options = {};

  /// dependencyMap example:
  /// helps trigger only dependent fields' rules, Maybe needs topological
  /// sorted, or a queue to dispatch action in order
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
  final Map<String, List<String>> dependencyGraph = {};

  FormGroup buildDynamicForm() {
    // Parse JSON and create FormGroup with FormControls/FormArrays
    final formControls = parseFormElements(fields, options: options);
    return FormGroup(formControls);
  }

  static Map<String, AbstractControl> parseFormElements(
      List<FormElement> fields,
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
        return FormControl<String>(
          disabled: element.properties.disabled,
        );
      case ValueType.Boolean:
        return FormControl<bool>(
          disabled: element.properties.disabled,
        );
      case ValueType.Date:
      case ValueType.DateTime:
        return FormControl<DateTime>(
          disabled: element.properties.disabled,
        );
      case ValueType.Integer:
        return FormControl<int>(
          disabled: element.properties.disabled,
        );
      case ValueType.Number:
      case ValueType.Age:
        return FormControl<double>(
          disabled: element.properties.disabled,
        );
      case ValueType.SelectOne:
        return FormControl<String>(
          disabled: element.properties.disabled,
        );
      case ValueType.SelectMulti:
        return FormArray<String>(
          disabled: element.properties.disabled,
          options[element.listName]
                  ?.map((option) => FormControl<String>())
                  .toList() ??
              [],
        );
      default:
        throw UnsupportedError('Unsupported element type: ${element}');
    }
  }

  static AbstractControl _buildControl(FormElement element,
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

    for (var field in section.formElements.values) {
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

@immutable
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
@Freezed(genericArgumentFactories: true)
class FormElement<T> with _$FormElement<T> {
  const FormElement._();

  @Implements.fromString('RawValue<T>')
  const factory FormElement.fieldElement(
      {required String name,
      required ValueType type,
      @Default(false) bool hidden,
      required ElementProperties properties,
      T? value,

      /// for FieldElement with basic types (Text, Integer, ...)
      String? choiceFilter,
      String? listName}) = FieldElement<T>;

  @Implements<RawValue<Map<String, Object?>>>()
  const factory FormElement.sectionElement(
          {required String name,
          required ValueType type,
          @Default(false) bool hidden,
          required ElementProperties properties,
          required Map<String, Object?> value,

          /// for (type Section, and Repeatable)
          @Default(const []) Map<String, FormElement<dynamic>> formElements}) =
      SectionElement<T>;

  @Implements.fromString('RawValue<List<T?>>')
  const factory FormElement.repeatableElement(
      {required String name,
      required ValueType type,
      @Default(true) bool hidden,
      required ElementProperties properties,
      /// the raw value
      required List<T?> value,

      /// for (type Section, and Repeatable)
      @Default(const []) List<FormElement<T>> formElements,
      required int repeatedIndex}) = RepeatableElement<T>;

  /// Retrieves a child element given the element's [name] or path.
  ///
  /// The [name] is a dot-delimited string that define the path to the
  /// element.
  ///
  /// Throws [FormElementNotFoundException] if no element founded with
  /// the specified [name]/path.
  FormElement<dynamic> element(String name) {
    return this.map(
        fieldElement: (fieldElement) => this,
        sectionElement: (sectionElement) {
          final namePath = name.split('.');
          if (namePath.length > 1) {
            final element = findElementInSection(namePath);
            if (element != null) {
              return element;
            }
          } else if (contains(name)) {
            return sectionElement.formElements[name]!;
          }

          throw FormElementNotFoundException(elementName: name);
        },
        repeatableElement: (repeatableElement) {
          final namePath = name.split('.');
          if (namePath.length > 1) {
            final element = findElementInSection(namePath);
            if (element != null) {
              return element;
            }
          } else {
            final index = int.tryParse(name);
            if (index == null) {
              throw FormRepeatElementInvalidIndexException(name);
            } else if (index < repeatableElement.formElements.length) {
              return repeatableElement.formElements[index];
            }
          }

          throw FormElementNotFoundException(elementName: name);
        });
  }

  /// Checks if (Section/RepeatedSection formElements) contains a FormElement by a given [name].
  ///
  /// Returns true if (formElements) contains the element, otherwise returns false.
  bool contains(String name) {
    return this.map(
        fieldElement: (fieldElement) => name == fieldElement.name,
        sectionElement: (sectionElement) =>
            sectionElement.formElements.containsKey(name),
        repeatableElement: (repeatableElement) {
          final index = int.tryParse(name);
          if (index != null && index < repeatableElement.formElements.length) {
            return true;
          }

          return false;
        });
  }

  /// when the element is either sectionElement or RepeatedElement
  /// Walks the [path] to find the matching element, otherwise returns null
  ///
  /// Returns null if no match is found or the element is FieldElement
  FormElement<dynamic>? findElementInSection(List<String> path) {
    return this.maybeMap(
        fieldElement: (sectionElement) => null,
        orElse: () {
          if (path.isEmpty) {
            return null;
          }

          final result =
              path.fold<FormElement<dynamic>?>(this, (element, name) {
            if (element != null &&
                (element is RepeatableElement<dynamic> ||
                    element is SectionElement<dynamic>)) {
              return element.contains(name) ? element.element(name) : null;
            } else {
              return null;
            }
          });

          return result;
        });
  }
}

class RawValue<T> {
  T? value;
}

class FormElementNotFoundException extends DException {
  /// The name of the element that was not found.
  final String? elementName;

  FormElementNotFoundException({this.elementName});

  @override
  String toString() {
    if (elementName == null) {
      return 'FormElementNotFoundException: element not found.';
    }

    return 'FormElementNotFoundException: element with name: \'$elementName\' not found.';
  }
}

class FormRepeatElementInvalidIndexException extends DException {
  /// The invalid index that was the cause of this exception.
  final String index;

  /// Creates an instance of the exception.
  ///
  /// The [index] argument is the invalid index that was the cause
  /// of this exception.
  FormRepeatElementInvalidIndexException(this.index);

  @override
  String toString() {
    return 'FormRepeatElementInvalidIndexException: Index \'$index\' is not a valid index for FormRepeatElement';
  }
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

