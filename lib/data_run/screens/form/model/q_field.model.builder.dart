// import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
// import 'package:mass_pro/data_run/form/form_model/model.dart';
// import 'package:mass_pro/data_run/screens/form/model/option_configuration.dart';
// import 'package:mass_pro/form/model/key_board_action_type.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
//
// class QFieldModelBuilder {
//   QFieldModelBuilder(QFieldModel model) {
//     uid = model.name;
//     listName = model.listName;
//     optionConfiguration = model.optionConfiguration;
//     rules = model.rules;
//     error = model.error;
//     isEditable = model.disabled;
//     isVisible = model.isVisible;
//     value = model.value;
//     isMandatory = model.isMandatory;
//     label = model.label;
//     valueType = model.valueType;
//     keyboardActionType = model.keyboardActionType;
//     intentCallback = model.intentCallback;
//     path = model.path;
//     defaultValue = model.defaultValue;
//   }
//
//   String? uid;
//   String? listName;
//   OptionConfiguration? optionConfiguration;
//   List<Rule>? rules;
//   String? error;
//   bool? isEditable;
//   bool? isVisible;
//   String? value;
//   List<String>? values;
//   bool? isMandatory;
//   Map<String, String>? label;
//   String? hint;
//   ValueType? valueType;
//   KeyboardActionType? keyboardActionType;
//   IntentCallback? intentCallback;
//
//   String? path;
//   String? section;
//   String? defaultValue;
//
//   QFieldModelBuilder setUid(String uid) {
//     this.uid = uid;
//     return this;
//   }
//
//   QFieldModelBuilder setOptionListName(String? optionListName) {
//     this.listName = optionListName;
//     return this;
//   }
//
//   QFieldModelBuilder setOptionConfiguration(
//       OptionConfiguration? optionConfiguration) {
//     this.optionConfiguration = optionConfiguration;
//     return this;
//   }
//
//   QFieldModelBuilder setFieldRules(List<Rule>? fieldRules) {
//     this.rules = fieldRules;
//     return this;
//   }
//
//   QFieldModelBuilder setError(String? error) {
//     this.error = error;
//     return this;
//   }
//
//   QFieldModelBuilder setIsEditable(bool isEditable) {
//     this.isEditable = isEditable;
//     return this;
//   }
//
//   QFieldModelBuilder setIsVisible(bool isVisible) {
//     this.isVisible = isVisible;
//     return this;
//   }
//
//   QFieldModelBuilder setValue(String? value) {
//     this.value = value;
//     return this;
//   }
//
//   QFieldModelBuilder setPath(String path) {
//     this.path = path;
//     return this;
//   }
//
//   QFieldModelBuilder setSection(String? section) {
//     this.section = section;
//     return this;
//   }
//
//   QFieldModelBuilder setDefaultValue(String? defaultValue) {
//     this.defaultValue = defaultValue;
//     return this;
//   }
//
//   QFieldModelBuilder setValues(List<String>? values) {
//     this.values = values;
//     return this;
//   }
//
//   QFieldModelBuilder setIsMandatory(bool? isMandatory) {
//     this.isMandatory = isMandatory;
//     return this;
//   }
//
//   QFieldModelBuilder setLabel(Map<String, String>? label) {
//     this.label = label;
//     return this;
//   }
//
//   QFieldModelBuilder setHint(String? hint) {
//     this.hint = hint;
//     return this;
//   }
//
//   QFieldModelBuilder setValueType(ValueType? valueType) {
//     this.valueType = valueType;
//     return this;
//   }
//
//   QFieldModelBuilder setKeyboardActionType(
//       KeyboardActionType? keyboardActionType) {
//     this.keyboardActionType = keyboardActionType;
//     return this;
//   }
//
//   QFieldModelBuilder setIntentCallback(IntentCallback? intentCallback) {
//     this.intentCallback = intentCallback;
//     return this;
//   }
//
//   QFieldModel build() {
//     return QFieldModel(
//         uid: uid!,
//         listName: listName,
//         optionConfiguration: optionConfiguration,
//         rules: rules,
//         error: error,
//         isEditable: isEditable ?? true,
//         isVisible: isVisible ?? true,
//         value: value,
//         isMandatory: isMandatory ?? false,
//         label: label,
//         hint: hint,
//         valueType: valueType,
//         keyboardActionType: keyboardActionType,
//         intentCallback: intentCallback,
//         path: path!,
//         section: section,
//         defaultValue: defaultValue);
//   }
// }
