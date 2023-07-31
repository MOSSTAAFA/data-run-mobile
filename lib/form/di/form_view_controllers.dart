import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../commons/extensions/standard_extensions.dart';
import '../../commons/helpers/collections.dart';
import '../../commons/logging/logging.dart';
import '../model/action_type.dart';
import '../model/field_ui_model.dart';
import '../model/info_ui_model.dart';
import '../model/row_action.dart';
import '../model/store_result.dart';
import '../model/value_store_result.dart';
import '../ui/form_model.dart';
import '../ui/intent/form_intent.dart';
import 'form_view_repository.dart';
import 'injector.dart';

part 'form_view_controllers.g.dart';

@riverpod
FormViewRepository _formViewRepository(_FormViewRepositoryRef ref) {
  return FormViewRepository(ref, ref.watch(formRepositoryProvider));
}

@riverpod
class _FormPendingIntents extends _$FormPendingIntents {
  @override
  FormIntent build() {
    return const FormIntent.init();
  }

  @override
  bool updateShouldNotify(FormIntent oldI, FormIntent newI) {
    if (newI is Init || (oldI is OnFinish && newI is OnFinish)) {
      return false;
    } else {
      return oldI == newI;
    }
  }

  void submitIntent(FormIntent Function(FormIntent current) updateCallback) {
    state = updateCallback.call(state);
  }
}

@riverpod
RowAction _rowActionFromIntent(_RowActionFromIntentRef ref) {
  final pendingIntents = ref.watch(_formPendingIntentsProvider);
  final formViewRepo = ref.read(_formViewRepositoryProvider);
  return formViewRepo.rowActionFromIntent(pendingIntents);
}

@riverpod
bool focused(FocusedRef ref) {
  return ref.watch(_rowActionFromIntentProvider
      .select((rowAction) => rowAction.type == ActionType.ON_FOCUS));
}

@riverpod
bool loading(LoadingRef ref) {
  final onSaveRowActionType = ref.watch(_rowActionFromIntentProvider
      .select((rowAction) => rowAction.type == ActionType.ON_SAVE));
  final bool dataIsLoading = ref.watch(itemsResultProvider
      .select((itemsResultAsyncValue) => itemsResultAsyncValue.isLoading));
  final loading = onSaveRowActionType || dataIsLoading;
  return loading;
}

// _completionPercentage
@riverpod
double completionPercentage(CompletionPercentageRef ref) {
  final repository = ref.watch(formRepositoryProvider);
  final IList<FieldUiModel>? itemsResult = ref.watch(itemsResultProvider
      .select((itemsResultAsyncValue) => itemsResultAsyncValue.value));
  final percentage = repository.completedFieldsPercentage(
      itemsResult ?? const IListConst<FieldUiModel>([]));
  return percentage;
}

@riverpod
bool calculationLoop(CalculationLoopRef ref) {
  final repository = ref.watch(formRepositoryProvider);
  final IList<FieldUiModel>? itemsResult = ref.watch(itemsResultProvider
      .select((itemsResultAsyncValue) => itemsResultAsyncValue.value));
  final displayLoopWarningIfNeeded =
      // itemsResult != null ? repository.calculationLoopOverLimit() : false;
      itemsResult != null && repository.calculationLoopOverLimit();
  return displayLoopWarningIfNeeded;
}

@riverpod
Future<Pair<RowAction, StoreResult>> _rowActionStore(
    _RowActionStoreRef ref) async {
  final rowAction = ref.watch(_rowActionFromIntentProvider);
  final formViewRepo = ref.read(_formViewRepositoryProvider);
  final result = await formViewRepo.processUserAction(rowAction);
  return Pair<RowAction, StoreResult>(rowAction, result);
}

@riverpod
class ItemsResult extends _$ItemsResult {
  @override
  FutureOr<IList<FieldUiModel>> build() {
    logInfo(info: 'itemsProvider: got built -> build()');
    final repository = ref.read(formRepositoryProvider);
    setUpListener();
    try {
      final items = repository.fetchFormItems();
      return items;
    } catch (e) {
      return const IListConst<FieldUiModel>([]);
    }
  }

  // Future<void> _fetchFormItems() async {
  //   logInfo(info: 'itemsProvider: fetchFormItems()');
  //   final repository = ref.watch(formRepositoryProvider);
  //   state = await AsyncValue.guard(repository.fetchFormItems);
  // }

  Future<void> _processCalculatedItems() async {
    logInfo(info: 'itemsProvider: processCalculatedItems()');
    final repository = ref.read(formRepositoryProvider);
    state = await AsyncValue.guard(repository.composeList);
  }

