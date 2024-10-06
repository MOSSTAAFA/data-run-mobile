import 'dart:async';

import 'package:d2_remote/core/datarun/utilities/date_utils.dart';
import 'package:d2_remote/d2_remote.dart';
import 'package:d2_remote/modules/auth/user/entities/d_user.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/data_form_submission.entity.dart';
import 'package:d2_remote/modules/datarun/form/entities/form_definition.entity.dart';
import 'package:d2_remote/modules/datarun/form/shared/attribute_type.dart';
import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
import 'package:mass_pro/data_run/screens/form/element/service/device_info_service.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_control_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/factories/form_element_factory.dart';
import 'package:mass_pro/data_run/screens/form/element/form_element.dart';
import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:uuid/uuid.dart';

const formAttributesGroupName = 'attributes';
const formDataGroupName = 'formData';

const formControlName = 'formData';
const activityControlName = 'formData';
const teamControlName = 'formData';
const versionControlName = 'formData';
const orgUnitControlName = 'formData';

class FormInstanceService {
  FormInstanceService(
      {required FormTemplateV template,
      AndroidDeviceInfoService? deviceInfoService,
      required this.formMetadata,
      required this.orgUnit})
      : _template = template,
        _uuid = Uuid().v4(),
        _deviceInfoService = deviceInfoService {
    _formOptionsMapCache.addAll(Map.fromIterable(
        template.options..sort((a, b) => (a.order).compareTo(b.order)),
        key: (option) => option.listName,
        value: (option) => template.options
            .where((o) => o.listName == option.listName)
            .toList()));
  }

  final FormMetadata formMetadata;
  final String? orgUnit;
  final String _uuid;
  final AndroidDeviceInfoService? _deviceInfoService;
  final FormTemplateV _template;
  final Map<String, List<FormOption>> _formOptionsMapCache = {};

  FormTemplateV get template => _template;

  Map<String, List<FormOption>> get formOptionsMapCache =>
      Map.unmodifiable(_formOptionsMapCache);

  Future<String?> _getUserAttribute(AttributeType userAttributeType) async {
    DUser? currentUser = await D2Remote.userModule.user.getOne();

    return switch (userAttributeType) {
      AttributeType.username => currentUser?.username,
      AttributeType.phoneNumber => currentUser?.phoneNumber,
      AttributeType.userInfo =>
        '${currentUser?.name ?? '${currentUser?.firstName} ${currentUser?.surname}'}',
      _ => null
    };
  }

  FutureOr<AbstractControl<dynamic>> attributeControl(
          AttributeType attributeType) async =>
      switch (attributeType) {
        AttributeType.uuid => FormControl<String>(value: _uuid),
        AttributeType.today => FormControl<String>(
            value:
                DateUtils.databaseDateFormat().format(DateTime.now().toUtc())),
        AttributeType.username => FormControl<String>(
            value: await _getUserAttribute(AttributeType.username)),
        AttributeType.phoneNumber => FormControl<String>(
            value: await _getUserAttribute(AttributeType.phoneNumber)),
        AttributeType.userInfo => FormControl<String>(
            value: await _getUserAttribute(AttributeType.userInfo)),
        AttributeType.deviceId =>
          FormControl<String>(value: _deviceInfoService?.deviceId()),
        AttributeType.deviceModel =>
          FormControl<String>(value: _deviceInfoService?.model()),
        AttributeType.form => FormControl<String>(value: formMetadata.form),
        AttributeType.orgUnit => FormControl<String>(
            value: orgUnit ??
                (template.orgUnits.length == 1
                    ? template.orgUnits.first
                    : null),
            validators: [Validators.required]),
        AttributeType.team => FormControl<String>(
            value: (await D2Remote.teamModuleD.team
                    .byActivity(formMetadata.activity)
                    .getOne())
                ?.uid),
        AttributeType.activity =>
          FormControl<String>(value: formMetadata.activity),
        AttributeType.version => FormControl<int>(value: formMetadata.version),
      };

