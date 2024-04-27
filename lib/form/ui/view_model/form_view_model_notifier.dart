import 'package:d2_remote/core/common/exception/exception.dart';
import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/common/value_type.dart';
import 'package:d2_remote/core/mp/helpers/result.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../commons/extensions/standard_extensions.dart';
import '../../../../commons/extensions/string_extension.dart';
import '../../../../commons/logging/logging.dart';
import '../../../commons/helpers/collections.dart';
import '../../data/form_repository.dart';
import '../../di/injector.dart';
import '../../model/Ui_render_type.dart';
import '../../model/action_type.dart';
import '../../model/field_ui_model.dart';
import '../../model/info_ui_model.dart';
import '../../model/row_action.dart';
import '../../model/store_result.dart';
import '../../model/value_store_result.dart';
import '../intent/form_intent.dart';
import '../validation/validators/field_mask_validator.dart';
import 'form_model_notifier.dart';
import 'form_pending_intents.dart';

part 'form_view_model_notifier.g.dart';

@riverpod
class FormViewModelNotifier extends _$FormViewModelNotifier {
  late final FormRepository _repository;

  @override
  FutureOr<IList<FieldUiModel>> build() {
    _repository = ref.watch(formRepositoryProvider);
    logInfo(info: '$runtimeType: got built, inside build method');
    ref.listen<FormIntent>(formPendingIntentsProvider, (previous, next) {
      logInfo(info: next.toString());
      _createRowActionStore(next)
          .then((Pair<RowAction, StoreResult> event) => _displayResult(event));
    });

    try {
      final items = _repository.fetchFormItems();
      return items;
    } catch (e) {
      return IList([]);
    }
    // return IList<FieldUiModel>();
  }

  // @override
  // bool updateShouldNotify(AsyncValue<IList<FieldUiModel>> previous,
  //     AsyncValue<IList<FieldUiModel>> next) {
  //   return previous != next;
  // }

  // Future<void> loadData() async {
  //   final _repository = ref.read(formRepositoryProvider);
  //   logInfo(info: 'itemsProvider: fetchFormItems()');
  //   state = await AsyncValue.guard(_repository.fetchFormItems);
  // }

  void displayLoopWarningIfNeeded() {
    final result = _repository.calculationLoopOverLimit();
    ref
        .read(formModelNotifierProvider.notifier)
        .updateValue((current) => current.copyWith(calculationLoop: result));
  }

  void calculateCompletedFields() {
    final result = _repository
        .completedFieldsPercentage(state.valueOrNull ?? const IListConst([]));

    ref.read(formModelNotifierProvider.notifier).updateValue(
        (current) => current.copyWith(completionPercentage: result));
  }

  void _displayResult(Pair<RowAction, StoreResult> result) {
    switch (result.second.valueStoreResult) {
      ///
      case ValueStoreResult.VALUE_CHANGED:
        ref.read(formModelNotifierProvider.notifier).updateValue(
            (current) => current.copyWith(savedValue: result.first));
        processCalculatedItems();
        break;

      ///
      case ValueStoreResult.ERROR_UPDATING_VALUE:
        ref.read(formModelNotifierProvider.notifier).updateValue((current) =>
            current.copyWith(showToast: 'string.update_field_error'));
        break;

      ///
      case ValueStoreResult.UID_IS_NOT_DE_OR_ATTR:
        debugPrint(
            'Timber.tag(TAG).d("${result.first.id} is not a data element or attribute")');
        processCalculatedItems();
        break;

      ///
      case ValueStoreResult.VALUE_NOT_UNIQUE:
        ref.read(formModelNotifierProvider.notifier).updateValue((current) =>
            current.copyWith(
                showInfo: const InfoUiModel(
                    'string.error', 'string.unique_warning')));
        processCalculatedItems();
        break;

      ///
      case ValueStoreResult.VALUE_HAS_NOT_CHANGED:
        processCalculatedItems();
        break;

      ///
      case ValueStoreResult.TEXT_CHANGING:
        debugPrint('Timber.d("${result.first.id} is changing its value")');
        ref.read(formModelNotifierProvider.notifier).updateValue(
            (current) => current.copyWith(queryData: result.first));
        break;

      ///
      case ValueStoreResult.FINISH:
        processCalculatedItems();
        runDataIntegrityCheck();
        break;
      default:
    }
  }

