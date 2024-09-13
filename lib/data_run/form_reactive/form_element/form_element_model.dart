import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:flutter/foundation.dart';
import 'package:mass_pro/data_run/form_reactive/form_element/form_element_exception.dart';
import 'package:mass_pro/data_run/form_reactive/form_element/form_element_members.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

/// A FormElement can generically be
/// [FieldInstance], [SectionInstance], or [RepeatSection]
///
/// which will make representing Tree of Form elements easier,
/// for example a section can have other sections or fields or both as children
sealed class FormElementInstance<T> with ElementAttributesMixin {
  FormElementInstance(
      {required this.name,
      required this.type,
      required this.form,
      this.parentSection,
      T? value,
      ElementProperties? properties})
      : _value = value,
        _properties = properties ?? ElementProperties();

  final FormGroup form;
  final String name;
  final ValueType type;
  FormElementInstance<Object>? parentSection;
  ElementProperties _properties;

  ElementProperties get properties => _properties;

  T? _value;

  T? get value => _value;

  set value(T? value) => _value;

  bool get hidden => properties.hidden;

  bool get visible => !hidden;

  bool get disabled => properties.disabled;

  bool get enabled => !disabled;

  bool get mandatory => properties.mandatory;

  void _updateValue() {
    _value = reduceValue();
  }

  void _updateAncestors(bool updateParent) {
    if (updateParent) {
      parentSection?.updateValueAndValidity(updateParent: updateParent);
    }
  }

  void updateValueAndValidity({bool updateParent = true}) {
    _setInitialStatus();
    _updateValue();

    _updateAncestors(updateParent);
  }

  @protected
  bool allElementsDisabled() => disabled;

  @protected
  bool allElementsHidden() => hidden;

  void _setInitialStatus() {
    _properties = _properties.copyWith(
        disabled: allElementsDisabled(), hidden: allElementsHidden());
  }

  T? reduceValue();

  void updateValue(T? value, {bool updateParent = true});

  void patchValue(T? value, {bool updateParent = true});

  void reset({
    T? value,
    bool? disabled,
    bool? hidden,
    bool updateParent = true,
  }) {
    updateValue(value, updateParent: updateParent);
    if (disabled != null) {
      disabled
          ? markAsDisabled(updateParent: true)
          : markAsEnabled(updateParent: true);
    }
    if (hidden != null) {
      hidden
          ? markAsHidden(updateParent: true)
          : markAsVisible(updateParent: true);
    }
  }

  void markAsEnabled({bool updateParent = true}) {
    if (enabled) {
      return;
    }
    _properties = _properties.copyWith(disabled: true);
    _updateAncestors(updateParent);
  }

  void markAsDisabled({bool updateParent = true}) {
    if (disabled) {
      return;
    }
    _properties = _properties.copyWith(disabled: false);
    _updateAncestors(updateParent);
  }

  void markAsHidden({bool updateParent = true}) {
    if (hidden) {
      return;
    }
    _properties = _properties.copyWith(hidden: true);
    _updateAncestors(updateParent);
  }

  void markAsVisible({bool updateParent = true}) {
    if (visible) {
      return;
    }
    _properties = _properties.copyWith(hidden: false);
    _updateAncestors(updateParent);
  }

  String get path {
    return parentSection != null ? '${parentSection!.path}.${name}' : name;
  }

  @protected
  bool anyElements(
      bool Function(FormElementInstance<dynamic> element) condition);

  @protected
  void forEachChild(
      void Function(FormElementInstance<dynamic> element) callback);

  @protected
  FormElementInstance<dynamic>? findElement(String path);

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
      super.properties,
      super.parentSection,
      required super.form,
      T? value,
      this.defaultValue,
      this.listName,
      this.choiceFilter,
      List<FormOption> options = const []}) {
    /*if (value != null)*/ this._value = value;
  }

  final dynamic defaultValue;
  final String? listName;
  final String? choiceFilter;
  final List<OptionConfig> options = [];

  @override
  void updateValue(T? value, {bool updateParent = true}) {
    if (_value != value) {
      _value = value;
      updateValueAndValidity(updateParent: updateParent);
    }
  }

  @override
  void patchValue(T? value, {bool updateParent = true}) {
    updateValue(value, updateParent: updateParent);
  }

  @override
  T? reduceValue() => _value;

  @override
  bool anyElements(
          bool Function(FormElementInstance<dynamic> element) condition) =>
      false;

  @override
  FormElementInstance<dynamic>? findElement(String path) => this;

  @override
  void forEachChild(
          void Function(FormElementInstance<dynamic> element) callback) =>
      <FormElementInstance<dynamic>>[];
}

