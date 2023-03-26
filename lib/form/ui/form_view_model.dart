import 'package:d2_remote/core/common/feature_type.dart';
import 'package:d2_remote/core/common/value_type.dart';
import 'package:dartx/dartx_io.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart' as mapping;

import '../../commons/extensions/standard_extensions.dart';
import '../data/data_integrity_check_result.dart';
import '../data/form_repository.dart';
import '../model/Ui_render_type.dart';
import '../model/action_type.dart';
import '../model/field_ui_model.dart';
import '../model/info_ui_model.dart';
import '../model/row_action.dart';
import '../model/store_result.dart';
import '../model/value_store_result.dart';
import 'intent/form_intent.dart';
import 'validation/validators/field_mask_validator.dart';

/// MVC: Model-View-Controller
/// https://medium.flutterdevs.com/design-patterns-in-flutter-part-2-mvp-e17b3be2e51b
/// we could say about MVC that:
/// - Controllers are based on behaviors and can be shared across views
/// - Can be responsible for determining which view to display
///
/// MVP: But in MVP as in enrollment or orgUnitSelector or most specialized views: We used MVP
/// MVP: All invocations from the View delegate directly to the Presenter.
/// The Presenter is also decoupled directly from the View and talks to it through an interface.
///
/// So According to this, we could say about MVP that:
/// - The view is more loosely coupled to the model. The presenter is responsible for
/// binding the model to the view.
/// - Easier to unit test because interaction with the view is through an interface.
/// - Usually view to presenter map one to one. Complex views may have multi presenters.

// class FormViewModel extends ViewModel {
class FormViewModel extends GetxController implements Listenable {
  final FormRepository _repository;

  // static const TAG = 'FormViewModel';

  // GeometryController _geometryController = GeometryController(GeometryParserImpl());
  FormViewModel(this._repository /*, this._geometryController*/);

  final loading = true.obs;
  final showToast = Rx<String?>(null);
  final focused = Rx<bool?>(null);
  final showInfo = Rx<InfoUiModel?>(null);

  // final confError = Rx<List<RulesUtilsProviderConfigurationError>?>();

  final _items = Rx<List<FieldUiModel>?>(null);

  Stream<List<FieldUiModel>?> get items => _items.stream;

  final _savedValue = Rx<RowAction?>(null);

  Stream<RowAction> get savedValue => _savedValue.stream.whereNotNull();

  final _queryData = Rx<RowAction?>(null);

  Stream<RowAction> get queryData => _queryData.stream.whereNotNull();

  final _dataIntegrityResult = Rx<DataIntegrityCheckResult?>(null);

  Stream<DataIntegrityCheckResult?> get dataIntegrityResult =>
      _dataIntegrityResult.stream;

  final _completionPercentage = Rx<double?>(null);

  Stream<double?> get completionPercentage => _completionPercentage.stream;

  final _calculationLoop = false.obs;

  Stream<bool> get calculationLoop => _calculationLoop.stream;

  final _pendingIntents = Rx<FormIntent?>(null);

  // NMC
  Stream<FormIntent?> get _pendingIntentsStream =>
      _pendingIntents.stream.asBroadcastStream();

  @override
  void onInit() async {
    _pendingIntentsStream
        .distinct((oldI, newI) {
          if (oldI is OnFinish && newI is OnFinish) {
            return false;
          } else {
            return oldI == newI;
          }
        })
        // NMC
        // .whereType<FormIntent>()
        .whereNotNull() // equivalent to whereType<FormIntent>()
        .map((intent) => _createRowActionStore(intent))
        .listen((event) async {
          _displayResult(await event);
        });
    super.onInit();
  }

  void _displayResult(Pair<RowAction, StoreResult> result) {
    switch (result.second.valueStoreResult) {
      case ValueStoreResult.VALUE_CHANGED:
        _savedValue.value = result.first;
        _processCalculatedItems();
        break;
      case ValueStoreResult.ERROR_UPDATING_VALUE:
        showToast.value = 'string.update_field_error';
        break;
      case ValueStoreResult.UID_IS_NOT_DE_OR_ATTR:
        print(
            'Timber.tag(TAG).d("${result.first.id} is not a data element or attribute")');
        _processCalculatedItems();
        break;
      case ValueStoreResult.VALUE_NOT_UNIQUE:
        showInfo.value =
            const InfoUiModel('string.error', 'string.unique_warning');
        _processCalculatedItems();
        break;
      case ValueStoreResult.VALUE_HAS_NOT_CHANGED:
        _processCalculatedItems();
        break;
      case ValueStoreResult.TEXT_CHANGING:
        print('Timber.d("${result.first.id} is changing its value")');
        _queryData.value = result.first;
        break;
      case ValueStoreResult.FINISH:
        _processCalculatedItems();
        runDataIntegrityCheck();
        break;
    }
  }

