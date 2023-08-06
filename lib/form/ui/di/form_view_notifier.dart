// ignore_for_file: always_specify_types
import 'package:d2_remote/core/common/exception/exception.dart';
import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/mp/helpers/result.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../commons/extensions/standard_extensions.dart';
import '../../../commons/extensions/string_extension.dart';
import '../../../commons/helpers/collections.dart';
import '../../../commons/logging/logging.dart';
import '../../di/injector.dart';
import '../../model/Ui_render_type.dart';
import '../../model/action_type.dart';
import '../../model/field_ui_model.dart';
import '../../model/form_repository_records.dart';
import '../../model/row_action.dart';
import '../../model/store_result.dart';
import '../../model/value_store_result.dart';
import '../form_model.dart';
import '../intent/form_intent.dart';
import '../validation/validators/field_mask_validator.dart';

part 'form_view_notifier.g.dart';

part 'form_view_notifiers_helpers.dart';

@riverpod
FormRepositoryRecords formRepositoryRecordsInstance(
    FormRepositoryRecordsInstanceRef ref) {
  throw UnimplementedError();
}

@riverpod
class FormPendingIntents extends _$FormPendingIntents {
  @override
  FormIntent build() {
    return const FormIntent.init();
  }

  @override
  bool updateShouldNotify(FormIntent previous, FormIntent next) {
    logInfo(
        info:
            'FormPendingIntents: updateShouldNotify(oldI,newI): oldI: $previous, newI: $next');
    if (previous is OnFinish && next is OnFinish) {
      return false;
    } else {
      return previous != next;
    }
  }

  void submitIntent(FormIntent Function(FormIntent current) updateCallback) {
    logInfo(info: 'FormPendingIntents: submitIntent(), current: $state');
    state = updateCallback.call(state);
  }
}

@riverpod
RowAction _rowActionFromIntent(_RowActionFromIntentRef ref) {
  final pendingIntents = ref.watch(formPendingIntentsProvider);
  logInfo(info: '_rowActionFromIntent');
  return _getRowActionFromIntent(pendingIntents);
}

@Riverpod(dependencies: [FormViewItems])
Future<Pair<RowAction, StoreResult>> rowActionStore(
    RowActionStoreRef ref) async {
  final rowAction = ref.watch(_rowActionFromIntentProvider);
  final formViewItemsNotifier = ref.read(formViewItemsProvider.notifier);
  final result = await formViewItemsNotifier.processUserAction(rowAction);
  logInfo(
      info: 'rowActionStore: processing rowActionFromIntent, '
          'rowActionType: ${rowAction.type}, StoreResult: ${result.valueStoreResult}');
  return Pair<RowAction, StoreResult>(rowAction, result);
}

// @Riverpod(dependencies: [_rowActionFromIntent])
@riverpod
bool formViewFocused(FormViewFocusedRef ref) {
  return ref.watch(_rowActionFromIntentProvider
      .select((rowAction) => rowAction.type == ActionType.ON_FOCUS));
}

// @Riverpod(dependencies: [_rowActionFromIntent, FormItems])
@Riverpod(dependencies: [FormViewItems])
bool formViewLoading(FormViewLoadingRef ref) {
  final onSaveRowActionType = ref.watch(
          _rowActionFromIntentProvider.select((rowAction) => rowAction.type)) ==
      ActionType.ON_SAVE;
  final bool dataIsLoading = ref.watch(formViewItemsProvider
      .select((itemsResultAsyncValue) => itemsResultAsyncValue.isLoading));
  final loading = onSaveRowActionType || dataIsLoading;
  return loading;
}

// _completionPercentage
// @Riverpod(dependencies: [_formViewRepository, FormItems])
@Riverpod(dependencies: [FormViewItems])
double completionPercentage(CompletionPercentageRef ref) {
  final formViewItemsNotifier = ref.read(formViewItemsProvider.notifier);
  final IList<FieldUiModel>? itemsResult = ref.watch(formViewItemsProvider
      .select((itemsResultAsyncValue) => itemsResultAsyncValue.value));
  final percentage = formViewItemsNotifier.completedFieldsPercentage(
      itemsResult ?? const IListConst<FieldUiModel>([]));
  logInfo(info: 'completionPercentage: percentage $percentage');
  return percentage;
}

