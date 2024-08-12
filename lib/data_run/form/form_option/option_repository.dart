// import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:get/get.dart';
// import 'package:mass_pro/commons/constants.dart';
// import 'package:mass_pro/data_run/form/form_configuration.dart';
// import 'package:mass_pro/main/usescases/bundle/bundle.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'option_repository.g.dart';
//
// @riverpod
// OptionRepository optionRepository(OptionRepositoryRef ref) {
//   final Bundle eventBundle = Get.arguments as Bundle;
//   final String formUid = eventBundle.getString(FORM_UID)!;
//   final formConfiguration =
//       ref.watch(formConfigurationProvider(formUid)).requireValue;
//   return OptionRepository(formConfiguration: formConfiguration);
// }
//
// class OptionRepository {
//   OptionRepository({required this.formConfiguration});
//
//   final FormConfiguration formConfiguration;
//
//   IList<FormOption> getOptions(
//     String list, {
//     IList<String>? optionsToHide,
//     IList<String>? optionsToShow,
//     String? searchQuery,
//   }) {
//     IList<FormOption> options =
//         formConfiguration.optionLists.get(list) ?? IList();
//     if (optionsToHide?.isNotEmpty ?? false) {
//       options =
//           options.removeWhere((item) => optionsToHide!.contains(item.name));
//     }
//
//     if (optionsToShow?.isNotEmpty ?? false) {
//       options =
//           options.retainWhere((item) => optionsToShow!.contains(item.name));
//     }
//
//     return searchQuery?.isNotEmpty == true
//         ? options
//             .retainWhere(
//                 (item) => item.name!.toLowerCase().contains(searchQuery!))
//             .sort((a, b) => (a.sortOrder ?? 0).compareTo(b.sortOrder ?? 0))
//         : options;
//   }
//
//   int getOptionCount(String list) {
//     return formConfiguration.optionLists.get(list)?.length ?? 0;
//   }
// }
