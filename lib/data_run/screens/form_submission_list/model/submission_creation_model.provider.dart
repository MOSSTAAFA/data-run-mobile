import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_element_template.dart';
import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
import 'package:mass_pro/data_run/screens/form_module/model/form_element.dart';
import 'package:mass_pro/data_run/screens/form/reactive_field/reactive_ou/ou_data_source.provider.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form_ui_elements/org_unit_picker/model/tree_node_data_source.dart';
import 'package:mass_pro/data_run/screens/project_activity_detail/model/project_activities.provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submission_creation_model.provider.g.dart';

@riverpod
Future<SubmissionCreationModel> submissionCreationModel(
    SubmissionCreationModelRef ref,
    {required FormMetadata formMetaData}) async {
  final template = await D2Remote.formModule.formTemplateV
      .byVersion(formMetaData.version)
      .byFormTemplate(formMetaData.form)
      .getOne();

  final FormGroup form = FormGroup({
    '_${AttributeType.orgUnit.name}': FormControl<String>(
        value: template?.orgUnits.length == 1 ? template?.orgUnits.first : null,
        validators: [Validators.required])
  });

  final team =
      await ref.watch(activityTeamProvider(formMetaData.activity).future);

  final TreeNodeDataSource dataSource = await ref
      .watch(ouPickerDataSourceProvider(formMetaData: formMetaData).future);
  final FormFieldElement<String> ouElement = FormFieldElement(
      form: form,
      template: FieldTemplate(
          mandatory: true,
          mainField: true,
          type: ValueType.OrganisationUnit,
          name: '_${AttributeType.orgUnit.name}'));

  return SubmissionCreationModel(
    dataSource: dataSource,
    form: form,
    team: team!.uid!,
    ouElement: ouElement,
  );
}

class SubmissionCreationModel {
  SubmissionCreationModel(
      {required this.form,
      required this.dataSource,
      required this.team,
      required this.ouElement});

  final FormGroup form;
  final TreeNodeDataSource dataSource;
  final String team;
  final FormFieldElement<String> ouElement;
}
