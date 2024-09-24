import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:get/get.dart';
import 'package:mass_pro/commons/constants.dart';
import 'package:mass_pro/data_run/screens/form_reactive/model/form_instance.dart';
import 'package:mass_pro/data_run/screens/form_submission_screen/model/submission.provider.dart';
import 'package:mass_pro/main/usescases/bundle/bundle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_instance.provider.g.dart';

@riverpod
Future<FormInstance> formInstance(FormInstanceRef ref) async {
  final Bundle eventBundle = Get.arguments as Bundle;
  final submission = eventBundle.getString(SYNCABLE_UID);
  DataFormSubmission? formSubmission;
  late final int version;
  late final String form;

  if (submission != null) {
    formSubmission =
        await D2Remote.formModule.formSubmission.byId(submission).getOne();
    form = formSubmission!.form;

    /// get submission version
    version = formSubmission.version;
  } else {
    form = eventBundle.getString(FORM_UID)!;

    /// get latest version
    final formTemplate =
        await D2Remote.formModule.formTemplate.byId(form).getOne();
    version = formTemplate.version;
  }

  final enabled = await ref.watch(submissionEditStatusProvider.future);

  final formTemplateVersion = await D2Remote.formModule.formTemplateV
      .byVersion(version)
      .byFormTemplate(form)
      .getOne();

  return FormInstance(ref,
      enabled: enabled,
      template: formTemplateVersion!,
      submission: formSubmission);
}
