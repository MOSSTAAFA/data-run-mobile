import 'dart:async';

import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_org_unit.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
import 'package:d2_remote/modules/metadatarun/org_unit/entities/org_unit.entity.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/errors_management/errors/form_does_not_exist.exception.dart';
import 'package:mass_pro/data_run/utils/get_item_local_string.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_configuration.g.dart';

@riverpod
Future<FormConfiguration> formConfiguration(FormConfigurationRef ref,
    {required String form, int? formVersion}) async {
  // final Bundle? eventBundle = Get.arguments;
  // final String? submissionUid = eventBundle?.getString(SYNCABLE_UID);

  // final formVersion = await ref
  //     .watch(formVersionProvider(form, submissionUid: submissionUid).future);

  final currentForm = await D2Remote.formModule.form.byId(form).getOne();

  if (currentForm == null) {
    throw FormDoesNotExistException('formUid: $form dose not exist');
  }

  final selectedFormVersion = formVersion ?? currentForm.version;
  final FormDefinition? formDefinition = await D2Remote
      .formModule.formDefinition
      .byForm(form)
      .byVersion(selectedFormVersion)
      .withOrganisationUnit()
      .getOne();

  return FormConfiguration(
      form: form,
      label: getItemLocalString(formDefinition?.label,
          defaultString: currentForm.name),
      version: selectedFormVersion,
      fields: formDefinition?.fields,
      options: formDefinition?.options,
      orgUnits: formDefinition?.formOrgUnits);
}

class FormConfiguration {
  FormConfiguration(
      {List<DynamicFormField>? fields,
      List<FormOption>? options,
      required this.form,
      required this.label,
      List<FormOrgUnit>? orgUnits,
      required this.version})
      : this.allFields =
            IMap.fromIterable<String, DynamicFormField, DynamicFormField>(
                fields ?? [],
                keyMapper: (DynamicFormField field) => field.name,
                valueMapper: (DynamicFormField field) => field),
        this.optionLists =
            IMap.fromIterable<String, IList<FormOption>, FormOption>(
                options ?? [],
                keyMapper: (FormOption option) => option.listName,
                valueMapper: (FormOption option) =>
                    options
                        ?.where((o) => o.listName == option.listName)
                        .toIList() ??
                    const IListConst([])),
        this.fieldRules =
            IMap.fromIterable<String, IList<Rule>?, DynamicFormField>(
                fields ?? [],
                keyMapper: (DynamicFormField field) => field.name,
                valueMapper: (DynamicFormField field) => field.rules?.lock),
        this.orgUnits = orgUnits?.lock ?? IList();

  final String form;

  final String label;

  final int version;

  /// {field.name: field}
  final IMap<String, DynamicFormField> allFields;

  /// {listName: List<option>}
  final IMap<String, IList<FormOption>> optionLists;

  /// {field.name: List<Rule>?}
  final IMap<String, IList<Rule>?> fieldRules;

  final IList<FormOrgUnit> orgUnits;

  IMap<String, DynamicFormField> get mainFields =>
      allFields.where((k, v) => v.mainField);

  bool get isSingleOrgUnit => orgUnits.length == 1;

  String getFieldDisplayName(String fieldName) =>
      getItemLocalString(allFields.get(fieldName)?.label,
          defaultString: fieldName);
}
