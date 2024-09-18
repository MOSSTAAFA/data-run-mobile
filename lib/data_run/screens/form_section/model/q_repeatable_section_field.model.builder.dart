// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:mass_pro/data_run/screens/form/model/q_field.model.builder.dart';
// import 'package:mass_pro/data_run/form/reactive_form/model.dart';
// import 'package:mass_pro/data_run/screens/form_section/model/q_repeatable_section_field_model.dart';
// import 'package:mass_pro/data_run/screens/form_section/model/q_section_field.model.builder.dart';
//
// class QRepeatableSectionFieldBuilder extends QSectionFieldBuilder {
//   QRepeatableSectionFieldBuilder(QRepeatableSectionFieldModel model)
//       : super(model) {
//     instances = model.instances;
//   }
//
//   IList<IList<QFieldModel>>? instances;
//
//   QFieldModelBuilder setInstances(IList<IList<QFieldModel>>? instances) {
//     this.instances = instances;
//     return this;
//   }
//
//   QRepeatableSectionFieldModel build() {
//     return QRepeatableSectionFieldModel(
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
//         completedFields: completedFields ?? 0,
//         instances: instances);
//   }
// }
