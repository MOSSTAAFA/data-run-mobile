import 'dart:convert';

import 'package:d2_remote/modules/datarun/form/entities/form_version.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/reference_field_info.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule/rule.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/cupertino.dart';
import 'package:datarun/data_run/screens/form_module/form_template/flat_template_factory.dart';
import 'package:datarun/data_run/screens/form_module/form_template/path_walking_service.dart';

@immutable
class FormFlatTemplate with PathWalkingService {
  factory FormFlatTemplate.fromTemplate(FormVersion template) {
    return FormFlatTemplate(
        formTemplate: template,
        fields: FlatTemplateFactory.flatTemplateWithPath(template.fields));
  }

  FormFlatTemplate({
    required this.formTemplate,
    List<FormElementTemplate> fields = const [],
  }) : this._optionLists = Map.fromIterable(
            (formTemplate.options)
              ..sort((p1, p2) => p1.order.compareTo(p2.order)),
            key: (option) => option.listName,
            value: (option) => formTemplate.options
                .where((o) => o.listName == option.listName)
                .toList()) {
    _flatFields.addAll(fields);
  }

  final FormVersion formTemplate;
  final List<FormElementTemplate> _flatFields = [];

  /// {listName: List<option>}
  final Map<String, List<FormOption>> _optionLists;

  String get name => formTemplate.name!;

  String? get code => formTemplate.code;

  String get defaultLocal => formTemplate.defaultLocal;

  String get activity => formTemplate.activity;

  int get version => formTemplate.version;

  List<FormElementTemplate> get fields => List.unmodifiable(_flatFields);

  Map<String, List<FormOption>> get optionLists =>
      Map.unmodifiable(_optionLists);

  // List<DOptionSet> get optionSets => List.unmodifiable(formTemplate.optionSets);

  Map<String, String> get label => Map.unmodifiable(formTemplate.label);

  List<String> get orgUnits => List.unmodifiable(formTemplate.orgUnits);
}

@immutable
sealed class FormElementTemplate
    with TreeElement, EquatableMixin, ElementAttributesMixin {
  FormElementTemplate({
    required this.type,
    required this.name,
    required this.path,
    this.order = 0,
    this.fieldValueRenderingType,
    Iterable<Rule>? rules,
    IMap<String, String>? label,
    Iterable<String>? ruleDependencies = const [],
  })  : this.rules = IList.orNull(rules) ?? IList(),
        this.label = label ?? IMap(),
        this.ruleDependencies = IList.orNull(ruleDependencies) ?? IList();
  final ValueType type;
  final String name;
  final String? path;
  final int order;
  final String? fieldValueRenderingType;
  final IMap<String, String> label;
  final IList<Rule> rules;

  String? get parentPath {
    final pathSegments = path?.split('.') ?? [];
    if (pathSegments.length > 1) {
      final parentPath =
      pathSegments.sublist(0, pathSegments.length - 1).join('.');
      return parentPath;
    }
    return null;
  }

  /// <name, path>
  final IList<String> ruleDependencies;

  @override
  List<Object?> get props =>
      [type, name, path, order, rules, label, fieldValueRenderingType];

  Map<String, dynamic> toMap() {
    return {
      'type': this.type.name,
      'name': this.name,
      'path': this.path,
      'order': this.order,
      'rules': jsonEncode(rules.map((rule) => rule.toJson()).toList()),
    };
  }
}

@immutable
class FieldElementTemplate extends FormElementTemplate {
  FieldElementTemplate({
    required super.type,
    required super.name,
    required super.path,
    super.order,
    super.fieldValueRenderingType,
    super.rules,
    super.ruleDependencies,
    super.label,
    required this.mandatory,
    required this.mainField,
    this.calculation,
    this.listName,
    this.referenceInfo,
    this.choiceFilter,
    this.defaultValue,
    this.attributeType,
    Iterable<FormOption>? options,
    Iterable<String>? filterDependencies = const [],
  })  : this.options = IList.orNull(options) ?? IList(),
        this.filterDependencies = IList.orNull(filterDependencies) ?? IList(),
        assert((path ?? '').isNotEmpty);
  final String? listName;
  final bool mainField;
  final bool mandatory;
  final ReferenceInfo? referenceInfo;
  final String? choiceFilter;
  final dynamic defaultValue;
  final AttributeType? attributeType;
  final String? calculation;
  final IList<FormOption> options;

  Iterable<Map<String, dynamic>> get optionContext =>
      options.map((option) => option.toContext());

  /// <name, path>
  final IList<String> filterDependencies;

  //
  // @override
  // List<Object?> get props => super.props
  //   ..addAll([
  //     listName,
  //     choiceFilter,
  //     mandatory,
  //     calculation,
  //     defaultValue,
  //     options
  //   ]);

  FieldElementTemplate copyWith({
    ValueType? type,
    String? name,
    String? path,
    int? order,
    String? fieldValueRenderingType,
    IMap<String, String>? label,
    Iterable<Rule>? rules,
    Iterable<String>? ruleDependencies,
    String? listName,
    bool? mainField,
    bool? mandatory,
    ReferenceInfo? referenceInfo,
    String? choiceFilter,
    dynamic defaultValue,
    AttributeType? attributeType,
    String? calculation,
    Iterable<FormOption>? options,
    Iterable<String>? filterDependencies,
  }) {
    return FieldElementTemplate(
      type: type ?? this.type,
      name: name ?? this.name,
      path: path ?? this.path,
      order: order ?? this.order,
      fieldValueRenderingType:
          fieldValueRenderingType ?? this.fieldValueRenderingType,
      label: label ?? this.label,
      rules: rules ?? this.rules,
      ruleDependencies: ruleDependencies ?? this.ruleDependencies,
      listName: listName ?? this.listName,
      mainField: mainField ?? this.mainField,
      mandatory: mandatory ?? this.mandatory,
      referenceInfo: referenceInfo ?? this.referenceInfo,
      choiceFilter: choiceFilter ?? this.choiceFilter,
      defaultValue: defaultValue ?? this.defaultValue,
      attributeType: attributeType ?? this.attributeType,
      calculation: calculation ?? this.calculation,
      options: options ?? this.options,
      filterDependencies: filterDependencies ?? this.filterDependencies.unlock,
    );
  }
}

/// represent a Section or RepeatableSection, the ValueType tell which on it is
@immutable
class SectionElementTemplate extends FormElementTemplate {
  SectionElementTemplate(
      {required super.type,
      required super.name,
      required super.path,
      super.order,
      super.fieldValueRenderingType,
      super.ruleDependencies,
      super.rules,
      super.label,
      this.itemTitle})
      : assert((path ?? '').isNotEmpty);

  final String? itemTitle;

  @override
  List<Object?> get props => super.props..addAll([itemTitle]);

  SectionElementTemplate copyWith({
    ValueType? type,
    String? name,
    String? path,
    int? order,
    String? fieldValueRenderingType,
    Iterable<Rule>? rules,
    String? itemTitle,
    IMap<String, String>? label,
    Iterable<String>? ruleDependencies,
  }) {
    return SectionElementTemplate(
      type: type ?? this.type,
      name: name ?? this.name,
      path: path ?? this.path,
      order: order ?? this.order,
      fieldValueRenderingType:
          fieldValueRenderingType ?? this.fieldValueRenderingType,
      label: label ?? this.label,
      rules: rules ?? this.rules,
      ruleDependencies: ruleDependencies ?? this.ruleDependencies,
      itemTitle: itemTitle ?? this.itemTitle,
    );
  }

  @override
  bool get mandatory => false;
}