  Future<Map<String, AbstractControl<dynamic>>> formDataControls() async {
    final Map<String, AbstractControl<dynamic>> controls = {
      '_uid': FormControl<String>(value: formMetadata.submission),
      '_${AttributeType.phoneNumber.name}':
          await attributeControl(AttributeType.phoneNumber),
      '_${AttributeType.username.name}':
          await attributeControl(AttributeType.username),
      '_${AttributeType.userInfo.name}':
          await attributeControl(AttributeType.userInfo),
      '_${AttributeType.team.name}': await attributeControl(AttributeType.team),
      '_${AttributeType.form.name}':
          FormControl<String>(value: formMetadata.form),
      '_${AttributeType.orgUnit.name}':
          await attributeControl(AttributeType.orgUnit),
      '_${AttributeType.activity.name}':
          await attributeControl(AttributeType.activity),
      '_${AttributeType.deviceId.name}':
          await attributeControl(AttributeType.deviceId),
      '_${AttributeType.version.name}':
          await attributeControl(AttributeType.version)
    };

    final savedValue = await loadFormData();

    for (var element in template.fields) {
      controls[element.name] = FromElementControlFactory.createTemplateControl(
          element,
          savedValue: savedValue?[element.name]);
    }

    return controls;
  }

  Future<Map<String, FormElementInstance<dynamic>>> formDataElements(
      FormGroup form) async {
    final Map<String, FormElementInstance<dynamic>> elements = {};

    final savedValue = await loadFormData();
    for (var element in template.fields) {
      elements[element.name] = FromElementFactory.createElementInstance(
          form, element,
          formOptionsMap: formOptionsMapCache,
          savedValue: savedValue?[element.name]);
    }
    return elements;
  }

  /// Update the form data with new values (for patching or rehydration)
  Future<Map<String, dynamic>?> loadFormData() async {
    late final Map<String, dynamic>? savedData;
    if (formMetadata.submission != null) {
      final DataFormSubmission? submission = await D2Remote
          .formModule.formSubmission
          .byId(formMetadata.submission!)
          .getOne();
      savedData = submission?.formData;
    }

    return savedData;
  }

// /// Update the form data with new values (for patching or rehydration)
// Future<void> loadFormData(
//     Map<String, FormElementInstance<dynamic>> elements) async {
//   late final Map<String, dynamic>? savedData;
//   if (formMetadata.submission != null) {
//     final DataFormSubmission? submission = await D2Remote
//         .formModule.formSubmission
//         .byId(formMetadata.submission!)
//         .getOne();
//     savedData = submission?.formData;
//   }
//   if (savedData != null) {
//     for (var element in elements.values) {
//       _updateElementValue(element, savedData[element.name]);
//     }
//   }
// }

// /// Helper to update the element value based on savedData
// void _updateElementValue(
//     FormElementInstance<dynamic> element, dynamic savedValue) {
//   if (element is FieldInstance) {
//     element.updateValue(savedValue);
//     // element.updateFieldValue(FromElementFactory.createFormField(
//     //   element.form,
//     //   element.template,
//     //   savedValue: savedValue,
//     //   formOptionsMap: formOptionsMapCache,
//     // ));
//   } else if (element is SectionInstance) {
//     element.updateValue(savedValue);
//     // element.updateSectionValue(FromElementFactory.createSectionInstance(
//     //   element.form,
//     //   element.template,
//     //   savedValue: savedValue,
//     //   formOptionsMap: formOptionsMapCache,
//     // ));
//   } else if (element is RepeatInstance) {
//     // final ee =
//     //     updatedRepeatedSectionSections(element, savedValue: savedValue ?? []);
//     element.updateValue(savedValue);
//   }
// }

// List<SectionInstance> updatedRepeatedSectionSections(
//     FormElementInstance<dynamic> element,
//     {List<dynamic> savedValue = const []}) {
//   return savedValue
//       .map((savedValue) => FromElementFactory.createSectionInstance(
//           element.form, element.template,
//           savedValue: savedValue, formOptionsMap: formOptionsMapCache))
//       .toList();
// }
}