/// SectionElement is a Form Element representing the
/// father of either a [SectionInstance] element or a [RepeatSection] element
sealed class SectionElement<T> extends FormElementInstance<T> {
  final SectionInstance? _sectionTemplate;

  SectionElement({
    required super.name,
    required super.type,
    super.value,
    super.parentSection,
    SectionInstance? sectionTemplate,
    required super.properties,
    required super.form,
  }) : _sectionTemplate = sectionTemplate;

  FormElementInstance<dynamic> element(String name);

  SectionInstance? get sectionTemplate => _sectionTemplate;

  /// Checks if [SectionElement] contains an element by a given [name].
  ///
  /// Returns true if collection contains the element, otherwise returns false.
  bool contains(String name);

  T get rawValue;

  /// Walks the [path] to find the matching element.
  ///
  /// Returns null if no match is found.
  FormElementInstance<dynamic>? findElementInCollection(List<String> path) {
    if (path.isEmpty) {
      return null;
    }

    final result =
        path.fold<FormElementInstance<dynamic>?>(this, (element, name) {
      if (element != null && element is SectionElement<dynamic>) {
        return element.contains(name) ? element.element(name) : null;
      } else {
        return null;
      }
    });

    return result;
  }
}

/// A section
class SectionInstance extends SectionElement<Map<String, Object?>> {
  final Map<String, FormElementInstance<dynamic>> _elements = {};

  SectionInstance({
    required super.name,
    required super.type,
    required super.properties,
    required super.form,
    super.sectionTemplate,
    Map<String, FormElementInstance<dynamic>> elements = const {},
  }) : assert(!elements.keys.any((name) => name.contains('.')),
            'element name should not contain dot(.)') {
    addAll(elements);

    if (properties.disabled) {
      markAsDisabled();
    }
    if (properties.hidden) {
      markAsHidden();
    }
  }

  String get path {
    String? parentPath;

    if (parentSection != null) {
      parentPath = '${parentSection!.path}';
      if (parentSection is RepeatSectionInstance) {
        int sectionIndex = (parentSection as RepeatSectionInstance)
            .sectionIndexWhere((section) => section.name == this.name);
        return '${parentPath}.$sectionIndex';
      }
      return '${parentSection!.path}.${name}';
    }
    return name;
  }