// @Riverpod(dependencies: [_formViewRepository, FormItems])
@Riverpod(dependencies: [FormViewItems])
bool calculationLoop(CalculationLoopRef ref) {
  final formViewItemsNotifier = ref.read(formViewItemsProvider.notifier);
  final IList<FieldUiModel>? itemsResult = ref.watch(formViewItemsProvider
      .select((itemsResultAsyncValue) => itemsResultAsyncValue.value));
  final displayLoopWarningIfNeeded =
      // itemsResult != null ? repository.calculationLoopOverLimit() : false;
      itemsResult != null && formViewItemsNotifier.calculationLoopOverLimit();
  return displayLoopWarningIfNeeded;
}

@Riverpod(dependencies: [formRepository])
class FormViewItems extends _$FormViewItems {
  // FormViewItems(this._repository);
  // late final FormRepository _repository;

  @override
  FutureOr<IList<FieldUiModel>> build() {
    final repository = ref.read(formRepositoryProvider);
    logInfo(info: 'itemsProvider: got built -> build()');
    try {
      final items = repository.fetchFormItems();
      return items;
    } catch (e) {
      return const IListConst<FieldUiModel>([]);
    }
  }

  Future<void> loadData() async {
    final repository = ref.read(formRepositoryProvider);
    logInfo(info: 'itemsProvider: fetchFormItems()');
    state = await AsyncValue.guard(repository.fetchFormItems);
  }

  Future<void> processCalculatedItems() async {
    final repository = ref.read(formRepositoryProvider);
    logInfo(info: 'itemsProvider: processCalculatedItems()');
    state = await AsyncValue.guard(repository.composeList);
  }