  Future<Pair<RowAction, StoreResult>> _createRowActionStore(
      FormIntent intent) async {
    final rowAction = _rowActionFromIntent(intent);

    if (rowAction.type == ActionType.ON_FOCUS) {
      // focused.postValue(true);
      focused.value = true;
    } else if (rowAction.type == ActionType.ON_SAVE) {
      // loading.postValue(true);
      loading.value = true;
    }

    final result = await _processUserAction(rowAction);
    return Pair(rowAction, result);
  }

  Future<StoreResult> _processUserAction(RowAction action) async {
    switch (action.type) {
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
          final saveResult =
              await _repository.save(action.id, action.value, action.extraData);
          await _repository.updateValueOnList(
              action.id, action.value, action.valueType);
          return saveResult ??
              StoreResult(
                  uid: action.id,
                  valueStoreResult: ValueStoreResult.VALUE_CHANGED);
        }

      case ActionType.ON_FOCUS:
      case ActionType.ON_NEXT:
        final storeResult = await _saveLastFocusedItem(action);
        _repository.setFocusedItem(action);
        return storeResult;

      case ActionType.ON_TEXT_CHANGE:
        await _repository.updateValueOnList(
            action.id, action.value, action.valueType);
        return StoreResult(
            uid: action.id, valueStoreResult: ValueStoreResult.TEXT_CHANGING);
      case ActionType.ON_SECTION_CHANGE:
        _repository.updateSectionOpened(action);
        return StoreResult(
            uid: action.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);

      case ActionType.ON_CLEAR:
        _repository.removeAllValues();
        return StoreResult(
            uid: action.id, valueStoreResult: ValueStoreResult.VALUE_CHANGED);

      case ActionType.ON_FINISH:
        _repository.setFocusedItem(action);
        return const StoreResult(
            uid: '', valueStoreResult: ValueStoreResult.FINISH);

      case ActionType.ON_REQUEST_COORDINATES:
        _repository.setFieldRequestingCoordinates(action.id, true);
        return StoreResult(
            uid: action.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);

      case ActionType.ON_CANCELL_REQUEST_COORDINATES:
        _repository.setFieldRequestingCoordinates(action.id, false);
        return StoreResult(
            uid: action.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
    }
  }

