import 'package:d2_remote/modules/datarun/form/shared/rule/choice_filter.dart';
import 'package:datarun/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'field_element_model.dart';

part 'form_collection_element.dart';

part 'section_element_model.dart';

part 'repeat_element_model.dart';

part 'repeat_item_element_model.dart';

enum ElementStatus {
  /// The element has passed all validation checks.
  valid,

  /// The element has failed at least one validation check.
  invalid,

  /// This element is exempt from validation checks.
  hidden,
}

sealed class FormElementModel<T> {
  FormElementModel({
    required this.templatePath,
    T? value,
    bool valid = true,
    bool hidden = false,
    bool dirty = false,
  })  : _value = value,
        _status = hidden ? ElementStatus.hidden : ElementStatus.valid,
        _dirty = dirty;

  String get name => templatePath.split('.').last;

  final String templatePath;
  CollectionElementModel<Object>? _parent;

  T? _value;

  ElementStatus _status;

  bool _dirty;

  final Map<String, dynamic> _errors = {};
  final List<String> _dependencies = [];

  CollectionElementModel<Object>? get parent => _parent;

  T? get value => _value;

  ElementStatus get status => _status;

  bool get hidden => status == ElementStatus.hidden;

  bool get visible => !hidden;

  bool get valid => status == ElementStatus.valid;

  bool get invalid => status == ElementStatus.invalid;

  bool get dirty => _dirty;

  Map<String, Object> get errors => Map.unmodifiable(_errors);

  bool get hasErrors => errors.isNotEmpty;

  List<String> get dependencies => List.unmodifiable(_dependencies);

  void _updateValue() {
    _value = reduceValue();
  }

  // set dependencies during initialization
  void setDependencies(List<String> dependents) {
    _dependencies.clear();
    _dependencies.addAll(dependents);
  }

  set parent(CollectionElementModel<Object>? parent) {
    _parent = parent;
  }

  String get elementPath => pathRecursive;

  String get pathRecursive {
    return parent != null && parent!.name.isNotEmpty
        ? '${parent!.pathRecursive}.${name}'
        : name;
  }

  ElementStatus _calculateStatus() {
    if (allElementsHidden()) {
      return ElementStatus.hidden;
    } else if (errors.isNotEmpty) {
      return ElementStatus.invalid;
    } else if (anyElementsHaveStatus(ElementStatus.invalid)) {
      return ElementStatus.invalid;
    }

    return ElementStatus.valid;
  }

  String pathBuilder(String? pathItem) => [
        parent != null ? parent!.elementPath : null,
        pathItem
      ].whereType<String>().join('.');

  void updateValue(T? value, {bool updateParent = true, bool emitEvent = true});

  void markAsDirty({bool updateParent = true, bool emitEvent = true}) {
    _dirty = true;
    if (updateParent) {
      parent?.markAsDirty(updateParent: updateParent);
    }
  }

  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    if (hidden) {
      return;
    }

    _errors.clear();
    _status = ElementStatus.hidden;
    // if (emitEvent) {
    //   _statusChanges.add(_status);
    // }
    _updateAncestors(updateParent);
  }

  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    if (visible) {
      return;
    }
    _status = ElementStatus.valid;
    updateValueAndValidity(updateParent: true, emitEvent: emitEvent);
    _updateAncestors(updateParent);
  }

  void updateValueAndValidity({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    _updateValue();
    if (visible) {
      _status = _calculateStatus();
    }

    // if (emitEvent) {
    //   _valueChanges.add(value);
    //   _statusChanges.add(_status);
    // }

    _updateAncestors(updateParent);
  }

  void _updateAncestors(bool updateParent) {
    if (updateParent) {
      parent?.updateValueAndValidity(updateParent: updateParent);
    }
  }

  void _updateElementsErrors() {
    _status = _calculateStatus();
    // _statusChanges.add(_status);

    parent?._updateElementsErrors();
  }

  void setErrors(Map<String, dynamic> errors, {bool markAsDirty = true}) {
    _errors.clear();
    _errors.addAll(errors);

    _updateElementsErrors();

    if (markAsDirty) {
      this.markAsDirty(emitEvent: false);
    }
  }

  void removeError(String key, {bool markAsDirty = false}) {
    _errors.removeWhere((errorKey, dynamic value) => errorKey == key);
    _updateElementsErrors();

    if (markAsDirty) {
      this.markAsDirty(emitEvent: false);
    }
  }

  @protected
  bool allElementsHidden() => hidden;

  @protected
  bool anyElementsHaveStatus(ElementStatus status) => false;

  bool anyElements(bool Function(FormElementModel<dynamic>) condition);

  @protected
  void forEachChild(void Function(FormElementModel<dynamic> element) callback);

  @protected
  FormElementModel<dynamic>? findElement(String path);

  T? reduceValue();

  FormElementModel<dynamic> clone();
}