  void removeChildControl(
    String controlName, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (contains(controlName)) {
      final controlPath = path;
      final formGroup = form.control(controlPath);

      if (formGroup is FormGroup) {
        formGroup.removeControl(
          controlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        form.removeControl(
          controlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      }
    }
  }

  void UpdateChildControlValue(String name,
      dynamic value, {
        bool updateParent = true,
        bool emitEvent = true,
      }) {

    final controlPath = path;
    final formControl = form.control(controlPath);

    if (formControl is FormGroup) {
      formControl.updateValue(
        value as Map<String, Object?>?,
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      formControl.updateValue(
        value as String?,
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  Map<String, Object?> get value => Map.unmodifiable(_value!);

  @override
  set value(Map<String, Object?>? value) {
    updateValue(value);
  }

  Map<String, FormElementInstance<dynamic>> get elements =>
      Map.unmodifiable(_elements);

  @override
  bool contains(String name) {
    return _elements.containsKey(name);
  }

  @override
  void markAsDisabled({bool updateParent = true}) {
    _elements.forEach((_, element) {
      element.markAsDisabled(updateParent: true);
    });
    super.markAsDisabled(updateParent: updateParent);
  }

  @override
  void markAsEnabled({bool updateParent = true}) {
    _elements.forEach((_, element) {
      element.markAsEnabled(updateParent: true);
    });
    super.markAsEnabled(updateParent: updateParent);
  }

  @override
  void markAsHidden({bool updateParent = true}) {
    _elements.forEach((_, element) {
      element.markAsHidden(updateParent: true);
    });
    super.markAsHidden(updateParent: updateParent);
  }

  @override
  void markAsVisible({bool updateParent = true}) {
    _elements.forEach((_, element) {
      element.markAsVisible();
    });
    super.markAsVisible(updateParent: updateParent);
  }

  /// Appends all [elements] to the group.
  void addAll(Map<String, FormElementInstance<dynamic>> elements) {
    _elements.addAll(elements);
    elements.forEach((name, element) {
      element.parentSection = this;
    });
    updateValueAndValidity();
  }

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
  FormElementInstance<dynamic> element(String name) {
    final namePath = name.split('.');
    if (namePath.length > 1) {
      final element = findElementInCollection(namePath);
      if (element != null) {
        return element;
      }
    } else if (contains(name)) {
      return _elements[name]!;
    }
    throw FormElementNotFoundException(elementName: name);
  }

  @override
  Map<String, Object?> get rawValue =>
      _elements.map<String, Object?>((key, element) {
        if (element is SectionElement<dynamic>) {
          return MapEntry(key, element.rawValue);
        }

        return MapEntry(key, element.value);
      });

  @override
  void patchValue(Map<String, Object?>? value, {bool updateParent = true}) {
    value?.forEach((name, value) {
      if (_elements.containsKey(name)) {
        _elements[name]!.patchValue(value, updateParent: false);
      }
    });

    updateValueAndValidity(updateParent: updateParent);
  }

  @override
  Map<String, Object?>? reduceValue() {
    final map = <String, Object?>{};
    _elements.forEach((key, element) {
      if (element.enabled || disabled) {
        map[key] = element.value;
      }
    });

    return map;
  }

  @override
  bool allElementsDisabled() {
    if (_elements.isEmpty) {
      return false;
    }
    return _elements.values.every((element) => element.disabled);
  }

  @override
  void updateValue(Map<String, Object?>? value, {bool updateParent = true}) {
    value ??= {};

    for (final key in _elements.keys) {
      _elements[key]!.updateValue(value[key], updateParent: false);
    }

    updateValueAndValidity(updateParent: updateParent);
  }

  void removeElement(String name, {bool updateParent = true}) {
    if (!_elements.containsKey(name)) {
      throw FormElementNotFoundException(elementName: name);
    }

    _elements.removeWhere((key, value) => key == name);
    updateValueAndValidity(updateParent: updateParent);
  }

  @override
  bool anyElements(
      bool Function(FormElementInstance<dynamic> element) condition) {
    return _elements.values
        .any((element) => element.enabled && condition(element));
  }

  @override
  FormElementInstance<dynamic>? findElement(String path) =>
      findElementInCollection(path.split('.'));

  @override
  void forEachChild(
      void Function(FormElementInstance<dynamic> element) callback) {
    _elements.forEach((name, element) => callback(element));
  }
}

class RepeatSectionInstance
    extends SectionElement<List<Map<String, Object?>?>> {
  final List<SectionInstance> _elements = [];

  RepeatSectionInstance(
      {required super.name,
      required super.type,
      super.parentSection,
      super.sectionTemplate,
      required super.form,
      ElementProperties? properties,
      List<SectionInstance> elements = const []})
      : super(properties: properties) {
    this._elements.addAll(elements);
    addAll(elements);

    if (properties?.disabled == true) {
      markAsDisabled();
    }

    if (properties?.hidden == true) {
      markAsHidden();
    }
  }

  /// Gets the list of child elements.
  List<SectionInstance> get elements =>
      List<SectionInstance>.unmodifiable(_elements);

  @override
  List<Map<String, Object?>?> get rawValue =>
      _elements.map<Map<String, Object?>?>((element) {
        return element.rawValue;
      }).toList();

  @override
  List<Map<String, Object?>?>? reduceValue() {
    return _elements
        .where((element) => element.enabled || disabled)
        .map((element) => element.value)
        .toList();
  }

  @override
  set value(List<Map<String, Object?>?>? value) {
    updateValue(value);
  }

  @override
  bool allElementsDisabled() {
    if (_elements.isEmpty) {
      return false;
    }
    return _elements.every((element) => element.disabled);
  }

  @override
  void markAsDisabled({bool updateParent = true}) {
    for (final element in _elements) {
      element.markAsDisabled(updateParent: true);
    }
    super.markAsDisabled(updateParent: updateParent);
  }

  @override
  void markAsEnabled({bool updateParent = true}) {
    forEachChild((element) {
      element.markAsEnabled(updateParent: true);
    });
    super.markAsEnabled(updateParent: updateParent);
  }

  @override
  void markAsHidden({bool updateParent = true}) {
    for (final element in _elements) {
      element.markAsHidden(updateParent: true);
    }
    super.markAsHidden(updateParent: updateParent);
  }

  @override
  void markAsVisible({bool updateParent = true}) {
    forEachChild((element) {
      element.markAsVisible(updateParent: true);
    });
    super.markAsVisible(updateParent: updateParent);
  }

  void insert(int index, SectionInstance element,
      {bool updateParent = true, bool emitEvent = true}) {
    _elements.insert(index, element);
    element.parentSection = this;

    updateValueAndValidity(
      updateParent: updateParent,
    );
  }

  /// Insert a new [element] at the end of the RepeatSection.
  void add(SectionInstance element, {bool updateParent = true}) {
    addAll([element], updateParent: updateParent);
  }

  /// Appends all [elements] to the end of the RepeatSection.
  void addAll(List<SectionInstance> elements, {bool updateParent = true}) {
    _elements.addAll(elements);
    for (final element in elements) {
      element.parentSection = this;
    }

    updateValueAndValidity(updateParent: updateParent);
  }

  /// Removes and returns the child element at the given [index].
  SectionInstance removeAt(
    int index, {
    bool updateParent = true,
  }) {
    final removedElement = _elements.removeAt(index);
    removedElement.parentSection = null;
    updateValueAndValidity(
      updateParent: updateParent,
    );

    return removedElement;
  }

  void remove(
    SectionInstance element, {
    bool updateParent = true,
  }) {
    final index = _elements.indexOf(element);
    if (index == -1) {
      throw FormElementNotFoundException();
    }
    removeAt(index, updateParent: updateParent);
  }

  /// Removes all children elements from the repeatSection.
  void clear({bool updateParent = true}) {
    forEachChild((element) => element.parentSection = null);
    _elements.clear();
    updateValueAndValidity(
      updateParent: updateParent,
    );
  }

  @override
  List<Map<String, Object?>> get value => List.unmodifiable(_value!);

  /// Checks if repeatSection contains a element by a given [name].
  /// The name here must be the string representation of the children index.
  ///
  /// `i.e repeated.element('0')`
  @override
  bool contains(String name) {
    final index = int.tryParse(name);
    if (index != null && index < _elements.length) {
      return true;
    }

    return false;
  }

  int sectionIndexWhere(bool test(SectionInstance section), [int start = 0]) {
    return elements.indexWhere(test);
  }

  @override
  FormElementInstance<dynamic> element(String name) {
    final namePath = name.split('.');
    if (namePath.length > 1) {
      final element = findElementInCollection(namePath);
      if (element != null) {
        return element;
      }
    } else {
      final index = int.tryParse(name);
      if (index == null) {
        throw FormRepeatElementInvalidIndexException(name);
      } else if (index < _elements.length) {
        return _elements[index];
      }
    }
    throw FormElementNotFoundException(elementName: name);
  }

  @override
  bool anyElements(
      bool Function(FormElementInstance<dynamic> element) condition) {
    return _elements.any((element) => element.enabled && condition(element));
  }

  @override
  FormElementInstance<dynamic>? findElement(String path) =>
      findElementInCollection(path.split('.'));

  @override
  void forEachChild(
          void Function(FormElementInstance<dynamic> element) callback) =>
      _elements.forEach(callback);

  @override
  void patchValue(List<Map<String, Object?>?>? value,
      {bool updateParent = true}) {
    for (var i = 0; i < _elements.length; i++) {
      if (value == null || i < value.length) {
        _elements[i].updateValue(value?.elementAt(i), updateParent: false);
      }
    }

    updateValueAndValidity(updateParent: updateParent);
  }

  @override
  void updateValue(List<Map<String, Object?>?>? value,
      {bool updateParent = true}) {
    for (var i = 0; i < _elements.length; i++) {
      if (value == null || i < value.length) {
        _elements[i].updateValue(value?.elementAt(i), updateParent: false);
      }
    }

    if (value != null && value.length > _elements.length) {
      final newControls = value
          .toList()
          .asMap()
          .entries
          .where((entry) => entry.key >= _elements.length)
          .map((MapEntry<int, Map<String, Object?>?> entry) => SectionInstance(
              name: '',
              form: form,
              type: type,
              elements: sectionTemplate?.elements ?? {},
              properties: ElementProperties())
            ..updateValue(entry.value, updateParent: false))
          .toList();

      addAll(
        newControls,
        updateParent: updateParent,
      );
    } else {
      updateValueAndValidity(
        updateParent: updateParent,
      );
    }
  }
}