  Future<Pair<RowAction, StoreResult>> _createRowActionStore(
      FormIntent intent) async {
    final RowAction rowAction = _rowActionFromIntent(intent);

    if (rowAction.type == ActionType.ON_FOCUS) {
      // focused.postValue(true);
      ref
          .read(formModelNotifierProvider.notifier)
          .updateValue((current) => current.copyWith(focused: true));
    } else if (rowAction.type == ActionType.ON_SAVE) {
      ref
          .read(formModelNotifierProvider.notifier)
          .updateValue((current) => current.copyWith(loading: true));
      // loading.postValue(true);
    }

    final StoreResult result = await _processUserAction(rowAction);
    return Pair(rowAction, result);
  }

  RowAction _rowActionFromIntent(FormIntent intent) {
    return intent.map(
      onClear: (OnClear intent) => _createRowAction(
          uid: '', value: null, actionType: ActionType.ON_CLEAR),
      clearValue: (ClearValue intent) =>
          _createRowAction(uid: intent.uid, value: null),
      selectLocationFromCoordinates: (SelectLocationFromCoordinates intent) {
        final Exception? error =
            _checkFieldError(ValueType.COORDINATE, intent.coordinates, null);
        return _createRowAction(
            uid: intent.uid,
            value: intent.coordinates,
            extraData: intent.extraData,
            error: error,
            valueType: ValueType.COORDINATE);
      },
      selectLocationFromMap: (SelectLocationFromMap intent) =>
          _setCoordinateFieldValue(
              fieldUid: intent.uid,
              featureType: intent.featureType,
              coordinates: intent.coordinates),
      saveCurrentLocation: (SaveCurrentLocation intent) {
        final Exception? error =
            _checkFieldError(ValueType.COORDINATE, intent.value, null);
        return _createRowAction(
            uid: intent.uid,
            value: intent.value,
            extraData: intent.featureType,
            error: error,
            valueType: ValueType.COORDINATE);
      },
      onNext: (OnNext intent) => _createRowAction(
          uid: intent.uid, value: intent.value, actionType: ActionType.ON_NEXT),
      onSave: (OnSave intent) {
        final Exception? error =
            _checkFieldError(intent.valueType, intent.value, intent.fieldMask);
        return _createRowAction(
            uid: intent.uid,
            value: intent.value,
            error: error,
            valueType: intent.valueType);
      },
      onFocus: (OnFocus intent) => _createRowAction(
          uid: intent.uid,
          value: intent.value,
          actionType: ActionType.ON_FOCUS),
      onTextChange: (OnTextChange intent) => _createRowAction(
          uid: intent.uid,
          value: intent.value,
          actionType: ActionType.ON_TEXT_CHANGE,
          valueType: ValueType.TEXT),
      onSection: (OnSection intent) => _createRowAction(
          uid: intent.sectionUid,
          value: null,
          actionType: ActionType.ON_SECTION_CHANGE),
      onFinish: (OnFinish intent) => _createRowAction(
          uid: '', value: null, actionType: ActionType.ON_FINISH),
      onRequestCoordinates: (OnRequestCoordinates intent) => _createRowAction(
          uid: intent.uid,
          value: null,
          actionType: ActionType.ON_REQUEST_COORDINATES),
      onCancelRequestCoordinates: (OnCancelRequestCoordinates intent) =>
          _createRowAction(
              uid: intent.uid,
              value: null,
              actionType: ActionType.ON_CANCELL_REQUEST_COORDINATES),
      init: (Init intent) => _createRowAction(
          uid: '', value: null, actionType: ActionType.ON_INIT),
    );
  }

  Future<void> processCalculatedItems() async {
    // final _repository = ref.read(formRepositoryProvider);
    logInfo(info: 'itemsProvider: processCalculatedItems()');
    state = const AsyncLoading();
    state = await AsyncValue.guard(_repository.composeList);
  }

