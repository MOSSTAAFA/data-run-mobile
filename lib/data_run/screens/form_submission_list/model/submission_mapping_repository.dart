import 'dart:async';

import 'package:mass_pro/data_run/form/form_configuration.dart';
import 'package:mass_pro/data_run/screens/form_submission_list/model/submission_list.provider.dart';

class SubmissionMappingRepository {
  SubmissionMappingRepository(this.ref,
      {required FormConfiguration formConfiguration,
      required String submissionUid})
      : _formConfiguration = formConfiguration,
        _submissionUid = submissionUid;

  FormConfiguration _formConfiguration;
  final String _submissionUid;
  final SubmissionMappingRepositoryRef ref;

  FormConfiguration get formConfiguration => _formConfiguration;

  String get submissionUid => _submissionUid;

  FormSubmissionList _getQuery() {
    return ref.read(
        formSubmissionListProvider(form: _formConfiguration.form).notifier);
  }

  Future<void> saveSubmissionData(Map<String, dynamic> formData) async {
    return _getQuery().saveSubmissionData(_submissionUid, formData);
  }

// Future<void> saveSubmission(IList<QFieldModel> formDataFields) async {
//   final IMap<String, dynamic> pendingUpdatesDataMap =
//       _preparePendingUpdates(formDataFields);
//
//   return _getQuery()
//       .saveSubmissionData(_submissionUid, pendingUpdatesDataMap);
// }
//
// IMap<String, dynamic> _preparePendingUpdates(
//     IList<QFieldModel> formDataFields) {
//   final IMap<String, QFieldModel> hiddenFields =
//       IMap.fromIterable<String, QFieldModel, QFieldModel>(
//           formDataFields.where((QFieldModel field) => !field.isVisible),
//           keyMapper: (QFieldModel field) => field.name,
//           valueMapper: (QFieldModel field) => field);
//
//   final IList<QFieldModel> clearedInvisibleFields = formDataFields
//       .map((QFieldModel field) => hiddenFields.containsKey(field.name)
//           ? field.builder().setValue(null).build()
//           : field)
//       .toIList();
//
//   return <String, dynamic>{
//     for (final QFieldModel field in clearedInvisibleFields)
//       field.name: mapFieldToValueType(field)
//   }.lock;
// }

// dynamic mapFieldToValueType(QFieldModel? field) {
//   switch (field?.valueType) {
//     case ValueType.Percentage:
//     case ValueType.Integer:
//     case ValueType.IntegerPositive:
//     case ValueType.IntegerNegative:
//     case ValueType.IntegerZeroOrPositive:
//       return int.tryParse(field?.value ?? '') ??
//           double.tryParse(field?.value ?? '')?.toInt() ??
//           field?.value;
//     case ValueType.UnitInterval:
//       return int.tryParse(field?.value ?? '') ??
//           double.tryParse(field?.value ?? '') ??
//           field?.value;
//     case ValueType.Number:
//     case ValueType.Age:
//       return double.tryParse(field?.value ?? '') ?? field?.value;
//     case ValueType.Boolean:
//     case ValueType.TrueOnly:
//       return field?.value.toBoolean() ?? field?.value;
//     default:
//       return field?.value;
//   }
// }

//
// Map<String, dynamic> mapFormRecursively(List<DynamicFormField> fields) {
//
//   List<QFieldModel> mappedFields = [];
//
//   for (var field in fields) {
//     String fieldName = field.name;
//     String fieldType = field.type;
//
//
//     // Map field based on type
//     if (fieldType == 'section') {
//       mappedFields[fieldName] = mapFormRecursively(field.fields ?? []);
//     } else if (fieldType == 'text') {
//       mappedFields[fieldName] = fieldConfig['value'] ?? '';
//     } else if (fieldType == 'checkbox') {
//       mappedFields[fieldName] = fieldConfig['value'] ?? false;
//     }
//     // ... other field types
//
//     // Apply field properties (e.g., validation, default values)
//     // ...
//   }
//
//   return mappedFields;
// }
//
// FutureOr<IMap<String, QFieldModel>> map() async {
//   final DataFormSubmission? syncableEntity =
//       await _getQuery().getSubmission(_submissionUid);
//
//   final IMapConst<String, dynamic> entityMap =
//       IMapConst(syncableEntity!.formData ?? {});
//
//   IMap<String, QFieldModel> fieldsModelsMap = IMap(<String, QFieldModel>{});
//
//   // final sections =
//   final allFields = _formConfiguration.allFields.values.toList()
//     ..sort((f1, f2) => f1.order.compareTo(f2.order));
//
//   for (final field in allFields) {
//     final options = field.listName != null
//         ? _formConfiguration.optionLists.get(field.listName!)
//         : null;
//     fieldsModelsMap = fieldsModelsMap.add(
//         field.name,
//         mapToQFieldModel(
//             field: field,
//             value: entityMap.get(field.name),
//             options: options));
//   }
//   return fieldsModelsMap;
// }

// QFieldModel mapToModel({
//   required DynamicFormField field,
//   dynamic value,
// }) {
//   final ValueType valueType = ValueType.getValueType(field.type);
//   final FieldValueRenderingType renderingType =
//       FieldValueRenderingUtil.getFieldValueRendering(
//           field.fieldValueRenderingType);
//
//   return QFieldModel(
//       uid: field.name,
//       isFocused: false,
//       isEditable: true,
//       isMandatory: field.mandatory,
//       label: getItemLocalString(field.label),
//       value: value is String ? value : value?.toString(),
//       valueType: valueType,
//       optionConfiguration: ValueType.getValueType(field.type).isWithOptions
//           ? _getOptionConfiguration(field)
//           : null,
//       fieldRendering: renderingType,
//       fieldRules: field.rules?.lock,
//       keyboardActionType: switch (valueType) {
//         ValueType.LongText => KeyboardActionType.ENTER,
//         _ => KeyboardActionType.NEXT
//       }, path: field.path);
// }
//
// OptionConfiguration? _getOptionConfiguration(DynamicFormField field) {
//   final options =
//       _formConfiguration.optionLists.get(field.listName!) ?? <FormOption>[];
//
//   return OptionConfiguration(
//       options: options.toList(), optionsToShow: [], optionsToHide: []);
// }

// FutureOr<QFieldModel> updateField(
//     QFieldModel fieldUiModel, String? warningMessage) async {
//   return warningMessage != null
//       ? fieldUiModel.setWarning(warningMessage)
//       : fieldUiModel;
// }
//
// Future<String> saveFileResource(String path) async {
//   return '';
// }
//
// FutureOr<IList<QFieldModel>> list() async {
//   final DataFormSubmission? syncableEntity =
//       await _getQuery().getSubmission(_submissionUid);
//
//   final IMapConst<String, dynamic> entityMap =
//       IMapConst(syncableEntity!.formData ?? {});
//
//   IList<QFieldModel> fieldsModels = IList(<QFieldModel>[]);
//   for (final field in _formConfiguration.allFields.values) {
//     fieldsModels = fieldsModels.add(
//         mapToQFieldModel(field: field, value: entityMap.get(field.name)));
//   }
//   return fieldsModels;
// }
}
