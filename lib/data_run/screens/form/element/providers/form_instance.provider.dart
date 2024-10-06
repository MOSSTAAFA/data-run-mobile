import 'dart:io';

import 'package:d2_remote/d2_remote.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:mass_pro/data_run/screens/form/element/service/device_info_service.dart';
import 'package:mass_pro/data_run/screens/form/element/form_instance.dart';
import 'package:mass_pro/data_run/screens/form/element/service/form_instance_service.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_instance.provider.g.dart';

@riverpod
Future<bool> submissionEditStatus(SubmissionEditStatusRef ref,
    {required String submission}) async {
  ref.submission;
  return D2Remote.formModule.formSubmission.byId(submission).canEdit();
}

@riverpod
Future<AndroidDeviceInfoService> deviceInfoService(
    DeviceInfoServiceRef ref) async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo =
      Platform.isAndroid ? await deviceInfoPlugin.androidInfo : null;
  return AndroidDeviceInfoService(deviceInfo: deviceInfo);
}

@riverpod
Future<FormInstanceService> formInstanceService(FormInstanceServiceRef ref,
    {required FormMetadata formMetaData, String? orgUnit}) async {
  final formTemplate = await D2Remote.formModule.formTemplateV
      .byVersion(formMetaData.version)
      .byFormTemplate(formMetaData.form)
      .getOne();
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo =
      Platform.isAndroid ? await deviceInfoPlugin.androidInfo : null;
  final deviceService = AndroidDeviceInfoService(deviceInfo: deviceInfo);

  return FormInstanceService(
    template: formTemplate!,
    formMetadata: formMetaData,
    deviceInfoService: deviceService,
    orgUnit: orgUnit,
  );
}

@riverpod
Future<FormInstance> formInstance(FormInstanceRef ref,
    {required FormMetadata formMetaData}) async {
  final submission = await D2Remote.formModule.formSubmission
      .byId(formMetaData.submission!)
      .getOne();

  final enabled = await D2Remote.formModule.formSubmission
      .byId(formMetaData.submission!)
      .canEdit();

  final service = await ref.watch(formInstanceServiceProvider(
          formMetaData: formMetaData, orgUnit: submission.orgUnit)
      .future);

  final form = FormGroup(await service.formDataControls());

  return FormInstance(ref,
      enabled: enabled,
      formInstanceService: service,
      elements: await service.formDataElements(form),
      form: form);
}
