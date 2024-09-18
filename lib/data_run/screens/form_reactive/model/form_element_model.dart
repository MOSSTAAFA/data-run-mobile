import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:dartx/dartx.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_control_factory.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_exception.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_element_members.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

sealed class FormElementInstance<T> with ElementAttributesMixin {
  FormElementInstance(
      {required this.name,
      required this.type,
      required this.form,
      this.parentSection,
      this.path,
      required this.template,
      T? value,
      ElementProperties? properties})
      : _value = value,
        _properties = properties ?? ElementProperties();
  final FieldTemplate template;

  final String? path;
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

  AbstractControl<dynamic> get elementControl;

  String get elementPath;

  void _updateValue() {
    _value = reduceValue();
  }

  void _updateAncestors(bool updateParent) {
    if (updateParent) {
      parentSection?.updateValueAndValidity(updateParent: updateParent);
    }
  }

  void updateValueAndValidity(
      {bool updateParent = true, bool emitEvent = true}) {
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

  void updateValue(T? value, {bool updateParent = true, bool emitEvent = true});

  void patchValue(T? value, {bool updateParent = true, bool emitEvent = true});

  void reset({
    T? value,
    bool? disabled,
    bool? hidden,
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    updateValue(value, updateParent: updateParent, emitEvent: emitEvent);
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

  void markAsEnabled({bool updateParent = true, bool emitEvent = true}) {
    if (enabled) {
      return;
    }
    _properties = _properties.copyWith(disabled: true);
    _updateAncestors(updateParent);
  }

  void markAsDisabled({bool updateParent = true, bool emitEvent = true}) {
    if (disabled) {
      return;
    }
    _properties = _properties.copyWith(disabled: false);
    _updateAncestors(updateParent);
  }

  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    if (hidden) {
      return;
    }
    _properties = _properties.copyWith(hidden: true);
    _updateAncestors(updateParent);
  }

  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    if (visible) {
      return;
    }
    _properties = _properties.copyWith(hidden: false);
    _updateAncestors(updateParent);
  }

  String get pathRecursive {
    return parentSection != null
        ? '${parentSection!.pathRecursive}.${name}'
        : name;
  }

  String pathBuilder(String? pathItem) => [
        parentSection != null ? parentSection!.pathRecursive : null,
        pathItem
      ].whereType<String>().join('.');

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

  void dispose() {
    // _statusChanges.close();
    // _valueChanges.close();
    // _asyncValidationSubscription?.cancel();
  }
}

class FieldInstance<T> extends FormElementInstance<T> {
  FieldInstance({
    required super.name,
    required super.type,
    super.properties,
    super.parentSection,
    required super.form,
    required super.template,
    T? value,
    this.defaultValue,
    this.listName,
    this.choiceFilter,
    super.path,
    List<FormOption> options = const [],
    Map<String, ValidationMessageFunction> validationMessages = const {},
  }) {
    /*if (value != null)*/ this._value = value;
    this.options.addAll(options);
    this.validationMessages.addAll(validationMessages);
  }

  final dynamic defaultValue;
  final String? listName;
  final String? choiceFilter;
  final List<FormOption> options = [];
  final Map<String, ValidationMessageFunction> validationMessages = {};

  @override
  void updateValue(T? value,
      {bool updateParent = true, bool emitEvent = true}) {
    if (_value != value) {
      _value = value;
      updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
    }
  }

