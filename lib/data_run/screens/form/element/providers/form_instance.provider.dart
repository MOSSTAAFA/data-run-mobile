import 'dart:io';

import 'package:d2_remote/d2_remote.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:mass_pro/data_run/screens/form/element/form_value_map.dart';
import 'package:mass_pro/data_run/screens/form/element/service/device_info_service.dart';
import 'package:mass_pro/data_run/screens/form/element/form_instance.dart';
import 'package:mass_pro/data_run/screens/form/element/service/form_instance_service.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_instance.provider.g.dart';

@riverpod
FormFlatTemplate formFlatTemplate(FormFlatTemplateRef ref) {
  throw UnimplementedError();
}

@riverpod
FormMetadata formMetadata(FormMetadataRef ref) {
  throw UnimplementedError();
}

@riverpod
Future<bool> submissionEditStatus(SubmissionEditStatusRef ref,
    {required String submission}) async {
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
    {String? orgUnit}) async {
  final formMetadata = ref.watch(formMetadataProvider);
  final formTemplate = await D2Remote.formModule.formTemplateV
      .byVersion(formMetadata.version)
      .byFormTemplate(formMetadata.form)
      .getOne();
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo =
      Platform.isAndroid ? await deviceInfoPlugin.androidInfo : null;
  final deviceService = AndroidDeviceInfoService(deviceInfo: deviceInfo);

  return FormInstanceService(
    template: formTemplate!,
    formMetadata: formMetadata,
    deviceInfoService: deviceService,
    orgUnit: orgUnit,
  );
}

@riverpod
Future<FormInstance> formInstance(FormInstanceRef ref) async {
  final formMetadata = ref.watch(formMetadataProvider);
  final submission = await D2Remote.formModule.formSubmission
      .byId(formMetadata.submission!)
      .getOne();

  final enabled = await D2Remote.formModule.formSubmission
      .byId(formMetadata.submission!)
      .canEdit();

  final service = await ref
      .watch(formInstanceServiceProvider(orgUnit: submission.orgUnit).future);

  final form = FormGroup(await service.formDataControls());
  final FormValueMap formValueMap = FormValueMap();
  final elements = await service.formDataElements(form, formValueMap);
  return FormInstance(ref,
      enabled: enabled,
      formInstanceService: service,
      elements: elements,
      formValueMap: formValueMap,
      form: form);
}
