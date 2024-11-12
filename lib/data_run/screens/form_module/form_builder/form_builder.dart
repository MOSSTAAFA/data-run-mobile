// import 'package:datarun/data_run/screens/form_module/form_builder/form_data.dart';
// import 'package:datarun/data_run/screens/form_module/form_builder/form_element_model_factory.dart';
// import 'package:datarun/data_run/screens/form_module/form_builder/form_element_model_iterator.dart';
// import 'package:datarun/data_run/screens/form_module/form_element_model/form_element_model.dart';
// import 'package:datarun/data_run/screens/form_module/form_template/form_element_template.dart';
// import 'package:expression_language/expression_language.dart';
//
// import '../../../form/form_element/form_element_iterators/form_element_iterator.dart';
//
// class FormBuilder {
//   FormBuilder();
//
//   FormData build(FormFlatTemplate template, [initialValue]) {
//     var root = SectionElementModel(
//         elements: FormElementModelFactory.buildFormElements(
//             template.formTemplate,
//             initialValue: initialValue),
//         templatePath: '');
//
//     var formElementMap = {
//       for (var x in getFormElementModelIterator<FormElementModel<dynamic>>(root)
//           .where((e) => e.name.isNotEmpty))
//         x.pathRecursive: x
//     };
//
//     final Map<String, List<String>> dependencyGraph = buildDependencies(root);
//
//     return _build(root, formElementMap, dependencyGraph);
//   }
//
//   Map<String, List<String>> buildDependencies(SectionElementModel root) {
//     final Map<String, List<String>> dependencyGraph = {};
//     for (var element in root.elements.values) {
//       for (var dependency in element.dependencies) {
//         dependencyGraph
//             .putIfAbsent(dependency, () => [])
//             .add(element.elementPath);
//       }
//     }
//     return dependencyGraph;
//   }
//
//   FormData buildFromForm(FormElementModel<dynamic> root) {
//     final path = root.pathRecursive;
//     final template = FormElementModelFactory.buildFormElement();
//     var clonedForm = build(template!);
//     var formElementMap = {
//       for (var x
//           in getFormElementIterator<FormElement>(clonedForm as FormElement)
//               .where((e) => e.id != null))
//         x.id!: x
//     };
//     _buildCloneableExpressions(clonedForm, formElementMap);
//     return _build(clonedForm, formElementMap);
//   }
//
//   FormData _build(
//       FormElementModel<dynamic> root,
//       Map<String, FormElementModel<dynamic>> formElementMap,
//       Map<String, List<String>> dependencyGraph) {
//     _buildElementsSubscriptionDependencies(root);
//
//     // var formValidations = getFormElementIterator<Validation>(root).toList();
//
//     return FormData(
//         form: root,
//         formElementsMap: formElementMap,
//         dependencyGraph: dependencyGraph);
//   }
//
//   void _buildCloneableExpressions(
//       FormElement form, Map<String, FormElement> expressionProviderElementMap) {
//     var formElementExpressions =
//         getFormPropertyIterator<CloneableExpressionProperty>(form);
//
//     for (var expressionValue in formElementExpressions) {
//       expressionValue.buildExpression(expressionProviderElementMap);
//     }
//   }
//
//   void _buildStringExpressions(FormElement root, ExpressionParser parser) {
//     var formElementExpressions =
//         getFormPropertyIterator<StringExpressionProperty>(root);
//
//     for (var expressionValue in formElementExpressions) {
//       try {
//         expressionValue.buildExpression(parser);
//       } catch (e, s) {
//         throw ExpressionBuilderException(expressionValue, e, s);
//       }
//     }
//   }
//
//   void _buildElementsSubscriptionDependencies(FormElement root) {
//     var formProperties = getFormPropertyIterator<Property>(root);
//
//     for (var property in formProperties) {
//       for (var sourceProperty
//           in property.getExpression().getExpressionProviders()) {
//         (sourceProperty as Property)
//             .addSubscriber(property as ExpressionProperty<dynamic>);
//       }
//     }
//   }
// }
