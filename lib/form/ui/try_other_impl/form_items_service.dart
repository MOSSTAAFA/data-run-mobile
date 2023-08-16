// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../data/data_integrity_check_result.dart';
// import '../data/form_repository.dart';
// import '../model/field_ui_model.dart';
//
// /// NMC Created
// class FormItemsService {
//
//   FormItemsService(this._repository);
//
//   final FormRepository _repository;
//
//   Future<IList<FieldUiModel>> loadData() async {
//     // ref.read(loadingProvider.notifier).setValue(true);
//     final FormRepository repository = ref.read(formRepositoryProvider);
//     state = await AsyncValue.guard(repository.fetchFormItems);
//     ref.read(loadingProvider.notifier).setValue(false);
//   }
//
//   Future<IList<FieldUiModel>> processCalculatedItems() async {
//     return _repository.composeList();
//   }
//
//   Future<DataIntegrityCheckResult> runDataIntegrityCheck({bool? allowDiscard}) async {
//
//     return _repository.runDataIntegrityCheck(allowDiscard: allowDiscard ?? false);
//
//     // state = await AsyncValue.guard(repository.composeList);
//   }
// }