  void setUpListener() {
    ref.listen<AsyncValue<Pair<RowAction, StoreResult>>>(
        _rowActionStoreProvider,
        (AsyncValue<Pair<RowAction, StoreResult>>? previous,
            AsyncValue<Pair<RowAction, StoreResult>> next) {
      final repository = ref.read(formRepositoryProvider);
      when(next.value?.second.valueStoreResult, {
        ValueStoreResult.VALUE_CHANGED: () {
          ref.read(formModelNotifierProvider.notifier).updateValue(
              (current) => current.copyWith(savedValue: next.value?.first));
          _processCalculatedItems();
        },
        ValueStoreResult.ERROR_UPDATING_VALUE: () => ref
            .read(formModelNotifierProvider.notifier)
            .updateValue((current) =>
                current.copyWith(showToast: 'string.update_field_error')),
        ValueStoreResult.UID_IS_NOT_DE_OR_ATTR: () {
          logInfo(
              info:
                  'Timber.tag(TAG).d("${next.value?.first.id} is not a data element or attribute")');
          _processCalculatedItems();
        },
        ValueStoreResult.VALUE_NOT_UNIQUE: () {
          ref.read(formModelNotifierProvider.notifier).updateValue((current) =>
              current.copyWith(
                  showInfo: const InfoUiModel(
                      'string.error', 'string.unique_warning')));
          _processCalculatedItems();
        },
        ValueStoreResult.VALUE_HAS_NOT_CHANGED: () => _processCalculatedItems(),
        ValueStoreResult.TEXT_CHANGING: () {
          logInfo(
              info:
                  'Timber.d("${next.value?.first.id} is changing its value")');
          ref.read(formModelNotifierProvider.notifier).updateValue(
              (current) => current.copyWith(queryData: next.value?.first));
        },
        ValueStoreResult.FINISH: () async {
          await _processCalculatedItems();
          repository
              .runDataIntegrityCheck(allowDiscard: false)
              .then((integrityResult) {
            ref.read(formModelNotifierProvider.notifier).updateValue(
                (current) =>
                    current.copyWith(dataIntegrityResult: integrityResult));
          }).then((_) => _processCalculatedItems());
        }
      });
    });
  }
}

@riverpod
class FormModelNotifier extends _$FormModelNotifier {
  @override
  FormModel build() {
    logInfo(info: 'FormModelNotifier: got built -> build()');

    return FormModel();
  }

  void updateValue(FormModel Function(FormModel current) updateCallback) {
    state = updateCallback.call(state);
  }
}

// @riverpod
// Future<RowAction?> savedValue(SavedValueRef ref) async {
//   final rowActionStoreResult = await ref.watch(_rowActionStoreProvider.future);
//   final storeResultValueChanged =
//       rowActionStoreResult.second.valueStoreResult ==
//           ValueStoreResult.VALUE_CHANGED;
//   final rowActionValue = await ref.read(_rowActionStoreProvider.future);
//   return storeResultValueChanged ? rowActionValue.first : null;
// }
//
// @riverpod
// Future<RowAction?> queryData(QueryDataRef ref) async {
//   final rowActionStoreResult = await ref.watch(_rowActionStoreProvider.future);
//   final storeResultValueChanged =
//       rowActionStoreResult.second.valueStoreResult ==
//           ValueStoreResult.TEXT_CHANGING;
//   final rowActionValue = await ref.read(_rowActionStoreProvider.future);
//   if (storeResultValueChanged) {
//     logInfo(
//         info: 'Timber.d("${rowActionValue.first.id} is changing its value")');
//   }
//   return storeResultValueChanged ? rowActionValue.first : null;
// }

// @riverpod
// Future<bool> showToastUpdateFieldError(ShowToastUpdateFieldErrorRef ref) async {
//   final rowActionStoreResult = await ref.watch(_rowActionStoreProvider.future);
//   final storeResultErrorUpdatingValue =
//       rowActionStoreResult.second.valueStoreResult ==
//           ValueStoreResult.ERROR_UPDATING_VALUE;
//   return storeResultErrorUpdatingValue;
// }
//
// @riverpod
// Future<bool> showInfoNotUnique(ShowInfoNotUniqueRef ref) async {
//   final rowActionStoreResult = await ref.watch(_rowActionStoreProvider.future);
//   final storeResultNotUniqueValue =
//       rowActionStoreResult.second.valueStoreResult ==
//           ValueStoreResult.VALUE_NOT_UNIQUE;
//
//   return storeResultNotUniqueValue;
// }
