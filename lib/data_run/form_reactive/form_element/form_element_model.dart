import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:get/get.dart';
import 'package:mass_pro/data_run/form_reactive/form_element/form_element_exception.dart';
import 'package:mass_pro/data_run/form_reactive/form_element/form_element_members.dart';

/// A FormElement can generically be
/// [FieldInstance], [SectionInstance], or [RepeatSection]
///
/// which will make representing Tree of Form elements easier,
/// for example a section can have other sections or fields or both as children
sealed class FormElementInstance<T> {
  FormElementInstance(
      {required this.name,
      required this.type,
      this.hidden = false,
      this.parentSection,
      T? value,
      required this.properties})
      : _value = value;

  final String name;
  final ValueType type;
  final bool hidden;
  FormElementInstance<Object>? parentSection;
  final ElementProperties properties;

  T? _value;

  T? get value => _value;

  set value(T? value) => _value;

  bool get visible => !hidden;

  bool get disabled => properties.disabled;

  bool get enabled => !disabled;

  Map<String, dynamic> get rawValue;

  void updateValue(dynamic value) {
    this._value = value;
  }

  Map<String, dynamic> flattenElements(
      Map<String, dynamic> formMap, String prefix) {
    final flatMap = <String, dynamic>{};
    formMap.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        flatMap.addAll(flattenElements(value, '$prefix.$key'));
      } else {
        flatMap['$key'] = value;
      }
    });
    return flatMap;
  }
}

class FieldInstance<T> extends FormElementInstance<T> {
  FieldInstance(
      {required super.name,
      required super.type,
      super.hidden,
      required super.properties,
      super.parentSection,
      T? value,
      this.defaultValue,
      this.listName,
      this.choiceFilter,
      List<FormOption> options = const []})
      : super(value: value);

  final dynamic defaultValue;
  final String? listName;
  final String? choiceFilter;
  final List<OptionConfig> options = [];

  @override
  Map<String, dynamic> get rawValue => flattenElements({name: _value}, '');
}

/// SectionElement is a Form Element representing the
/// father of either a [SectionInstance] element or a [RepeatSection] element
sealed class SectionElement<T> extends FormElementInstance<T> {
  SectionElement({
    // required this.elements,
    required super.name,
    required super.type,
    super.value,
    super.parentSection,
    required super.properties,
  });

  // final T elements;

  FormElementInstance element(String name);

  /// Checks if [SectionElement] contains an element by a given [name].
  ///
  /// Returns true if collection contains the element, otherwise returns false.
  bool contains(String name);

  /// Walks the [path] to find the matching element.
  ///
  /// Returns null if no match is found.
  FormElementInstance? findElementInCollection(List<String> path) {
    if (path.isEmpty) {
      return null;
    }

    final result = path.fold<FormElementInstance?>(this, (element, name) {
      if (element != null && element is SectionElement) {
        return element.contains(name) ? element.element(name) : null;
      } else {
        return null;
      }
    });

    return result;
  }
}

/// A section
class SectionInstance extends SectionElement<List<FormElementInstance>> {
  SectionInstance({
    required super.name,
    required super.type,
    required super.properties,
    super.value = const [],
  });

  @override
  bool contains(String name) {
    return value.firstWhereOrNull((element) => element.name == name) != null;
  }

  @override
  List<FormElementInstance> get value => List.unmodifiable(_value!);

  /// Retrieves a child element given the element's [name] or path.
  ///
  /// The [name] is a dot-delimited string that define the path to the
  /// element.
  ///
  ///
  /// ```dart
  /// ### Example:
  ///
  /// ```dart
  /// SectionInstance(
  ///   name: 'addressSection',
  ///   type: ValueType.Section,
  ///   properties: ElementProperties(disabled: false),
  ///   value: [
  ///     SectionInstance(
  ///       name: 'location',
  ///       type: ValueType.Section,
  ///       properties: ElementProperties(disabled: false),
  ///       value: [
  ///          FieldInstance(
  ///             name: 'point1',
  ///             type: ValueType.Text,
  ///             properties: ElementProperties(disabled: false),
  ///             value: 'Point 1',
  ///           ),
  ///          FieldInstance(
  ///             name: 'point2',
  ///             type: ValueType.Text,
  ///             properties: ElementProperties(disabled: false),
  ///             value: 'Point 2',
  ///           ),
  ///       ],
  ///     ),
  ///     FieldInstance(
  ///       name: 'city',
  ///       type: ValueType.Text,
  ///       properties: ElementProperties(disabled: false),
  ///       value: 'New York',
  ///     ),
  ///   ],
  /// )
  ///
  /// final element = sectionInstance.element('city'); // retrieve the Section
  /// final element = sectionInstance.element('location.point1');
  /// ```
  ///

  @override
  FormElementInstance element(String name) {
    final namePath = name.split('.');
    if (namePath.length > 1) {
      final element = findElementInCollection(namePath);
      if (element != null) {
        return element;
      }
    } else if (contains(name)) {
      return value.firstWhereOrNull((element) => element.name == name)!;
    }

    throw FormElementNotFoundException(elementName: name);
  }

  @override
  Map<String, dynamic> get rawValue {
    final Map<String, Object?> valuesMap = {};
    value.forEach((element) {
      if (element is SectionElement<dynamic>) {
        valuesMap[element.name] = element.rawValue;
      }
      valuesMap[element.name] = element.value;
    });

    return valuesMap;
  }
}

class RepeatSectionInstance extends SectionElement<List<SectionInstance>> {
  final List<SectionInstance> _elements = [];

  RepeatSectionInstance({
    required super.name,
    super.value = const [],
    required super.type,
    super.parentSection,
    required super.properties,
    List<SectionInstance> elements = const [],
  }) {
    this._elements.addAll(elements);
  }

  /// Insert a new [element] at the end of the RepeatSection.
  void add(SectionInstance element) {
    element.parentSection = this.name;
    _value!.add(element);
  }

  /// Appends all [elements] to the end of the RepeatSection.
  void addAll(List<SectionInstance> elements) {
    _value ??= [];
    for (final element in elements) {
      element.parentSection = this.name;
    }
    _value!.addAll(elements);
  }

  /// Removes and returns the child element at the given [index].
  SectionInstance? removeAt(int index) {
    return _value!.removeAt(index);
  }

  /// Removes all children elements from the repeatSection.
  void clear() {
    _value?.clear();
  }

  @override
  List<SectionInstance> get value => List.unmodifiable(_value!);

  /// Checks if repeatSection contains a element by a given [name].
  /// The name here must be the string representation of the children index.
  ///
  /// `i.e repeated.element('0')`
  @override
  bool contains(String name) {
    final index = int.tryParse(name);
    if (index != null && index < _value!.length) {
      return true;
    }

    return false;
  }

  @override
  FormElementInstance element(String name) {
    final namePath = name.split('.');
    if (namePath.length > 1) {
      final control = findElementInCollection(namePath);
      if (control != null) {
        return control;
      }
    } else {
      final index = int.tryParse(name);
      if (index == null) {
        throw FormRepeatElementInvalidIndexException(name);
      } else if (index < _value!.length) {
        return _value![index];
      }
    }

    throw FormElementNotFoundException(elementName: name);
  }

  /// Gets the value of the [SectionInstance] flattened.
  @override
  Map<String, dynamic> get rawValue {
    final Map<String, Object?> valuesMap = {};
    _value!.forEach((element) {
      valuesMap[element.name] = element.rawValue;
    });
    return valuesMap;
  }
}
