// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:mass_pro/data_run/screens/form/model/q_field.model.builder.dart';
// import 'package:mass_pro/data_run/form/reactive_form/model.dart';
// import 'package:mass_pro/data_run/screens/form_section/model/q_section_field_model.dart';
// import 'package:mass_pro/sdk/core/program/section_rendering_type.dart';
//
// class QSectionFieldBuilder extends QFieldModelBuilder {
//   QSectionFieldBuilder(QSectionFieldModel model) : super(model) {
//     sectionRenderingType = model.sectionRenderingType;
//     isOpen = model.isOpen;
//     totalFields = model.totalFields;
//     completedFields = model.completedFields;
//     errors = model.errors;
//     warnings = model.warnings;
//     fields = model.fields;
//     sectionNumber = model.sectionNumber;
//   }
//
//   SectionRenderingType? sectionRenderingType;
//
//   bool? isOpen;
//   int? totalFields;
//   int? completedFields;
//   int? errors;
//   int? warnings;
//
//   ///
//   IList<QFieldModel>? fields;
//
//   /// sequential when repeatable
//   int? sectionNumber;
//
//   QSectionFieldBuilder setSectionRenderingType(
//       SectionRenderingType sectionRenderingType) {
//     this.sectionRenderingType = sectionRenderingType;
//     return this;
//   }
//
//   QSectionFieldBuilder setIsOpen(bool? isOpen) {
//     this.isOpen = isOpen;
//     return this;
//   }
//
//   QSectionFieldBuilder setTotalFields(int? totalFields) {
//     this.totalFields = totalFields;
//     return this;
//   }
//
//   QSectionFieldBuilder setCompletedFields(int? completedFields) {
//     this.completedFields = completedFields;
//     return this;
//   }
//
//   QSectionFieldBuilder setWarnings(int warnings) {
//     this.warnings = warnings;
//     return this;
//   }
//
//   QSectionFieldBuilder setErrors(int? errors) {
//     this.errors = errors;
//     return this;
//   }
//
//   QSectionFieldBuilder setFields(IList<QFieldModel>? fields) {
//     this.fields = fields;
//     return this;
//   }
//
//   QSectionFieldBuilder setSectionNumber(int? sectionNumber) {
//     this.sectionNumber = sectionNumber;
//     return this;
//   }
//
//   QSectionFieldModel build() {
//     return QSectionFieldModel(
//         uid: uid!,
//         label: label!,
//         isEditable: isEditable ?? false,
//         isVisible: isVisible ?? false,
//         isLoading: isLoading ?? false,
//         displayName: displayName,
//         fieldRules: fieldRules,
//         path: path!,
//         section: section,
//         fields: fields,
//         sectionNumber: sectionNumber ?? 0,
//         sectionRenderingType: sectionRenderingType,
//         errors: errors ?? 0,
//         warnings: warnings ?? 0,
//         isOpen: isOpen ?? false,
//         totalFields: totalFields ?? 0,
//         completedFields: completedFields ?? 0);
//   }
// }
