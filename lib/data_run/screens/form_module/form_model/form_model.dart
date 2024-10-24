// import 'package:d2_remote/modules/datarun/form/entities/form_version.entity.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_element_model/element_state_model/form_element_state.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element_model.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element_model_factory.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_model/parsing_helper.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_template/form_element_template.dart';
//
// class FormManager {
//   FormManager({
//     Map<String, dynamic> initialValue = const {},
//     required FormTemplateV formTemplate,
//   })  : initialValue = IMap(initialValue),
//         sectionElementModel = SectionElementModel(
//             name: '',
//             elements: FromElementModelFactory.formElementsModels(
//                 formTemplate.fields, initialValue)),
//         formTemplate = FormTemplateRoot.fromEntity(formTemplate);
//
//   final FormTemplateRoot formTemplate;
//   final SectionElementModel sectionElementModel;
//   final IMap<String, dynamic> initialValue;
//   final Map<String, ElementState> elementStateMap;
//
//   IMap<String, dynamic> _flatValues;
//
//   Map<String, dynamic> get flatValues => _flatValues.unlockView;
//
//   void updateValue(String path, dynamic value) {
//     _flatValues = _flatValues.update(path, (v) => value, ifAbsent: () => value);
//     // Update visibility based on rules...
//   }
// }
