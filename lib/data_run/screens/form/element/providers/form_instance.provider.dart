import 'dart:async';
import 'dart:io';

import 'package:d2_remote/d2_remote.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:mass_pro/data_run/form/form_element/parsing/form_instance_builder.dart';
import 'package:mass_pro/data_run/form/form_element/parsing/form_instance_control_builder.dart';
import 'package:mass_pro/data_run/form/form_template/template_providers.dart';
import 'package:mass_pro/data_run/form/shared/form_configuration.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:mass_pro/data_run/screens/form/element/service/device_info_service.dart';
import 'package:mass_pro/data_run/screens/form/element/form_instance.dart';
import 'package:mass_pro/data_run/screens/form/element/service/form_instance_service.dart';
import 'package:mass_pro/data_run/screens/form_module/form_template/form_element_template.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_instance.provider.g.dart';

@riverpod
Future<AndroidDeviceInfoService> userDeviceInfoService(
    UserDeviceInfoServiceRef ref) async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final deviceInfo =
      Platform.isAndroid ? await deviceInfoPlugin.androidInfo : null;
  final deviceService = AndroidDeviceInfoService(deviceInfo: deviceInfo);
  return deviceService;
}

@riverpod
Future<FormFlatTemplate> formFlatTemplate(FormFlatTemplateRef ref,
    {required FormMetadata formMetadata}) async {
  final formVersion = await ref.watch(formVersionAsyncProvider(
          form: formMetadata.form, version: formMetadata.version)
      .future);

  return FormFlatTemplate.fromTemplate(formVersion);
}

@riverpod
Future<FormInstanceService> formInstanceService(FormInstanceServiceRef ref,
    {required FormMetadata formMetadata}) async {
  final userDeviceService =
      await ref.watch(userDeviceInfoServiceProvider.future);

  return FormInstanceService(
      formMetadata: formMetadata, deviceInfoService: userDeviceService);
}

@riverpod
Future<FormInstance> formInstance(FormInstanceRef ref,
    {required FormMetadata formMetadata}) async {
  final enabled = await D2Remote.formModule.formSubmission
      .byId(formMetadata.submission!)
      .canEdit();

  final submission = await D2Remote.formModule.formSubmission
      .byId(formMetadata.submission!).getOne();

  final Map<String, dynamic>? initialFormValue = submission.formData;
  // await ref.watch(
  //     formInitialDataProvider(submission: formMetadata.submission!).future);

  final service = await ref
      .watch(formInstanceServiceProvider(formMetadata: formMetadata).future);

  final formControlBuilder = await ref.watch(
      formInstanceControlBuilderProvider(formMetadata: formMetadata).future);

  final formElementBuilder = await ref
      .watch(formInstanceBuilderProvider(formMetadata: formMetadata).future);

  final form =
      FormGroup(await formControlBuilder.formDataControls(initialFormValue));
  final elements = await formElementBuilder.buildFormElements(form,
      initialFormValue: initialFormValue);
  final formConfiguration = await ref.watch(formConfigurationProvider(
          form: formMetadata.form, version: formMetadata.version)
      .future);
  return FormInstance(ref,
      enabled: enabled,
      orgUnit: submission.orgUnit,
      formInstanceService: service,
      elements: elements,
      formConfiguration: formConfiguration,
      formMetadata: formMetadata,
      form: form);
}
