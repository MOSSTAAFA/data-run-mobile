import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:mass_pro/data_run/form/form_submission/submission_list.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_elements_factories.provider.g.dart';

@riverpod
Future<Map<String, dynamic>?> formInitialData(FormInitialDataRef ref,
    {required String submission}) async {
  final DataFormSubmission? formSubmission = await ref
      .watch(formSubmissionRepositoryProvider)
      .getSubmission(submission);

  return formSubmission!.formData;
}

// @riverpod
// Future<Map<String, FormElementInstance<dynamic>>> formElements(
//     FormElementsRef ref,
//     {required FormValueMap formValueMap}) async {
//   final Map<String, FormElementInstance<dynamic>> elements = {};
//
//   final Map<String, dynamic>? initialValue =
//       await ref.watch(formInitialDataProvider.future);
//   final formElementTemplate = ref.watch(formFlatTemplateProvider);
//
//   for (var element in formElementTemplate.formTemplate.fields) {
//     elements[element.name] = FromElementFactory.createElementInstance(
//         form, element,
//         savedValue: initialValue?[element.name], formValueMap: formValueMap);
//   }
//   return elements;
// }
