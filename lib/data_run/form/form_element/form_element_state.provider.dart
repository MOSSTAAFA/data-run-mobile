// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:mass_pro/data_run/form/form_element/form_element_state.dart';
// import 'package:mass_pro/data_run/form/form_element/form_elements_factories.provider.dart';
// import 'package:mass_pro/data_run/screens/form/element/form_metadata.dart';
// import 'package:mass_pro/data_run/screens/form/element/providers/form_instance.provider.dart';
// import 'package:mass_pro/data_run/screens/form/inherited_widgets/form_template_inherit_widget.dart';
// import 'package:mass_pro/data_run/screens/form_module/form_model/parsing_helper.dart';
// import 'package:mass_pro/utils/navigator_key.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'form_element_state.provider.g.dart';
//
// @riverpod
// class FormFlatStateMap extends _$FormFlatStateMap {
//   Future<Map<String, FormElementState>> build(FormMetadata formMetadata) async {
//     final Map<String, dynamic>? initialValue = await ref.watch(
//         formInitialDataProvider(submission: formMetadata.submission!).future);
//     final service = await ref
//         .watch(formInstanceServiceProvider(formMetadata: formMetadata).future);
//     final formTemplate = service.formFlatTemplate;
//
//     final flatValue = ParsingHelper.flattenFormDataUsingTemplate(
//         initialValue ?? {}, formTemplate);
//     final flatState = flatValue
//         .map((key, value) => MapEntry(key, FormElementState(value: value)));
//
//     return flatState;
//   }
//
//   Future<void> addElement(
//       FormElementState formElementState, String path) async {
//     final previousState = await future;
//
//     state = AsyncData({...previousState..[path] = formElementState});
//   }
//
//   Future<FormElementState?> removeElement(String path) async {
//     final Map<String, FormElementState> previousState = await future;
//     final removedElement = previousState.remove(path);
//     state = AsyncData({...previousState});
//     return removedElement;
//   }
//
//   Future<void> updateElement(FormElementState element, String path) async {
//     final Map<String, FormElementState> previousState = await future;
//     state = AsyncData({...previousState..update(path, (value) => element)});
//   }
// }
//
//
// @riverpod
// Future<FormElementState?> elementState(ElementStateRef ref, String path,
//     {required FormMetadata formMetadata, value}) async {
//   ref.read(formFlatStateMapProvider(formMetadata).notifier);
//   final FormElementState? elementState = await ref.watch(
//       formFlatStateMapProvider(formMetadata)
//           .selectAsync((formState) => formState[path]));
//
//   return elementState;
// }
