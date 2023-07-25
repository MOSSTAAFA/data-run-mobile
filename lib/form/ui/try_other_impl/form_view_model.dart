// import 'package:d2_remote/core/common/exception/exception.dart';
// import 'package:d2_remote/core/common/feature_type.dart';
// import 'package:d2_remote/core/common/value_type.dart';
// import 'package:d2_remote/core/mp/helpers/result.dart';
// import 'package:dartx/dartx_io.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:flutter/material.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// import '../../commons/extensions/standard_extensions.dart';
// import '../data/data_integrity_check_result.dart';
// import '../data/form_repository.dart';
// import '../di/injector.dart';
// import '../model/Ui_render_type.dart';
// import '../model/action_type.dart';
// import '../model/field_ui_model.dart';
// import '../model/info_ui_model.dart';
// import '../model/row_action.dart';
// import '../model/store_result.dart';
// import '../model/value_store_result.dart';
// import 'event/list_view_ui_events.dart';
// import 'intent/form_intent.dart';
// import 'validation/validators/field_mask_validator.dart';
//
// part 'form_view_model.g.dart';
//
// @riverpod
// FormViewModel formViewModel(FormViewModelRef ref) {
//   return FormViewModel(ref);
// }
//
// class FormViewModel {
//   // 1. Pass a Ref argument to the constructor
//   FormViewModel(this.ref) {
//     _init();
//   }
//
//   final FormViewModelRef ref;
//
//   final bool loading;
//   final String showToast;
//   final bool focused;
//   final InfoUiModel showInfo;
//
//   // List<RulesUtilsProviderConfigurationError> confError;
//
//   final List<FieldUiModel> items;
//
//   final RowAction savedValue;
//
//   final RowAction queryData;
//
//   final DataIntegrityCheckResult dataIntegrityResult;
//
//   final double completionPercentage;
//
//   final bool calculationLoop;
//
//   final FormIntent _pendingIntents;
//
//   // AutoDisposeRef
//   // GeometryController _geometryController = GeometryController(GeometryParserImpl());
//
//   void _init() {
//     ref.listen<FormIntent?>(pendingIntentsProvider,
//         (FormIntent? oldI, FormIntent? newI) {
//       // 4. Implement the event handling code
//       if (oldI is! OnFinish && newI is! OnFinish && newI != null) {
//         debugPrint(newI.toString());
//         _createRowActionStore(newI).then(
//             (Pair<RowAction, StoreResult> event) => _displayResult(event));
//       }
//     });
//   }
//
//   void _displayResult(Pair<RowAction, StoreResult> result) {
//     switch (result.second.valueStoreResult) {
//       case ValueStoreResult.VALUE_CHANGED:
//         ref.read(savedValueProvider.notifier).setValue(result.first);
//         _processCalculatedItems();
//         break;
//       case ValueStoreResult.ERROR_UPDATING_VALUE:
//         ref
//             .read(showToastProvider.notifier)
//             .setValue('string.update_field_error');
//         break;
//       case ValueStoreResult.UID_IS_NOT_DE_OR_ATTR:
//         debugPrint(
//             'Timber.tag(TAG).d("${result.first.id} is not a data element or attribute")');
//         _processCalculatedItems();
//         break;
//       case ValueStoreResult.VALUE_NOT_UNIQUE:
//         ref.read(showInfoProvider.notifier).setValue(
//             const InfoUiModel('string.error', 'string.unique_warning'));
//         _processCalculatedItems();
//         break;
//       case ValueStoreResult.VALUE_HAS_NOT_CHANGED:
//         _processCalculatedItems();
//         break;
//       case ValueStoreResult.TEXT_CHANGING:
//         debugPrint('Timber.d("${result.first.id} is changing its value")');
//         ref.read(queryDataProvider.notifier).setValue(result.first);
//         break;
//       case ValueStoreResult.FINISH:
//         _processCalculatedItems();
//         runDataIntegrityCheck();
//         break;
//       default:
//     }
//   }
//
//   Future<Pair<RowAction, StoreResult>> _createRowActionStore(
//       FormIntent intent) async {
//     final RowAction rowAction = _rowActionFromIntent(intent);
//
//     if (rowAction.type == ActionType.ON_FOCUS) {
//       // focused.postValue(true);
//       ref.read(focusedProvider.notifier).setValue(true);
//     } else if (rowAction.type == ActionType.ON_SAVE) {
//       // loading.postValue(true);
//       // ref.read(loadingProvider.notifier).setValue(true);
//     }
//
//     final StoreResult result = await _processUserAction(rowAction);
//     return Pair(rowAction, result);
//   }
//
//   Future<StoreResult> _processUserAction(RowAction action) async {
//     switch (action.type) {
//       case ActionType.ON_SAVE:
//         if (action.valueType == ValueType.COORDINATE) {
//           ref
//               .read(formRepositoryProvider)
//               .setFieldRequestingCoordinates(action.id, false);
//         }
//         ref.read(formRepositoryProvider).updateErrorList(action);
//         if (action.error != null) {
//           return StoreResult(
//               uid: action.id,
//               valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//         } else {
//           final StoreResult? saveResult = await ref
//               .read(formRepositoryProvider)
//               .save(action.id, action.value, action.extraData);
//           await ref
//               .read(formRepositoryProvider)
//               .updateValueOnList(action.id, action.value, action.valueType);
//           return saveResult ??
//               StoreResult(
//                   uid: action.id,
//                   valueStoreResult: ValueStoreResult.VALUE_CHANGED);
//         }
//
//       case ActionType.ON_FOCUS:
//       case ActionType.ON_NEXT:
//         final StoreResult storeResult = await _saveLastFocusedItem(action);
//         ref.read(formRepositoryProvider).setFocusedItem(action);
//         return storeResult;
//
//       case ActionType.ON_TEXT_CHANGE:
//         await ref
//             .read(formRepositoryProvider)
//             .updateValueOnList(action.id, action.value, action.valueType);
//         return StoreResult(
//             uid: action.id, valueStoreResult: ValueStoreResult.TEXT_CHANGING);
//       case ActionType.ON_SECTION_CHANGE:
//         ref.read(formRepositoryProvider).updateSectionOpened(action);
//         return StoreResult(
//             uid: action.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//
//       case ActionType.ON_CLEAR:
//         ref.read(formRepositoryProvider).removeAllValues();
//         return StoreResult(
//             uid: action.id, valueStoreResult: ValueStoreResult.VALUE_CHANGED);
//
//       case ActionType.ON_FINISH:
//         ref.read(formRepositoryProvider).setFocusedItem(action);
//         return const StoreResult(
//             uid: '', valueStoreResult: ValueStoreResult.FINISH);
//
//       case ActionType.ON_REQUEST_COORDINATES:
//         ref
//             .read(formRepositoryProvider)
//             .setFieldRequestingCoordinates(action.id, true);
//         return StoreResult(
//             uid: action.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//
//       case ActionType.ON_CANCELL_REQUEST_COORDINATES:
//         ref
//             .read(formRepositoryProvider)
//             .setFieldRequestingCoordinates(action.id, false);
//         return StoreResult(
//             uid: action.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//     }
//   }
//
//   Future<StoreResult> _saveLastFocusedItem(RowAction rowAction) async {
//     final FieldUiModel? field = _getLastFocusedTextItem();
//     if (field != null) {
//       final Exception? error =
//           _checkFieldError(field.valueType, field.value, field.fieldMask);
//       if (error != null) {
//         final RowAction action = _rowActionFromIntent(FormIntent.onSave(
//             uid: field.uid,
//             value: field.value,
//             valueType: field.valueType,
//             fieldMask: field.fieldMask));
//         ref.read(formRepositoryProvider).updateErrorList(action);
//         return StoreResult(
//             uid: rowAction.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//       } else {
//         final FormIntent intent = _getSaveIntent(field);
//         final RowAction action = _rowActionFromIntent(intent);
//         final StoreResult? result = await ref
//             .read(formRepositoryProvider)
//             .save(field.uid, field.value, action.extraData);
//         await ref
//             .read(formRepositoryProvider)
//             .updateValueOnList(field.uid, field.value, field.valueType);
//         ref.read(formRepositoryProvider).updateErrorList(action);
//         if (result != null) {
//           return result;
//         }
//       }
//     }
//     return StoreResult(
//         uid: rowAction.id,
//         valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   }
//
//   bool valueTypeIsTextField(ValueType valueType, [UiRenderType? renderType]) {
//     return valueType.isNumeric ||
//         valueType.isText && renderType?.isPolygon != true ||
//         valueType == ValueType.URL ||
//         valueType == ValueType.EMAIL ||
//         valueType == ValueType.PHONE_NUMBER;
//   }
//
//   FieldUiModel? _getLastFocusedTextItem() {
//     return ref.read(formRepositoryProvider).currentFocusedItem()?.takeIf(
//         (FieldUiModel item) =>
//             item.valueType?.let((ValueType valueType) =>
//                 valueTypeIsTextField(valueType, item.renderingType)) ??
//             false);
//   }
//
//   FormIntent _getSaveIntent(FieldUiModel field) {
//     switch (field.valueType) {
//       case ValueType.COORDINATE:
//         return FormIntent.saveCurrentLocation(
//             uid: field.uid,
//             value: field.value,
//             featureType: 'POINT' /*getFeatureType(field.renderingType).name*/);
//       default:
//     }
//     return FormIntent.onSave(
//         uid: field.uid,
//         value: field.value,
//         valueType: field.valueType,
//         fieldMask: field.fieldMask);
//   }
//
//   RowAction _rowActionFromIntent(FormIntent intent) {
//     return intent.map(
//         onClear: (OnClear intent) => _createRowAction(
//             uid: '', value: null, actionType: ActionType.ON_CLEAR),
//         clearValue: (ClearValue intent) =>
//             _createRowAction(uid: intent.uid, value: null),
//         selectLocationFromCoordinates: (SelectLocationFromCoordinates intent) {
//           final Exception? error =
//               _checkFieldError(ValueType.COORDINATE, intent.coordinates, null);
//           return _createRowAction(
//               uid: intent.uid,
//               value: intent.coordinates,
//               extraData: intent.extraData,
//               error: error,
//               valueType: ValueType.COORDINATE);
//         },
//         selectLocationFromMap: (SelectLocationFromMap intent) =>
//             _setCoordinateFieldValue(
//                 fieldUid: intent.uid,
//                 featureType: intent.featureType,
//                 coordinates: intent.coordinates),
//         saveCurrentLocation: (SaveCurrentLocation intent) {
//           final Exception? error =
//               _checkFieldError(ValueType.COORDINATE, intent.value, null);
//           return _createRowAction(
//               uid: intent.uid,
//               value: intent.value,
//               extraData: intent.featureType,
//               error: error,
//               valueType: ValueType.COORDINATE);
//         },
//         onNext: (OnNext intent) => _createRowAction(
//             uid: intent.uid,
//             value: intent.value,
//             actionType: ActionType.ON_NEXT),
//         onSave: (OnSave intent) {
//           final Exception? error = _checkFieldError(
//               intent.valueType, intent.value, intent.fieldMask);
//           return _createRowAction(
//               uid: intent.uid,
//               value: intent.value,
//               error: error,
//               valueType: intent.valueType);
//         },
//         onFocus: (OnFocus intent) => _createRowAction(
//             uid: intent.uid,
//             value: intent.value,
//             actionType: ActionType.ON_FOCUS),
//         onTextChange: (OnTextChange intent) => _createRowAction(
//             uid: intent.uid,
//             value: intent.value,
//             actionType: ActionType.ON_TEXT_CHANGE,
//             valueType: ValueType.TEXT),
//         onSection: (OnSection intent) => _createRowAction(
//             uid: intent.sectionUid,
//             value: null,
//             actionType: ActionType.ON_SECTION_CHANGE),
//         onFinish: (OnFinish intent) => _createRowAction(
//             uid: '', value: null, actionType: ActionType.ON_FINISH),
//         onRequestCoordinates: (OnRequestCoordinates intent) => _createRowAction(
//             uid: intent.uid,
//             value: null,
//             actionType: ActionType.ON_REQUEST_COORDINATES),
//         onCancelRequestCoordinates: (OnCancelRequestCoordinates intent) =>
//             _createRowAction(
//                 uid: intent.uid,
//                 value: null,
//                 actionType: ActionType.ON_CANCELL_REQUEST_COORDINATES));
//   }
//
//   Exception? _checkFieldError(
//       ValueType? valueType, String? fieldValue, String? fieldMask) {
//     if (fieldValue.isNullOrEmpty) {
//       return null;
//     }
//
//     return fieldValue!.let((String value) {
//       Exception? error;
//       final Result<String, ThrowableException>? result = valueType
//           ?.takeIf((ValueType item) => item != ValueType.IMAGE)
//           ?.validator
//           .validate(value);
//       error = result?.fold(
//           (Exception failure) => failure, (String success) => null);
//
//       fieldMask?.let((String mask) {
//         final Result<String, ThrowableException> result =
//             FieldMaskValidator(mask).validate(value);
//         error = result.fold(
//             (Exception failure) => failure, (String success) => error);
//       });
//       return error;
//     });
//   }
//
//   RowAction _createRowAction(
//           {required String uid,
//           String? value,
//           String? extraData,
//           Exception? error,
//           ActionType actionType = ActionType.ON_SAVE,
//           ValueType? valueType}) =>
//       RowAction(
//           id: uid,
//           value: value,
//           extraData: extraData,
//           error: error,
//           type: actionType,
//           valueType: valueType);
//
//   RowAction _setCoordinateFieldValue(
//       {required String fieldUid,
//       required String featureType,
//       String? coordinates}) {
//     final FeatureType? type = FeatureType.valueOfFeatureType(featureType);
//     String? geometryCoordinates;
//     /*coordinates?.let {
//   geometryController.generateLocationFromCoordinates(
//       type,
//       coordinates
//       )?.coordinates();*/
//
//     Exception? error;
//     if (type == FeatureType.POINT) {
//       error = _checkFieldError(ValueType.COORDINATE, geometryCoordinates, null);
//     } else {
//       error = null;
//     }
//
//     return _createRowAction(
//         uid: fieldUid,
//         value: geometryCoordinates,
//         extraData: featureType,
//         error: error,
//         valueType: ValueType.COORDINATE);
//   }
//
//   void _processCalculatedItems() {
//     ref.read(itemsProvider.notifier).processCalculatedItems();
//   }
//
//   /////////////////////////////////////////////////
//   /////////////////////////////////////////////////
//   /////////////////////////////////////////////////
//
//   void onItemsRendered() {
//     ref.read(loadingProvider.notifier).setValue(false);
//     // loading.value = false;
//   }
//
//   void submitIntent(FormIntent intent) {
//     ref.read(pendingIntentsProvider.notifier).submitIntent(intent);
//   }
//
//   String? getFocusedItemUid() {
//     return ref.read(itemsProvider).asData?.valueOrNull?.first.uid;
//   }
//
//   // void updateConfigurationErrors() {
//   //   _repository
//   //       .getConfigurationErrors()
//   //       .then((value) => confError.value = value)
//   //       .catchError((e) => debugPrint(e));
//   // }
//
//   void runDataIntegrityCheck({bool? backButtonPressed}) {
//     ref
//         .read(itemsProvider.notifier)
//         .runDataIntegrityCheck(allowDiscard: backButtonPressed ?? false);
//   }
//
//   // void calculateCompletedFields() {
//   // ref.read(completionPercentageValueProvider).calculateCompletedFields();
//   // .copyWithPrevious(previous)
//   // .completedFieldsPercentage(_items.value ?? [])
//   // .then((double result) => _completionPercentage.value = result)
//   // .catchError((e) => debugPrint(e) /*Timber.e(e)*/);
//   // }
//
//   // void displayLoopWarningIfNeeded() {
//   //   ref
//   //       .read(formRepositoryProvider)
//   //       .calculationLoopOverLimit()
//   //       .then((bool result) => _calculationLoop.value = result)
//   //       .catchError((e) => debugPrint(e) /*Timber.e(e)*/);
//   // }
//
//   void discardChanges() {
//     ref.read(formRepositoryProvider).backupOfChangedItems().forEach(
//         (FieldUiModel item) => submitIntent(FormIntent.onSave(
//             uid: item.uid,
//             value: item.value,
//             valueType: item.valueType,
//             fieldMask: item.fieldMask)));
//   }
//
//   void saveDataEntry() {
//     _getLastFocusedTextItem()
//         ?.let((FieldUiModel it) => submitIntent(_getSaveIntent(it)));
//     submitIntent(const FormIntent.onFinish());
//   }
//
//   // void loadData() {
//   //   loading.value = true;
//   //   ref
//   //       .read(formRepositoryProvider)
//   //       .fetchFormItems()
//   //       .then((List<FieldUiModel> result) => _items.value = result)
//   //       // finally
//   //       .catchError((e) {
//   //     debugPrint('Timber.e($e)');
//   //     _items.value = [];
//   //   });
//   // }
//
//   void clearFocus() {
//     ref.read(formRepositoryProvider).clearFocusItem();
//   }
// }
//
// ////////////////////////////////
// ////////////////////////////////
// ////////////////////////////////
// ////////////////////////////////
// ////////////////////////////////
// ////////////////////////////////
// ////////////////////////////////
// ////////////////////////////////
// ////////////////////////////////
//
// @riverpod
// class Loading extends _$Loading {
//   @override
//   bool build() {
//     return true;
//   }
//
//   void setValue(bool value) {
//     state = value;
//   }
// }
//
// @Riverpod(keepAlive: true)
// class ShowToast extends _$ShowToast {
//   @override
//   String? build() {
//     return null;
//   }
//
//   void setValue(String value) {
//     state = value;
//   }
// }
//
// @riverpod
// class Focused extends _$Focused {
//   @override
//   bool? build() {
//     return null;
//   }
//
//   void setValue(bool value) {
//     state = value;
//   }
// }
//
// @riverpod
// class ShowInfo extends _$ShowInfo {
//   @override
//   InfoUiModel? build() {
//     return null;
//   }
//
//   void setValue(InfoUiModel value) {
//     state = value;
//   }
// }
//
// @riverpod
// class Items extends _$Items {
//   @override
//   FutureOr<IList<FieldUiModel>> build() {
//     final FormRepository repository = ref.read(formRepositoryProvider);
//     return repository.fetchFormItems();
//   }
//
//   Future<void> loadData() async {
//     ref.read(loadingProvider.notifier).setValue(true);
//     final FormRepository repository = ref.read(formRepositoryProvider);
//     state = await AsyncValue.guard(repository.fetchFormItems);
//     ref.read(loadingProvider.notifier).setValue(false);
//   }
//
//   Future<void> processCalculatedItems() async {
//     final FormRepository repository = ref.read(formRepositoryProvider);
//     state = await AsyncValue.guard(repository.composeList);
//   }
//
//   Future<void> runDataIntegrityCheck({bool? allowDiscard}) async {
//     final AsyncValue<DataIntegrityCheckResult> result =
//         await AsyncValue.guard(() async {
//       return ref
//           .read(formRepositoryProvider)
//           .runDataIntegrityCheck(allowDiscard: allowDiscard ?? false);
//     });
//
//     ref
//         .read(dataIntegrityResultValueProvider.notifier)
//         .setValue(result.requireValue);
//     final FormRepository repository = ref.read(formRepositoryProvider);
//     state = await AsyncValue.guard(repository.composeList);
//   }
// }
//
// @riverpod
// int index(IndexRef ref) {
//   throw UnimplementedError();
// }
//
// @riverpod
// Future<int> itemsListLength(ItemsListLengthRef ref) {
//   return ref.watch(
//       itemsProvider.selectAsync((IList<FieldUiModel> list) => list.length));
// }
//
// @Riverpod(dependencies: [index])
// class FieldItem extends _$FieldItem {
//   @override
//   FieldUiModel? build(Callback callback) {
//     // final int index = ref.read(indexProvider);
//     // final FieldUiModel item = await ref
//     //     .watch(itemsProvider.selectAsync((IList<FieldUiModel> e) => e[index]));
//     // return item.setCallback(callback);
//
//     final IList<FieldUiModel>? items = ref.watch(itemsProvider).value;
//     if (items != null && items.isNotEmpty) {
//       final int index = ref.watch(indexProvider);
//       return items[index].setCallback(callback);
//     }
//     return null;
//   }
// }
//
// @riverpod
// FieldUiModel? fieldRow(FieldRowRef ref) {
//   throw UnimplementedError();
// }
//
// @riverpod
// Future<double> completionPercentageValue(CompletionPercentageValueRef ref) {
//   final IList<FieldUiModel>? items = ref.watch(itemsProvider).value;
//   return ref
//       .read(formRepositoryProvider)
//       .completedFieldsPercentage(items ?? IList());
// }
//
// @riverpod
// class SavedValue extends _$SavedValue {
//   @override
//   RowAction? build() {
//     return null;
//   }
//
//   void setValue(RowAction value) {
//     state = value;
//   }
// }
//
// @riverpod
// class QueryData extends _$QueryData {
//   @override
//   RowAction? build() {
//     return null;
//   }
//
//   void setValue(RowAction value) {
//     state = value;
//   }
// }
//
// @riverpod
// class CalculationLoopValue extends _$CalculationLoopValue {
//   @override
//   FutureOr<bool> build() {
//     return false;
//   }
//
//   Future<void> displayLoopWarningIfNeeded() async {
//     state = await AsyncValue.guard(
//         ref.read(formRepositoryProvider).calculationLoopOverLimit);
//   }
// }
//
// @riverpod
// class DataIntegrityResultValue extends _$DataIntegrityResultValue {
//   @override
//   DataIntegrityCheckResult? build() {
//     return null;
//   }
//
//   void setValue(DataIntegrityCheckResult value) {
//     state = value;
//   }
// }
//
// @riverpod
// class PendingIntents extends _$PendingIntents {
//   @override
//   FormIntent? build() {
//     return null;
//   }
//
//   void submitIntent(FormIntent intent) {
//     state = intent;
//   }
// }
//
// @riverpod
// class UiEvent extends _$UiEvent {
//   @override
//   ListViewUiEvents? build() {
//     return null;
//   }
//
//   void setValue(ListViewUiEvents value) {
//     state = value;
//   }
// }
//
// @riverpod
// class UiIntent extends _$UiIntent {
//   @override
//   FormIntent? build() {
//     return null;
//   }
//
//   void setValue(FormIntent value) {
//     state = value;
//   }
// }
