// import 'package:d2_remote/d2_remote.dart';
// import 'package:d2_remote/modules/datarun/form/entities/form_version.entity.dart';
// import 'package:d2_remote/modules/datarun/form/shared/form_element_template.dart';
// import 'package:d2_remote/modules/datarun/form/shared/rule/rule_action.dart';
// import 'package:mass_pro/data_run/errors_management/error_management.dart';
// import 'package:mass_pro/data_run/form/form_element/form_element_model/form_element_node.dart';
// import 'package:mass_pro/data_run/form/form_template/template_providers.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_element_model/form_element_model.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'form_element_instance_provider.g.dart';
//
// class FormTemplateNotFoundException extends DException {
//   FormTemplateNotFoundException(String form, int version)
//       : super(
//             'FormTemplateNotFoundException: form $form, version $version NotFound.');
// }
//
// class NodeTemplateNotFoundException extends DException {
//   NodeTemplateNotFoundException(String path)
//       : super(
//       'ElementTemplateNotFoundException: $path.');
// }
//
// @riverpod
// Future<FormElementNode<T>> formRootSectionNode<T>(
//     FormElementNodeRef<T> ref, path) async {
//   final form = ref.watch(formFlatTemplateProvider);
//   final template = form.getElementByPath(path);
//   if(template == null) {
//     throw NodeTemplateNotFoundException(path);
//   }
//
//   return template;
// }
//
//
// @riverpod
// Future<FormElementNode<T>> formElementNode<T>(
//     FormElementNodeRef<T> ref, path) async {
//   final form = ref.watch(formTemplateProvider);
//   final template = form.getElementByPath(path);
//   if(template == null) {
//     throw NodeTemplateNotFoundException(path);
//   }
//
//   if(template == null) {
//     throw NodeTemplateNotFoundException(path);
//   }
//   return template;
// }
//
// @riverpod
// class FormRootSection extends _$FormRootSection {
//   List<SectionNode> build(String submission) {
//
//     throw UnimplementedError();
//   }
//
//
// }
//
// @riverpod
// class FormElement<T> extends _$FormElement<T> {
//   T build(String path) {
//     throw UnimplementedError();
//   }
//
//
//   // void updateValue(T? value);
//   //
//   // void markAsHidden() {
//   //   if (_hidden) {
//   //     return;
//   //   }
//   //   _hidden = true;
//   // }
//   //
//   // void markAsVisible() {
//   //   if (visible) {
//   //     return;
//   //   }
//   //   _hidden = false;
//   // }
//
// }
//
// @riverpod
// class ElementRuleState extends _$ElementRuleState {
//   RuleState? build(String elementPath) {
//     return null;
//   }
// }
//
// class RuleState {
//   RuleState(
//       {required this.elementPath,
//       required this.isInEffect,
//       required this.action,
//       required this.dependencies});
//
//   final String elementPath;
//   final bool isInEffect;
//   final ActionType action;
//   final List<String> dependencies;
// }
//
// class isVisible {}
//