  @override
  void patchValue(T? value, {bool updateParent = true, bool emitEvent = true}) {
    updateValue(value, updateParent: updateParent, emitEvent: emitEvent);
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

  @override
  void dispose() {
    // _focusChanges.close();
    super.dispose();
  }

  void get fieldFocus => form.focus(elementPath);

  /// stockItemsControl
  FormControl<T> get elementControl =>
      form.control(elementPath) as FormControl<T>;

  void updateFieldValue(
    FieldInstance<T> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    updateValue(value.value, updateParent: updateParent, emitEvent: emitEvent);

    elementControl.updateValue(
      value.value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  @override
  String get elementPath => pathBuilder(name);
}

/// SectionElement is a Form Element representing the
/// father of either a [SectionInstance] element or a [RepeatSection] element
sealed class SectionElement<T> extends FormElementInstance<T> {
  SectionElement({
    required super.name,
    required super.type,
    required super.template,
    required super.properties,
    bool expanded = true,
    super.value,
    super.parentSection,
    super.path,
    required super.form,
  }) : _expanded = expanded;

  bool _expanded;

  bool get expanded => _expanded;

  void set expanded(bool expanded) => _expanded = expanded;

  void toggleExpansion() {
    if (expanded) {
      expanded = false;
    } else {
      expanded = true;
    }
  }

  FormElementInstance<dynamic> element(String name);

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
  SectionInstance({
    required super.name,
    required super.type,
    required super.properties,
    super.parentSection,
    required super.template,
    required super.form,
    super.expanded,
    super.path,
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

  final Map<String, FormElementInstance<dynamic>> _elements = {};

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
  void markAsDisabled({bool updateParent = true, bool emitEvent = true}) {
    _elements.forEach((_, element) {
      element.markAsDisabled(updateParent: true);
    });
    super.markAsDisabled(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void markAsEnabled({bool updateParent = true, bool emitEvent = true}) {
    _elements.forEach((_, element) {
      element.markAsEnabled(updateParent: true);
    });
    super.markAsEnabled(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    _elements.forEach((_, element) {
      element.markAsHidden(updateParent: true);
    });
    super.markAsHidden(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    _elements.forEach((_, element) {
      element.markAsVisible();
    });
    super.markAsVisible(updateParent: updateParent, emitEvent: emitEvent);
  }

  /// Appends all [elements] to the group.
  void addAll(Map<String, FormElementInstance<dynamic>> elements) {
    _elements.addAll(elements);
    elements.forEach((name, element) {
      element.parentSection = this;
    });
    updateValueAndValidity();
    // updateTouched();
    // updatePristine();
    // emitsCollectionChanged(_controls.values.toList());
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
  void updateValue(Map<String, Object?>? value,
      {bool updateParent = true, bool emitEvent = true}) {
    value ??= {};

    for (final key in _elements.keys) {
      _elements[key]!.updateValue(
        value[key],
        updateParent: false,
        emitEvent: emitEvent,
      );
    }
    updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void patchValue(Map<String, Object?>? value,
      {bool updateParent = true, bool emitEvent = true}) {
    value?.forEach((name, value) {
      if (_elements.containsKey(name)) {
        _elements[name]!.patchValue(
          value,
          updateParent: false,
          emitEvent: emitEvent,
        );
      }
    });

    updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
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

  void removeElement(String name,
      {bool updateParent = true, bool emitEvent = true}) {
    if (!_elements.containsKey(name)) {
      throw FormElementNotFoundException(elementName: name);
    }

    _elements.removeWhere((key, value) => key == name);
    updateValueAndValidity(updateParent: updateParent, emitEvent: emitEvent);
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

  @override
  void dispose() {
    forEachChild((element) {
      element.parentSection = null;
      // element.dispose();
    });
    // closeCollectionEvents();
    super.dispose();
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  void addElement(FormElementInstance<dynamic> element) {
    addAll({element.name: element});
    elementControl.addAll({
      element.name: FromElementControlFactory.createElementControl(element)
    });
  }

  void addElements(Map<String, FormElementInstance<dynamic>> elements) {
    elements.mapValues((e) => addElement(e.value));
  }

  void get sectionFocus => form.focus(elementPath);

  void updateSectionValue(
    SectionInstance value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    updateValue(value.rawValue,
        updateParent: updateParent, emitEvent: emitEvent);

    elementControl.updateValue(
      value.rawValue,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  @override
  FormGroup get elementControl => form.control(elementPath) as FormGroup;

  bool get repeatParent => (parentSection is RepeatSectionInstance);

  String get pathRecursive {
    String? parentPath;
    if (parentSection != null) {
      parentPath = '${parentSection!.pathRecursive}';
      if (repeatParent) {
        int sectionIndex = (parentSection as RepeatSectionInstance)
            .sectionIndexWhere((section) => section == this);
        return '${parentPath}.$sectionIndex';
      }
      return '${parentSection!.pathRecursive}.${name}';
    }
    return name;
  }

  @override
  String get elementPath => repeatParent ? pathRecursive : pathBuilder(name);
}

class RepeatSectionInstance
    extends SectionElement<List<Map<String, Object?>?>> {
  RepeatSectionInstance(
      {required super.name,
      required super.type,
      ElementProperties? properties,
      required super.template,
      required super.form,
      super.path,
      super.parentSection,
      super.expanded = false,
      List<FormElementInstance<Map<String, Object?>?>> elements = const []})
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

  // final List<SectionInstance> _elements = [];
  final List<FormElementInstance<Map<String, Object?>?>> _elements = [];

  /// Gets the list of child elements.
  List<FormElementInstance<Map<String, Object?>?>> get elements =>
      List.unmodifiable(_elements);

  @override
  List<Map<String, Object?>?> get rawValue =>
      _elements.map<Map<String, Object?>?>((control) {
        if (control is FormControlCollection<Map<String, Object?>?>) {
          return (control as FormControlCollection<Map<String, Object?>?>)
              .rawValue;
        }

        return control.value;
      }).toList();

  @override
  List<Map<String, Object?>?>? reduceValue() {
    return _elements
        .where((control) => control.enabled || disabled)
        .map((control) => control.value)
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
  void markAsDisabled({bool updateParent = true, bool emitEvent = true}) {
    for (final element in _elements) {
      element.markAsDisabled(updateParent: true);
    }
    super.markAsDisabled(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void markAsEnabled({bool updateParent = true, bool emitEvent = true}) {
    forEachChild((element) {
      element.markAsEnabled(updateParent: true);
    });
    super.markAsEnabled(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    for (final element in _elements) {
      element.markAsHidden(updateParent: true);
    }
    super.markAsHidden(updateParent: updateParent, emitEvent: emitEvent);
  }

  @override
  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    forEachChild((element) {
      element.markAsVisible(updateParent: true);
    });
    super.markAsVisible(updateParent: updateParent, emitEvent: emitEvent);
  }

  void insert(
    int index,
    SectionInstance element, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    _elements.insert(index, element);
    element.parentSection = this;

    updateValueAndValidity(
      emitEvent: emitEvent,
      updateParent: updateParent,
    );

    // if (emitEvent) {
    //   emitsCollectionChanged(_controls);
    // }
  }

  /// Insert a new [element] at the end of the RepeatSection.
  void add(FormElementInstance<Map<String, Object?>?> element,
      {bool updateParent = true, bool emitEvent = true}) {
    addAll([element], emitEvent: emitEvent, updateParent: updateParent);
  }

  /// Appends all [elements] to the end of the RepeatSection.
  void addAll(List<FormElementInstance<Map<String, Object?>?>> elements,
      {bool updateParent = true, bool emitEvent = true}) {
    _elements.addAll(elements);
    for (final element in elements) {
      element.parentSection = this;
    }

    updateValueAndValidity(
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
    // emitsCollectionChanged(_controls);
  }

  /// Removes and returns the child element at the given [index].
  void remove(
    FormElementInstance<Map<String, Object?>?> element, {
    bool emitEvent = true,
    bool updateParent = true,
  }) {
    final index = _elements.indexOf(element);
    if (index == -1) {
      throw FormControlNotFoundException();
    }
    removeAt(index, emitEvent: emitEvent, updateParent: updateParent);
  }

  FormElementInstance<Map<String, Object?>?> removeAt(
    int index, {
    bool emitEvent = true,
    bool updateParent = true,
  }) {
    final removedElement = _elements.removeAt(index);
    removedElement.parentSection = null;
    updateValueAndValidity(
      emitEvent: emitEvent,
      updateParent: updateParent,
    );

    // if (emitEvent) {
    //   emitsCollectionChanged(_controls);
    // }

    return removedElement;
  }

  /// Removes all children elements from the repeatSection.
  void clear({bool emitEvent = true, bool updateParent = true}) {
    forEachChild((element) => element.parentSection = null);
    _elements.clear();
    updateValueAndValidity(
      emitEvent: emitEvent,
      updateParent: updateParent,
    );

    // if (emitEvent) {
    //   emitsCollectionChanged(_controls);
    // }
  }

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

  int sectionIndexWhere(bool test(FormElementInstance<dynamic> section),
      [int start = 0]) {
    return elements.indexWhere(test);
  }

  @override
  FormElementInstance<dynamic> element(String name) {
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
  void patchValue(
    List<Map<String, Object?>?>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    for (var i = 0; i < _elements.length; i++) {
      if (value == null || i < value.length) {
        _elements[i].updateValue(
          value?.elementAt(i),
          updateParent: false,
          emitEvent: emitEvent,
        );
      }
    }

    updateValueAndValidity(updateParent: updateParent);
  }

  @override
  void updateValue(List<Map<String, Object?>?>? value,
      {bool updateParent = true, bool emitEvent = true}) {
    for (var i = 0; i < _elements.length; i++) {
      if (value == null || i < value.length) {
        _elements[i].updateValue(
          value?.elementAt(i),
          updateParent: false,
          emitEvent: emitEvent,
        );
      }
    }

    if (value != null && value.length > _elements.length) {
      final newControls = value
          .toList()
          .asMap()
          .entries
          .where((MapEntry<int, Map<String, Object?>?> entry) =>
              entry.key >= _elements.length)
          .map((MapEntry<int, Map<String, Object?>?> entry) =>
              FromElementFactory.createSectionInstance(form, template,
                  savedValue: entry.value))
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

  @override
  void dispose() {
    forEachChild((element) {
      element.parentSection = null;
      element.dispose();
    });
    // closeCollectionEvents();
    super.dispose();
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  void get repeatSectionFocus => form.focus(elementPath);

  /// stockItemsRepeatedStockItemForm
  /// create the items list empty with length = count of items
  // List<Map<String, Object?>?> get repeatSectionItems
  List<SectionInstance> get repeatSectionItems {
    final values = (elementControl.controls).map((e) => e.value).toList();

    return values
        .asMap()
        .map((k, Map<String, Object?>? v) => MapEntry(
            k,
            SectionInstance(
                form: form,
                path: pathBuilder('stockItems.$k'),
                name: '',
                template: template,
                type: ValueType.Section,
                properties: ElementProperties())
              ..value = v))
        .values
        .toList();
  }

  ExtendedControl<List<Map<String, Object?>?>, List<SectionInstance>>
      get repeatSectionExtendedControl =>
          ExtendedControl<List<Map<String, Object?>?>, List<SectionInstance>>(
              form.control(elementPath) as FormArray<Map<String, Object?>>,
              () => repeatSectionItems);

  ///
  void addRepeatSectionItem(SectionInstance value) {
    add(value);
    elementControl.add(FromElementControlFactory.createSectionControl(value));
  }

  void addRepeatSectionItemList(List<SectionInstance> value) {
    value.map((e) => addRepeatSectionItem(e));
  }

  void removeRepeatSectionItemAtIndex(int i) {
    if ((elementControl.value ?? []).length > i) {
      elementControl.removeAt(i);
      removeAt(i);
    }
  }

  void repeatSectionClear({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    // repeatedSectionItems.clear();
    elementControl.clear(updateParent: updateParent, emitEvent: emitEvent);
    clear(updateParent: updateParent, emitEvent: emitEvent);
  }

  void updateRepeatSectionValue(
    List<SectionInstance> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final List<SectionInstance> localValue = (value);
    if (localValue.isEmpty) {
      repeatSectionClear(updateParent: updateParent, emitEvent: emitEvent);
      return;
    }

    final toUpdate = <SectionInstance>[];
    final toAdd = <SectionInstance>[];

    localValue.asMap().forEach((int k, SectionInstance v) {
      final List<Map<String, Object?>?> controlValues =
          elementControl.controls.map((e) => e.value).toList();

      if (repeatSectionItems.asMap().containsKey(k) &&
          controlValues.asMap().containsKey(k)) {
        toUpdate.add(v);
      } else {
        toAdd.add(v);
      }
    });

    if (toUpdate.isNotEmpty) {
      elementControl.updateValue(
          toUpdate
              .map((e) =>
                  FromElementControlFactory.createSectionControl(e).rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
      updateValue(toUpdate.map((e) => e.rawValue).toList(),
          updateParent: updateParent, emitEvent: emitEvent);
    }

    if (toAdd.isNotEmpty) {
      toAdd.forEach((e) {
        elementControl.add(FromElementControlFactory.createSectionControl(e),
            updateParent: updateParent, emitEvent: emitEvent);
        add(e);
      });
    }
  }

  void repeatSectionItemInsert(
    int i,
    SectionInstance value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final List<Map<String, Object?>?> values =
        (elementControl.controls).map((e) => e.value).toList();
    if (values.length < i) {
      addRepeatSectionItem(value);
      return;
    }

    elementControl.insert(
      i,
      FromElementControlFactory.createSectionControl(value),
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
    insert(
      i,
      value,
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void repeatSectionValuePatch(
    List<SectionInstance> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final keys = repeatSectionItems.asMap().keys;

    final toPatch = <SectionInstance>[];
    (value).asMap().forEach(
      (k, v) {
        if (keys.contains(k)) {
          toPatch.add(v);
        }
      },
    );

    elementControl.patchValue(
        toPatch
            .map((e) =>
                FromElementControlFactory.createSectionControl(e).rawValue)
            .toList(),
        updateParent: updateParent,
        emitEvent: emitEvent);
  }

  void repeatSectionValueReset(
    List<SectionInstance> value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      elementControl.reset(
          value: value
              .map((e) =>
                  FromElementControlFactory.createSectionControl(e).rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);

  void repeatSectionSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      markAsDisabled(updateParent: updateParent, emitEvent: emitEvent);
      elementControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
      elementControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  FormArray<Map<String, Object?>> get elementControl =>
      form.control(elementPath) as FormArray<Map<String, Object?>>;

  @override
  String get elementPath => pathBuilder(name);
}