  Future<StoreResult> _processUserAction(RowAction action) async {
    // final _repository = ref.read(formRepositoryProvider);
    switch (action.type) {
      /// upon returning, need to processCalculatedItems() and update state
      case ActionType.ON_SAVE:
        if (action.valueType == ValueType.COORDINATE) {
          _repository.setFieldRequestingCoordinates(action.id, false);
        }
        _repository.updateErrorList(action);
        if (action.error != null) {
          return StoreResult(
              uid: action.id,
              valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
        } else {
          final StoreResult? saveResult =
              await _repository.save(action.id, action.value, action.extraData);
          await _repository.updateValueOnList(
              action.id, action.value, action.valueType);
          return saveResult ??
              StoreResult(
                  uid: action.id,
                  valueStoreResult: ValueStoreResult.VALUE_CHANGED);
        }

      /// upon returning, need to processCalculatedItems() and update state
      case ActionType.ON_FOCUS:
      case ActionType.ON_NEXT:
        final StoreResult storeResult = await _saveLastFocusedItem(action);
        _repository.setFocusedItem(action);
        return storeResult;

      case ActionType.ON_TEXT_CHANGE:
        await _repository.updateValueOnList(
            action.id, action.value, action.valueType);
        return StoreResult(
            uid: action.id, valueStoreResult: ValueStoreResult.TEXT_CHANGING);

      /// upon returning, need to processCalculatedItems() and update state
      case ActionType.ON_SECTION_CHANGE:
        _repository.updateSectionOpened(action);
        return StoreResult(
            uid: action.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);

      case ActionType.ON_CLEAR:
        _repository.removeAllValues();

        return StoreResult(
            uid: action.id, valueStoreResult: ValueStoreResult.VALUE_CHANGED);

      /// upon returning, need to processCalculatedItems() and update state
      case ActionType.ON_FINISH:
        _repository.setFocusedItem(action);

        return const StoreResult(
            uid: '', valueStoreResult: ValueStoreResult.FINISH);

      /// upon returning, need to processCalculatedItems() and update state
      case ActionType.ON_REQUEST_COORDINATES:
        _repository.setFieldRequestingCoordinates(action.id, true);

        return StoreResult(
            uid: action.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);

      /// upon returning, need to processCalculatedItems() and update state
      case ActionType.ON_CANCELL_REQUEST_COORDINATES:
        _repository.setFieldRequestingCoordinates(action.id, false);

        return StoreResult(
            uid: action.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
      case ActionType.ON_INIT:

        /// upon returning, need to processCalculatedItems() and update state
        return StoreResult(
            uid: action.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }
  }

  /// When change focus, if last LastFocusedTextItem is not null,
  /// validate it for errors, when it has error in its entered item
  /// it will _repository.updateErrorList, so on runDataIntegrity we get
  /// notified about those validation errors
  Future<StoreResult> _saveLastFocusedItem(RowAction rowAction) async {
    // final _repository = ref.read(formRepositoryProvider);
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
        _repository.updateErrorList(action);

        /// upon returning, need to processCalculatedItems() and update state
        return StoreResult(
            uid: rowAction.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
      } else {
        final FormIntent intent = _getSaveIntent(field);
        final RowAction action = _getRowActionFromIntent(intent);
        final StoreResult? result =
            await _repository.save(field.uid, field.value, action.extraData);
        await _repository.updateValueOnList(
            field.uid, field.value, field.valueType);
        _repository.updateErrorList(action);
        if (result != null) {
          return result;
        }
      }
    }

    /// upon returning, need to processCalculatedItems() and update state
    return StoreResult(
        uid: rowAction.id,
        valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
  }

  /// If [ValueType] is COORDINATE return
  /// FormIntent.saveCurrentLocation(field),
  /// otherwise return FormIntent.onSave(field...)
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
    final result = _repository.runDataIntegrityCheck(
        allowDiscard: backButtonPressed ?? false);
    ref.read(formModelNotifierProvider.notifier).updateValue(
        (current) => current.copyWith(dataIntegrityResult: result));
    processCalculatedItems();
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
    // final _repository = ref.read(formRepositoryProvider);
    _repository.backupOfChangedItems().forEach((FieldUiModel item) => ref
        .read(formPendingIntentsProvider.notifier)
        .submitIntent((_) => FormIntent.onSave(
            uid: item.uid,
            value: item.value,
            valueType: item.valueType,
            fieldMask: item.fieldMask)));
  }

  FieldUiModel? _getLastFocusedTextItem() {
    // final _repository = ref.read(formRepositoryProvider);
    final currentFocusedItem = _repository.currentFocusedItem()?.takeIf(
        (FieldUiModel item) =>
            item.valueType?.let((ValueType valueType) =>
                valueTypeIsTextField(valueType, item.renderingType)) ??
            false);
    return currentFocusedItem;
  }

  bool valueTypeIsTextField(ValueType valueType, [UiRenderType? renderType]) {
    return valueType.isNumeric ||
        valueType.isText && renderType?.isPolygon != true ||
        valueType == ValueType.URL ||
        valueType == ValueType.EMAIL ||
        valueType == ValueType.PHONE_NUMBER;
  }

  void clearFocus() {
    _repository.clearFocusItem();
  }

  bool calculationLoopOverLimit() {
    return _repository.calculationLoopOverLimit();
  }

  RowAction _getRowActionFromIntent(FormIntent intent) {
    return intent.map(
      onClear: (OnClear intent) => _createRowAction(
          uid: '', value: null, actionType: ActionType.ON_CLEAR),
      clearValue: (ClearValue intent) =>
          _createRowAction(uid: intent.uid, value: null),
      selectLocationFromCoordinates: (SelectLocationFromCoordinates intent) {
        final Exception? error =
            _checkFieldError(ValueType.COORDINATE, intent.coordinates, null);
        return _createRowAction(
            uid: intent.uid,
            value: intent.coordinates,
            extraData: intent.extraData,
            error: error,
            valueType: ValueType.COORDINATE);
      },
      selectLocationFromMap: (SelectLocationFromMap intent) =>
          _setCoordinateFieldValue(
              fieldUid: intent.uid,
              featureType: intent.featureType,
              coordinates: intent.coordinates),
      saveCurrentLocation: (SaveCurrentLocation intent) {
        final Exception? error =
            _checkFieldError(ValueType.COORDINATE, intent.value, null);
        return _createRowAction(
            uid: intent.uid,
            value: intent.value,
            extraData: intent.featureType,
            error: error,
            valueType: ValueType.COORDINATE);
      },
      onNext: (OnNext intent) => _createRowAction(
          uid: intent.uid, value: intent.value, actionType: ActionType.ON_NEXT),
      onSave: (OnSave intent) {
        final Exception? error =
            _checkFieldError(intent.valueType, intent.value, intent.fieldMask);
        return _createRowAction(
            uid: intent.uid,
            value: intent.value,
            error: error,
            valueType: intent.valueType);
      },
      onFocus: (OnFocus intent) => _createRowAction(
          uid: intent.uid,
          value: intent.value,
          actionType: ActionType.ON_FOCUS),
      onTextChange: (OnTextChange intent) => _createRowAction(
          uid: intent.uid,
          value: intent.value,
          actionType: ActionType.ON_TEXT_CHANGE,
          valueType: ValueType.TEXT),
      onSection: (OnSection intent) => _createRowAction(
          uid: intent.sectionUid,
          value: null,
          actionType: ActionType.ON_SECTION_CHANGE),
      onFinish: (OnFinish intent) => _createRowAction(
          uid: '', value: null, actionType: ActionType.ON_FINISH),
      onRequestCoordinates: (OnRequestCoordinates intent) => _createRowAction(
          uid: intent.uid,
          value: null,
          actionType: ActionType.ON_REQUEST_COORDINATES),
      onCancelRequestCoordinates: (OnCancelRequestCoordinates intent) =>
          _createRowAction(
              uid: intent.uid,
              value: null,
              actionType: ActionType.ON_CANCELL_REQUEST_COORDINATES),
      init: (Init intent) => _createRowAction(
          uid: '', value: null, actionType: ActionType.ON_INIT),
    );
  }

  /// _createRowAction Global to this file function
  RowAction _createRowAction(
          {required String uid,
          String? value,
          String? extraData,
          Exception? error,
          ActionType actionType = ActionType.ON_SAVE,
          ValueType? valueType}) =>
      RowAction(
          id: uid,
          value: value,
          extraData: extraData,
          error: error,
          type: actionType,
          valueType: valueType);

  /// When Field has a value it will
  /// Validate the value against all validation rules
  ThrowableException? _checkFieldError(
      ValueType? valueType, String? fieldValue, String? fieldMask) {
    if (fieldValue.isNullOrEmpty) {
      return null;
    }

    /// for debugging or directly return it
    final ThrowableException? checkResult = fieldValue!.let((String value) {
      ThrowableException? error;
      final Result<String, ThrowableException>? result = valueType
          ?.takeIf((ValueType item) => item != ValueType.IMAGE)
          ?.validator
          .validate(value);
      error = result?.fold(
          (ThrowableException failure) => failure, (String success) => null);

      fieldMask?.let((String mask) {
        final Result<String, ThrowableException> result =
            FieldMaskValidator(mask).validate(value);
        error = result.fold(
            (ThrowableException failure) => failure, (String success) => error);
      });
      return error;
    });

    return checkResult;
  }

  RowAction _setCoordinateFieldValue(
      {required String fieldUid,
      required String featureType,
      String? coordinates}) {
    final FeatureType? type = FeatureType.valueOfFeatureType(featureType);
    String? geometryCoordinates;
    /*coordinates?.let {
  geometryController.generateLocationFromCoordinates(
      type,
      coordinates
      )?.coordinates();*/

    Exception? error;
    if (type == FeatureType.POINT) {
      error = _checkFieldError(ValueType.COORDINATE, geometryCoordinates, null);
    } else {
      error = null;
    }

    return _createRowAction(
        uid: fieldUid,
        value: geometryCoordinates,
        extraData: featureType,
        error: error,
        valueType: ValueType.COORDINATE);
  }
}

@riverpod
int formViewIndex(FormViewIndexRef ref) {
  throw UnimplementedError();
}
