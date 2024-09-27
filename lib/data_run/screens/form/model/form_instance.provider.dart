import 'dart:io';

import 'package:d2_remote/d2_remote.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:mass_pro/data_run/screens/form/model/device_info_service.dart';
import 'package:mass_pro/data_run/screens/form/model/form_instance.dart';
import 'package:mass_pro/data_run/screens/form/model/form_instance_service.dart';
import 'package:mass_pro/data_run/screens/form/model/form_metadata.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_instance.provider.g.dart';

// @riverpod
// Future<FormGroup> formGroup(FormGroupRef ref,
//     {required FormMetadata formMetadata, String? orgUnit}) async {
//   //<editor-fold desc="Data Methods">
//   final template = await ref.watch(formTemplateProvider(formMetadata).future);
//
//   final Map<String, List<FormOption>> formOptionsMap = Map.fromIterable(
//       template.options..sort((a, b) => (a.order).compareTo(b.order)),
//       key: (option) => option.listName,
//       value: (option) =>
//           template.options
//               .where((o) => o.listName == option.listName)
//               .toList());
//   final Map<String, AbstractControl<dynamic>> controls = {};
//   final Map<String, AbstractControl<dynamic>> attributeControls = {};
//   Map.fromIterable(
//       template.options..sort((a, b) => (a.order).compareTo(b.order)),
//       key: (option) => option.listName,
//       value: (option) =>
//           template.options
//               .where((o) => o.listName == option.listName)
//               .toList());
//
//   for (var element in template.fields) {
//     if (!element.type.isSelectType && element.mainField) {
//       attributeControls[element.name] =
//           FormTemplateControlFactory.createFormControl(element,
//               fieldOptions: formOptionsMap[element.name] ?? []);
//     }
//
//     if (element.listName != null) {
//       element.options.clear();
//       element.options.addAll(formOptionsMap[element.listName]!.toList());
//     }
//     controls[element.name] = FormTemplateControlFactory.createControl(element,
//         formOptionsMap: formOptionsMap);
//   }
//
//
//   final attrGroup = {
//     'form': FormControl<String>(value: formMetadata.form),
//     'orgUnit': FormControl<String>(
//       value: orgUnit, /*formMetaData.orgUnit ??
//             (template.orgUnits.length == 1 ? template.orgUnits.first : null)*/),
//     'team': FormControl<String>(value: formMetadata.team),
//     'activity': FormControl<String>(value: formMetadata.activity),
//     'version': FormControl<int>(value: formMetadata.version)
//   };
//
//   return FormGroup({
//     initialGroupName: FormGroup(attrGroup),
//     formDataGroupName: FormGroup(controls)
//   });
//   //</editor-fold>
// }

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
  //<editor-fold desc="Data Methods">

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
  //</editor-fold>
}