  Future<StoreResult> processUserAction(RowAction action) async {
    final repository = ref.read(formRepositoryProvider);
    switch (action.type) {
      case ActionType.ON_SAVE:
        if (action.valueType == ValueType.COORDINATE) {
          repository.setFieldRequestingCoordinates(action.id, false);
        }
        repository.updateErrorList(action);
        if (action.error != null) {
          return StoreResult(
              uid: action.id,
              valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
        } else {
          final StoreResult? saveResult =
              await repository.save(action.id, action.value, action.extraData);
          await repository.updateValueOnList(
              action.id, action.value, action.valueType);
          return saveResult ??
              StoreResult(
                  uid: action.id,
                  valueStoreResult: ValueStoreResult.VALUE_CHANGED);
        }

      case ActionType.ON_FOCUS:
      case ActionType.ON_NEXT:
        final StoreResult storeResult = await _saveLastFocusedItem(action);
        repository.setFocusedItem(action);
        return storeResult;

      case ActionType.ON_TEXT_CHANGE:
        await repository.updateValueOnList(
            action.id, action.value, action.valueType);
        return StoreResult(
            uid: action.id, valueStoreResult: ValueStoreResult.TEXT_CHANGING);
      case ActionType.ON_SECTION_CHANGE:
        repository.updateSectionOpened(action);
        return StoreResult(
            uid: action.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);

      case ActionType.ON_CLEAR:
        repository.removeAllValues();
        return StoreResult(
            uid: action.id, valueStoreResult: ValueStoreResult.VALUE_CHANGED);

      case ActionType.ON_FINISH:
        repository.setFocusedItem(action);
        return const StoreResult(
            uid: '', valueStoreResult: ValueStoreResult.FINISH);

      case ActionType.ON_REQUEST_COORDINATES:
        repository.setFieldRequestingCoordinates(action.id, true);
        return StoreResult(
            uid: action.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);

      case ActionType.ON_CANCELL_REQUEST_COORDINATES:
        repository.setFieldRequestingCoordinates(action.id, false);
        return StoreResult(
            uid: action.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
      case ActionType.ON_INIT:
        return StoreResult(
            uid: action.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }
  }

  Future<StoreResult> _saveLastFocusedItem(RowAction rowAction) async {
    final repository = ref.read(formRepositoryProvider);
    final FieldUiModel? field = _getLastFocusedTextItem();
    if (field != null) {
      final Exception? error =
          _checkFieldError(field.valueType, field.value, field.fieldMask);
      if (error != null) {
        final RowAction action = _getRowActionFromIntent(FormIntent.onSave(
            uid: field.uid,
            value: field.value,
            valueType: field.valueType,
            fieldMask: field.fieldMask));
        repository.updateErrorList(action);
        return StoreResult(
            uid: rowAction.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
      } else {
        final FormIntent intent = _getSaveIntent(field);
        final RowAction action = _getRowActionFromIntent(intent);
        final StoreResult? result =
            await repository.save(field.uid, field.value, action.extraData);
        await repository.updateValueOnList(
            field.uid, field.value, field.valueType);
        repository.updateErrorList(action);
        if (result != null) {
          return result;
        }
      }
    }
    return StoreResult(
        uid: rowAction.id,
        valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
  }

  FormIntent _getSaveIntent(FieldUiModel field) {
    switch (field.valueType) {
      case ValueType.COORDINATE:
        return FormIntent.saveCurrentLocation(
            uid: field.uid,
            value: field.value,
            featureType: 'POINT' /*getFeatureType(field.renderingType).name*/);
      default:
    }
    return FormIntent.onSave(
        uid: field.uid,
        value: field.value,
        valueType: field.valueType,
        fieldMask: field.fieldMask);
  }

  /// called when:
  ///
  /// 1- onBack btn pressed
  ///
  /// 2- When User presses save after finishing entry, which emits a [FormIntent]
  /// of [OnFinish] which gets converted to [RowAction] of
  /// [ActionType.ON_FINISH], which then converted to a [StoreResult] of
  /// [ValueStoreResult.FINISH]
  void runDataIntegrityCheck({bool? backButtonPressed}) {
    ref
        .read(formRepositoryProvider)
        .runDataIntegrityCheck(allowDiscard: backButtonPressed ?? false)
        .then((integrityResult) {
      ref.read(formModelNotifierProvider.notifier).updateValue(
          (current) => current.copyWith(dataIntegrityResult: integrityResult));
    }).then((_) => processCalculatedItems());
  }

  // TODO(NMC): move to another provider so we don't have to change another notifier
  // from this notifier and directly call this function from widget tree
  void saveDataEntry() {
    _getLastFocusedTextItem()?.let((FieldUiModel it) => ref
        .read(formPendingIntentsProvider.notifier)
        .submitIntent((_) => _getSaveIntent(it)));

    ref
        .read(formPendingIntentsProvider.notifier)
        .submitIntent((_) => const FormIntent.onFinish());
  }

  // TODO(NMC): move to another provider so we don't have to change another notifier
  // from this notifier and directly call this function from widget tree
  void discardChanges() {
    final repository = ref.read(formRepositoryProvider);
    repository.backupOfChangedItems().forEach((FieldUiModel item) => ref
        .read(formPendingIntentsProvider.notifier)
        .submitIntent((_) => FormIntent.onSave(
            uid: item.uid,
            value: item.value,
            valueType: item.valueType,
            fieldMask: item.fieldMask)));
  }

  FieldUiModel? _getLastFocusedTextItem() {
    final repository = ref.read(formRepositoryProvider);
    return repository.currentFocusedItem()?.takeIf((FieldUiModel item) =>
        item.valueType?.let((ValueType valueType) =>
            valueTypeIsTextField(valueType, item.renderingType)) ??
        false);
  }

  bool valueTypeIsTextField(ValueType valueType, [UiRenderType? renderType]) {
    return valueType.isNumeric ||
        valueType.isText && renderType?.isPolygon != true ||
        valueType == ValueType.URL ||
        valueType == ValueType.EMAIL ||
        valueType == ValueType.PHONE_NUMBER;
  }

  void clearFocus() {
    ref.read(formRepositoryProvider).clearFocusItem();
  }

  bool calculationLoopOverLimit() {
    return ref.read(formRepositoryProvider).calculationLoopOverLimit();
  }

  double completedFieldsPercentage(IList<FieldUiModel> value) {
    return ref.read(formRepositoryProvider).completedFieldsPercentage(value);
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

@riverpod
int formViewIndex(FormViewIndexRef ref) {
  throw UnimplementedError();
}
