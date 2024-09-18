// import 'package:d2_remote/modules/datarun/form/shared/field_value_rendering_type.dart';
// import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
// import 'package:equatable/equatable.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter/material.dart';
// import 'package:mass_pro/commons/global_functions/global_functions.dart';
// import 'package:mass_pro/data_run/screens/form/model/option_configuration.dart';
// import 'package:mass_pro/form/model/key_board_action_type.dart';
// import 'package:mass_pro/form/ui/intent/form_intent.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
//
// typedef IntentCallback = void Function(FormIntent intent);
//
// @immutable
// class QFieldModel with EquatableMixin {
//   QFieldModel({
//     required this.uid,
//     this.listName,
//     this.optionConfiguration,
//     this.isVisible = true,
//     List<Rule>? fieldRules,
//     this.value,
//     List<String>? values,
//     this.displayName,
//     this.error,
//     this.isEditable = true,
//     this.warning,
//     this.isMandatory = false,
//     required this.label,
//     this.hint,
//     this.description,
//     this.valueType,
//     this.allowFutureDates,
//     this.fieldRendering,
//     this.keyboardActionType,
//     this.intentCallback,
//     this.order = 0,
//     this.section,
//     required this.path,
//     this.defaultValue,
//   })  : this.fieldRules = IList.orNull(fieldRules) ?? IList(),
//         this.values = IList.orNull(values) ?? IList();
//
//   final OptionConfiguration? optionConfiguration;
//   final String uid;
//   final bool isEditable;
//   final bool isVisible;
//   final IList<Rule>? fieldRules;
//   final String? displayName;
//   final String label;
//   final String? section;
//   final String path;
//   final String? description;
//   final ValueType? valueType;
//   final int order;
//   String get formattedLabel => isMandatory ? '$label *' : label;
//
//
//   final String? value;
//   final IList<String>? values;
//   final bool isMandatory;
//   final String? error;
//   final String? listName;
//   final String? warning;
//   final String? hint;
//   final String? defaultValue;
//   final bool? allowFutureDates;
//
//
//   final FieldValueRenderingType? fieldRendering;
//   final KeyboardActionType? keyboardActionType;
//   final IntentCallback? intentCallback;
//
//   IList<QFieldModel> get fields => const IListConst([]);
//
//
//   // Serialization method
//   Map<String, dynamic> toJson() => {
//         'uid': uid,
//         'valueType': valueType,
//         'isMandatory': isMandatory,
//         'path': path,
//         'section': section,
//         'rules': fieldRules,
//         'defaultValue': defaultValue,
//       };
//
//   // Deserialization method
//   factory QFieldModel.fromJson(Map<String, dynamic> json) {
//     return QFieldModel(
//       uid: json['uid'],
//       valueType: json['valueType'],
//       label: json['label'],
//       path: json['path'],
//       isMandatory: json['isMandatory'] ?? false,
//       section: json['section'],
//       fieldRules: json['fieldRules'] ?? [],
//       defaultValue: json['defaultValue'],
//     );
//   }
//
//   @override
//   String toString() {
//     return mapPropsToString(runtimeType, <Object?>[
//       'uid: $uid',
//       'value: $value',
//       // 'isVisible: $isVisible',
//       // 'isLoading:  $isLoading',
//       // 'isFocused:  $isFocused',
//       // 'dataIntegrityResult: $isMandatory',
//       // 'error:  $error',
//       // 'optionsToShow:  ${optionConfiguration?.optionsToShow}',
//       // 'optionsToHide:  ${optionConfiguration?.optionsToHide}',
//       'optionsToDisplay:  ${optionConfiguration?.optionsToDisplay.map((o) => '${o.name}')}',
//       // 'warning:  $warning',
//       // // 'options:  $options',
//       // 'displayName:  $displayName',
//     ]);
//   }
//
//   @override
//   List<Object?> get props => <Object?>[
//         uid,
//         optionConfiguration,
//         isVisible,
//         value,
//         error,
//         isEditable,
//         warning,
//         displayName,
//         isMandatory,
//       ];
// }
