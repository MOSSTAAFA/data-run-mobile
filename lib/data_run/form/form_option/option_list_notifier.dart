// import 'package:d2_remote/modules/datarun/form/shared/form_option.entity.dart';
// import 'package:fast_immutable_collections/src/ilist/ilist.dart';
// import 'package:flutter/foundation.dart';
// import 'package:mass_pro/data_run/form/form_option/option_repository.dart';
// import 'package:mass_pro/data_run/screens/data_submission_form/model/form_fields_state_notifier.dart';
// import 'package:mass_pro/data_run/screens/data_submission_form/model/q_field.model.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'option_list_notifier.g.dart';
//
// @riverpod
// class OptionListNotifier extends _$OptionListNotifier {
//   @override
//   IList<FormOption> build(QFieldModel field) {
//     debugPrint('#### OptionListNotifier created:');
//     ref.onDispose(() => debugPrint('#### OptionListNotifier onDispose:'));
//     ref.onResume(() => debugPrint('#### OptionListNotifier onResume:'));
//     return _loadOptions(
//         optionsToHide: field.optionConfiguration?.optionsToHide,
//         optionsToShow: field.optionConfiguration?.optionsToShow);
//   }
//
//   IList<FormOption> _loadOptions(
//       {IList<String>? optionsToHide,
//       IList<String>? optionsToShow,
//       String? searchQuery}) {
//     final repository = ref.watch(optionRepositoryProvider);
//
//     IList<FormOption> options = IList();
//     if (field.optionListName != null) {
//       options = repository.getOptions(field.optionListName!,
//           optionsToHide: field.optionConfiguration?.optionsToHide,
//           optionsToShow: field.optionConfiguration?.optionsToShow,
//           searchQuery: searchQuery);
//     }
//
//     return options;
//   }
//
//   void searchOptions(String query) {
//     state = _loadOptions(searchQuery: query);
//   }
// }
