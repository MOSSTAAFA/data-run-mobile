import 'dart:async';

import 'package:d2_remote/core/datarun/utilities/date_utils.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_version.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:datarun/core/utils/get_item_local_string.dart';
import 'package:datarun/data_run/form/form_template/template_providers.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_configuration.g.dart';

@riverpod
Future<FormConfiguration> formConfiguration(FormConfigurationRef ref,
    {required String form, required int version}) async {
  final FormVersion? formTemplateVersion = await ref
      .watch(formVersionAsyncProvider(form: form, version: version).future);

  Iterable<String> orgUnits = formTemplateVersion?.orgUnits ?? [];

  if (formTemplateVersion != null) {
    final assignments = await D2Remote.assignmentModuleD.assignment
        .byActivity(formTemplateVersion.activity)
        .get();
    final assigned =
        assignments.where((a) => a.orgUnit != null).map((a) => a.orgUnit!);
    orgUnits = orgUnits.where((o) => assigned.contains(o));
  }

  return FormConfiguration(
      label: IMap(formTemplateVersion!.label),
      fields: formTemplateVersion.fields,
      options: formTemplateVersion.options,
      orgUnits: orgUnits.toList());
}

class FormConfiguration {
  FormConfiguration(
      {required List<FieldTemplate> fields,
      required List<FormOption> options,
      required this.label,
      required List<String> orgUnits})
      : this.allFields =
            IMap.fromIterable<String, FieldTemplate, FieldTemplate>(
                fields ?? [],
                keyMapper: (FieldTemplate field) => field.name,
                valueMapper: (FieldTemplate field) => field),
        this.optionLists =
            IMap.fromIterable<String, IList<FormOption>, FormOption>(
                (options)..sort((p1, p2) => p1.order.compareTo(p2.order)),
                keyMapper: (FormOption option) => option.listName,
                valueMapper: (FormOption option) => options
                    .where((o) => o.listName == option.listName)
                    .toIList()),
        this.orgUnitTreeUids = IList(orgUnits);

  final IMap<String, String> label;

  /// {field.path: field}
  final IMap<String, FieldTemplate> allFields;

  /// {listName: List<option>}
  final IMap<String, IList<FormOption>> optionLists;

  final IList<String> orgUnitTreeUids;

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
