// import 'package:d2_remote/modules/datarun/form/shared/rule.dart';
// import 'package:d2_remote/modules/datarun/form/shared/value_type.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:mass_pro/sdk/core/program/section_rendering_type.dart';
// import 'package:mass_pro/data_run/form/reactive_form/model.dart';
//
// class QSectionFieldModel extends QFieldModel {
//   QSectionFieldModel(
//       {required String uid,
//       bool isEditable = true,
//       required String label,
//       bool isVisible = true,
//       String? displayName,
//       bool isLoading = false,
//       List<Rule>? fieldRules,
//       required String path,
//       String? section,
//       ValueType? valueType,
//       List<QFieldModel>? fields,
//       this.isOpen = false,
//       this.totalFields = 0,
//       this.completedFields = 0,
//       this.errors = 0,
//       this.warnings = 0,
//       this.sectionRenderingType,
//       this.order = 0})
//       : this._fields = IList.orNull(fields) ?? IList(),
//         super(
//             uid: uid,
//             path: path,
//             section: section,
//             label: label,
//             fieldRules: fieldRules,
//             isEditable: isEditable,
//             valueType: valueType,
//             displayName: displayName,
//             isVisible: isVisible);
//   final SectionRenderingType? sectionRenderingType;
//
//   final bool isOpen;
//   final int totalFields;
//   final int completedFields;
//   final int errors;
//   final int warnings;
//
//   final IList<QFieldModel> _fields;
//
//   final int order;
//
//   @override
//   IList<QFieldModel> get fields => _fields;
//
// }
//
//
// // @override
// // String get formattedLabel => label;
// //
// // bool get hasErrorAndWarnings => errors > 0 && warnings > 0;
// //
// // bool get hasNotAnyErrorOrWarning => errors == 0 && warnings == 0;
// //
// // bool get hasOnlyErrors => errors > 0 && warnings == 0;
// //
// // String get getFormattedSectionFieldsInfo => '$completedFields/$totalFields';
// //
// // bool get areAllFieldsCompleted => completedFields == totalFields;
//
// // @override
// // List<Object?> get props => [
// //   ...super.props,
// //   isOpen,
// //   totalFields,
// //   completedFields,
// //   errors,
// //   warnings,
// //   order
// // ];