  Future<StoreResult> _saveLastFocusedItem(RowAction rowAction) async {
    final FieldUiModel? field = _getLastFocusedTextItem();
    if (field != null) {
      final error =
          _checkFieldError(field.valueType, field.value, field.fieldMask);
      if (error != null) {
        final action = _rowActionFromIntent(FormIntent.onSave(
            uid: field.uid,
            value: field.value,
            valueType: field.valueType,
            fieldMask: field.fieldMask));
        _repository.updateErrorList(action);
        return StoreResult(
            uid: rowAction.id,
            valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
      } else {
        final intent = _getSaveIntent(field);
        final action = _rowActionFromIntent(intent);
        final result =
            await _repository.save(field.uid, field.value, action.extraData);
        await _repository.updateValueOnList(
            field.uid, field.value, field.valueType);
        _repository.updateErrorList(action);
        if (result != null) {
          return result;
        }
      }
    }
    return StoreResult(
        uid: rowAction.id,
        valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
  }

  bool valueTypeIsTextField(ValueType valueType, UiRenderType? renderType) {
    return valueType.isNumeric ||
        valueType.isText && renderType?.isPolygon != true ||
        valueType == ValueType.URL ||
        valueType == ValueType.EMAIL ||
        valueType == ValueType.PHONE_NUMBER;
  }

  FieldUiModel? _getLastFocusedTextItem() {
    return _repository.currentFocusedItem()?.takeIf((item) =>
        item.valueType?.let((valueType) =>
            valueTypeIsTextField(valueType, item.renderingType)) ??
        false);
  }

  FormIntent _getSaveIntent(FieldUiModel field) {
    switch (field.valueType) {
      case ValueType.COORDINATE:
        return FormIntent.saveCurrentLocation(
            uid: field.uid,
            value: field.value,
            featureType: 'POINT' /*getFeatureType(field.renderingType).name*/);
      default:
        return FormIntent.onSave(
            uid: field.uid,
            value: field.value,
            valueType: field.valueType,
            fieldMask: field.fieldMask);
    }
  }

  RowAction _rowActionFromIntent(FormIntent intent) {
    return intent.map(
        onClear: (intent) => _createRowAction(
            uid: '', value: null, actionType: ActionType.ON_CLEAR),
        clearValue: (intent) => _createRowAction(uid: intent.uid, value: null),
        selectLocationFromCoordinates: (intent) {
          final error =
              _checkFieldError(ValueType.COORDINATE, intent.coordinates, null);
          return _createRowAction(
              uid: intent.uid,
              value: intent.coordinates,
              extraData: intent.extraData,
              error: error,
              valueType: ValueType.COORDINATE);
        },
        selectLocationFromMap: (intent) => _setCoordinateFieldValue(
            fieldUid: intent.uid,
            featureType: intent.featureType,
            coordinates: intent.coordinates),
        saveCurrentLocation: (intent) {
          final error =
              _checkFieldError(ValueType.COORDINATE, intent.value, null);
          return _createRowAction(
              uid: intent.uid,
              value: intent.value,
              extraData: intent.featureType,
              error: error,
              valueType: ValueType.COORDINATE);
        },
        onNext: (intent) => _createRowAction(
            uid: intent.uid,
            value: intent.value,
            actionType: ActionType.ON_NEXT),
        onSave: (intent) {
          final error = _checkFieldError(
              intent.valueType, intent.value, intent.fieldMask);
          return _createRowAction(
              uid: intent.uid,
              value: intent.value,
              error: error,
              valueType: intent.valueType);
        },
        onFocus: (intent) => _createRowAction(
            uid: intent.uid,
            value: intent.value,
            actionType: ActionType.ON_FOCUS),
        onTextChange: (intent) => _createRowAction(
            uid: intent.uid,
            value: intent.value,
            actionType: ActionType.ON_TEXT_CHANGE,
            valueType: ValueType.TEXT),
        onSection: (intent) => _createRowAction(
            uid: intent.sectionUid,
            value: null,
            actionType: ActionType.ON_SECTION_CHANGE),
        onFinish: (intent) => _createRowAction(
            uid: '', value: null, actionType: ActionType.ON_FINISH),
        onRequestCoordinates: (intent) => _createRowAction(
            uid: intent.uid,
            value: null,
            actionType: ActionType.ON_REQUEST_COORDINATES),
        onCancelRequestCoordinates: (intent) => _createRowAction(
            uid: intent.uid,
            value: null,
            actionType: ActionType.ON_CANCELL_REQUEST_COORDINATES));
  }

  Exception? _checkFieldError(
      ValueType? valueType, String? fieldValue, String? fieldMask) {
    if (fieldValue.isNullOrEmpty) {
      return null;
    }

    return fieldValue!.let((value) {
      Exception? error;
      final Either<Exception, String>? result = valueType
          ?.takeIf((item) => item != ValueType.IMAGE)
          ?.validator
          .validate(value);
      error = result?.fold((failure) => failure, (success) => null);

      fieldMask?.let((mask) {
        final Either<Exception, String> result =
            FieldMaskValidator(mask).validate(value);
        error = result.fold((failure) => failure, (success) => error);
      });
      return error;
    });
  }

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

  RowAction _setCoordinateFieldValue(
      {required String fieldUid,
      required String featureType,
      String? coordinates}) {
    final type = FeatureType.valueOfFeatureType(featureType);
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

  void _processCalculatedItems() {
    _repository.composeList().then((value) => _items.value = value);

    // Or if we need to make sure it builds
    // its like a trigger for build no matter what
    // _repository.composeList().then((value) => _items.subject.add(value));
  }

  /////////////////////////////////////////////////
  /////////////////////////////////////////////////
  /////////////////////////////////////////////////

  void onItemsRendered() {
    loading.value = false;
  }

  void submitIntent(FormIntent intent) {
    // viewModelScope.launch {
    _pendingIntents.value = intent;
    // }
  }

  String? getFocusedItemUid() {
    return _items.value?.first.uid;
  }

  void processCalculatedItems() {
    _repository
        .composeList()
        .then((value) => _items.value = value)
        .catchError((e) => print(e));
  }

  // void updateConfigurationErrors() {
  //   _repository
  //       .getConfigurationErrors()
  //       .then((value) => confError.value = value)
  //       .catchError((e) => print(e));
  // }

  void runDataIntegrityCheck({bool? backButtonPressed}) {
    _repository
        .runDataIntegrityCheck(allowDiscard: backButtonPressed ?? false)
        .then((result) => _dataIntegrityResult.value = result)
        // finally
        .then((_) => _repository.composeList())
        .then((list) => _items.value = list)
        .catchError((e) => print(e) /*Timber.e(e)*/);
  }

  void calculateCompletedFields() {
    _repository
        .completedFieldsPercentage(_items.value ?? [])
        .then((result) => _completionPercentage.value = result)
        .catchError((e) => print(e) /*Timber.e(e)*/);
  }

  void displayLoopWarningIfNeeded() {
    _repository
        .calculationLoopOverLimit()
        .then((result) => _calculationLoop.value = result)
        .catchError((e) => print(e) /*Timber.e(e)*/);
  }

  void discardChanges() {
    _repository.backupOfChangedItems().forEach((item) => submitIntent(
        FormIntent.onSave(
            uid: item.uid,
            value: item.value,
            valueType: item.valueType,
            fieldMask: item.fieldMask)));
  }

  void saveDataEntry() {
    _getLastFocusedTextItem()?.let((it) => submitIntent(_getSaveIntent(it)));
    submitIntent(const FormIntent.onFinish());
  }

  void loadData() {
    loading.value = true;
    _repository.fetchFormItems().then((result) => _items.value = result)
        // finally
        .catchError((e) {
      print(e); /*Timber.e(e)*/
      _items.value = [];
    });
  }

  void clearFocus() {
    _repository.clearFocusItem();
  }
}
