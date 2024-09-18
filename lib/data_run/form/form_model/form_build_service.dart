// import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:mass_pro/data_run/form/form_configuration.dart';
// import 'package:mass_pro/data_run/form/form_model/form_model.dart';
// import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';
// import 'package:d2_remote/modules/datarun/form/shared/dynamic_form_field.entity.dart';
// import 'package:reactive_forms/reactive_forms.dart';
//
// /// uses `FieldModel`s objects to dynamically build `FormGroup`
// /// or `FormArray` structures. This service can handle the
// /// initial form building, apply rules, and mapping back
// /// to the domain models
// class FormBuildService {
//   FormBuildService(
//       {required FormConfiguration formConfiguration,
//       required String submissionUid,
//       required this.formSubmissionRepository})
//       : _formConfiguration = formConfiguration,
//         _submissionUid = submissionUid;
//
//   FormConfiguration _formConfiguration;
//   final String _submissionUid;
//   final FormSubmissionList formSubmissionRepository;
//
//   FormSubmissionList _getQuery() {
//     return formSubmissionRepository;
//   }
//
//   Future<Map<String, QFieldModel>> mapEntityToModel() async {
//     final DataFormSubmission? syncableEntity =
//         await _getQuery().getSubmission(_submissionUid);
//
//     final Map<String, dynamic> entityMap = syncableEntity!.formData ?? {};
//
//     Map<String, QFieldModel> fieldsModelsMap = {};
//
//     final List<FieldTemplate> allFields = _formConfiguration.allFields.values
//         .toList()
//       ..sort((f1, f2) => f1.order.compareTo(f2.order));
//
//     for (final FieldTemplate field in allFields) {
//       final options = field.listName != null
//           ? _formConfiguration.optionLists.get(field.listName!)
//           : null;
//       fieldsModelsMap[field.name] = mapToQFieldModel(
//           field: field, value: entityMap[field.name], options: options);
//     }
//     return fieldsModelsMap;
//   }
//
//   FormGroup buildFormGroup(List<AbstractFieldModel>? fieldModels) {
//     // Example of converting a QFieldModel to a FormGroup
//     Map<String, AbstractControl> controls = {};
//
//     for (var field in fieldModels ?? <AbstractFieldModel>[]) {
//       controls[field.name] = buildFormControl(field);
//     }
//     return FormGroup(controls);
//   }
//
//   AbstractControl buildFormControl(AbstractFieldModel fieldModel) {
//     // Determine if the field is a FormControl or FormArray based on its type
//     if (fieldModel.valueType == ValueType.Section) {
//       return buildFormGroup((fieldModel as AbstractSectionModel).fields);
//     } else if (fieldModel.valueType == ValueType.RepeatableSection) {
//       // Handle RepeatableSection
//     }
//     return FormControl(
//         value: (fieldModel as QFieldModel).defaultValue,
//         validators: buildValidators(fieldModel));
//   }
//
//   List<Validator<dynamic>> buildValidators(QFieldModel fieldModel) {
//     // Convert rules from QFieldModel to Validators for FormControl
//     return [];
//   }
// }
