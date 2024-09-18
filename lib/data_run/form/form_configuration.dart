import 'dart:async';

import 'package:d2_remote/core/datarun/utilities/date_utils.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mass_pro/data_run/errors_management/errors/form_does_not_exist.exception.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_configuration.g.dart';

@riverpod
Future<FormConfiguration> formConfiguration(FormConfigurationRef ref,
    {required String form, int? formVersion}) async {
  final currentForm = await D2Remote.formModule.form.byId(form).getOne();

  if (currentForm == null) {
    throw FormDoesNotExistException('formUid: $form dose not exist');
  }

  final selectedFormVersion = formVersion ?? currentForm.version;
  final FormDefinition? formDefinition = await D2Remote
      .formModule.formDefinition
      .byForm(form)
      .byVersion(selectedFormVersion)
      .getOne();

  Iterable<String> orgUnits = formDefinition?.orgUnits ?? [];

  if (formDefinition != null) {
    final assignments = await D2Remote.assignmentModuleD.assignment
        .byActivity(formDefinition.activity)
        .get();
    final assigned =
        assignments.where((a) => a.orgUnit != null).map((a) => a.orgUnit!);
    orgUnits = orgUnits.where((o) => assigned.contains(o));
  }

  return FormConfiguration(
      form: form,
      label: getItemLocalString(formDefinition?.label,
          defaultString: currentForm.name),
      version: selectedFormVersion,
      fields: formDefinition?.fields,
      options: formDefinition?.options,
      orgUnits: orgUnits.toList());
}

class FormConfiguration {
  FormConfiguration(
      {List<FieldTemplate>? sections,
      List<FieldTemplate>? fields,
      List<FormOption>? options,
      required this.form,
      required this.label,
      List<String>? orgUnits,
      required this.version})
      : this.allFields =
            IMap.fromIterable<String, FieldTemplate, FieldTemplate>(
                fields ?? [],
                keyMapper: (FieldTemplate field) => field.name,
                valueMapper: (FieldTemplate field) => field),
        this.sections = IMap.fromIterable<String, FieldTemplate, FieldTemplate>(
            sections ?? [],
            keyMapper: (FieldTemplate section) => section.name,
            valueMapper: (FieldTemplate section) => section),
        this.optionLists =
            IMap.fromIterable<String, IList<FormOption>, FormOption>(
                (options ?? [])
                  ..sort((p1, p2) => p1.sortOrder.compareTo(p2.sortOrder)),
                keyMapper: (FormOption option) => option.listName,
                valueMapper: (FormOption option) =>
                    options
                        ?.where((o) => o.listName == option.listName)
                        .toIList() ??
                    const IListConst([])),
        this.fieldRules =
            IMap.fromIterable<String, IList<Rule>?, FieldTemplate>(fields ?? [],
                keyMapper: (FieldTemplate field) => field.name,
                valueMapper: (FieldTemplate field) => field.rules?.lock),
        this.orgUnitTreeUids = orgUnits?.lock ?? IList();

  final String form;

  final String label;

  final int version;

  /// {field.name: field}
  final IMap<String, FieldTemplate> allFields;

  /// {field.name: field}
  final IMap<String, FieldTemplate> sections;

  /// {listName: List<option>}
  final IMap<String, IList<FormOption>> optionLists;

  /// {field.name: List<Rule>?}
  final IMap<String, IList<Rule>?> fieldRules;

  final IList<String> orgUnitTreeUids;

  IMap<String, FieldTemplate> get mainFields =>
      allFields.where((k, v) => v.mainField);

  bool get isSingleOrgUnit => orgUnitTreeUids.length == 1;

  FormOption? getOption(String listName, value) =>
      optionLists.get(listName)?.where((t) => t.name == value).firstOrNull;

  dynamic getUserFriendlyValue(String fieldName, dynamic value) =>
      switch (allFields.get(fieldName)) {
        FieldTemplate(type: final type, listName: final listName?)
            when type.selectTypes =>
          getItemLocalString(getOption(listName, value)?.label,
              defaultString: value),
        FieldTemplate(type: final type) when type.isDate =>
          DateUtils.format(value) ??
              DateUtils.uiDateFormat().tryParse(value ?? '') ??
              value,
        FieldTemplate(type: final type) when type.isDateTime =>
          DateUtils.dateTimeFormat().tryParse(value ?? '') ?? value,
        FieldTemplate(type: final type) when type.isTime =>
          DateUtils.twelveHourTimeFormat().tryParse(value ?? '') ?? value,
        _ => value
      };

  String getFieldDisplayName(String fieldName) =>
      getItemLocalString(allFields.get(fieldName)?.label,
          defaultString: fieldName);
}
