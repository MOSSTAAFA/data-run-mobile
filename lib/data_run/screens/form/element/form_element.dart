import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/action.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mass_pro/commons/logging/logging.dart';
import 'package:mass_pro/data_run/screens/form/element/extension/rule.extension.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_control_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/exceptions/form_element_exception.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/form_value_map.dart';
import 'package:mass_pro/data_run/screens/form/element/members/form_element_members.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'field_instance.dart';

part 'section_element.dart';

part 'section_instance.dart';

part 'repeat_instance.dart';

part 'repeat_item_instance.dart';

part 'extension/element.extension.dart';

part 'extension/element_dependency.extension.dart';

sealed class FormElementInstance<T> with EquatableMixin {
  FormElementInstance(
      {required this.form,
      required this.template,
        required this.path,
        required this.formValueMap,
      ElementProperties? properties})
      : _properties = properties ??
            ElementProperties(
                mandatory: template.mandatory,
                order: template.order,
                label: getItemLocalString(template.label,
                    defaultString: template.name));


  @override
  List<Object> get props => [properties];

  /// serialized from the field json configuration
  final FieldTemplate template;

  final FormGroup form;

  bool _isEvaluating = false;

  String? path;

  final Map<String, FormElementInstance<dynamic>> _dependents = {};
  final Map<String, FormElementInstance<dynamic>> _dependencies = {};

  Iterable<RuleAction> get elementRuleActions => template.ruleActions();

  List<RuleAction> get inEffectRuleActions => elementRuleActions
      .where((ruleAction) => ruleAction.shouldApply(evalContext))
      .toList();

  Map<String, FormElementInstance<dynamic>> get dependents =>
      Map.unmodifiable(_dependents);

  Map<String, FormElementInstance<dynamic>> get dependencies =>
      Map.unmodifiable(_dependencies);

  String get name => template.name;

  ValueType get type => template.type;

  FormElementInstance<Object>? _parentSection;

  FormElementInstance<Object>? get parentSection => _parentSection;

  set parentSection(FormElementInstance<Object>? parent) {
    _parentSection = parent;
  }

  ElementProperties _properties;

  final FormValueMap formValueMap;

  ElementProperties get properties => _properties;

  bool get hidden => properties.hidden;

  bool get visible => !hidden;

  bool get mandatory => properties.mandatory;

  String get elementPath => pathBuilder(name);

  T? get value => elementControl?.value;

  AbstractControl<dynamic>? get elementControl =>
      controlExist ? form.control(elementPath) : null;

  void get focus => elementControl?.focus();

  String pathBuilder(String? pathItem) =>
      [parentSection?.elementPath, pathItem].whereType<String>().join('.');

  bool get controlExist {
    try {
      form.control(elementPath);
      return true;
    } catch (e) {
      return false;
    }
  }


  void updateValue(T? value, {bool updateParent = true, bool emitEvent = true});

  @protected
  bool allElementsHidden() => hidden;

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
    // elementControl?.dispose();
    // _dependencies.values.forEach((FormElementInstance<dynamic> d) {
    //
    // });
  }

  void markAsHidden({bool updateParent = true, bool emitEvent = true}) {
    if (hidden) {
      return;
    }
    _properties = _properties.copyWith(hidden: true);
  }

  void markAsVisible({bool updateParent = true, bool emitEvent = true}) {
    if (visible) {
      return;
    }
    _properties = _properties.copyWith(hidden: false);
  }

  void markAsMandatory({bool updateParent = true, bool emitEvent = true}) {
    if (mandatory) {
      return;
    }
    _properties = _properties.copyWith(mandatory: true);
  }

  void markAsUnMandatory({bool updateParent = true, bool emitEvent = true}) {
    if (!mandatory) {
      return;
    }
    _properties = _properties.copyWith(mandatory: false);
  }

  void toggleVisibility() {
    if (visible) {
      markAsHidden();
    } else {
      markAsVisible();
    }
  }
}
