// part 'form_view_model.g.dart';

// @riverpod
// class FormRepositoryRecordsInstance extends _$FormRepositoryRecordsInstance {
//   @override
//   FormRepositoryRecords build() {
//     return const FormRepositoryRecords();
//   }
//
//   void updateValue(
//       FormRepositoryRecords Function(FormRepositoryRecords current) updateCallback) =>
//       state = updateCallback.call(state);
// }

// @riverpod
// FormViewModel formViewModel(FormViewModelRef ref) {
//   return FormViewModel(
//       ref, ref.watch(formRepositoryProvider));
// }
//
// class FormViewModel {
//   // 1. Pass a Ref argument to the constructor
//   FormViewModel(this.ref, this.repository) {
//     _init();
//   }
//
//   final FormViewModelRef ref;
//
//   final FormRepository repository;
//
//   // GeometryController _geometryController = GeometryController(GeometryParserImpl());
//
//   void _init() {
//     ref.listen<FormIntent?>(
//         formModelInstanceProvider
//             .select((FormModel formModel) => formModel.pendingIntents),
//             (FormIntent? oldI, FormIntent? newI) {
//           // 4. Implement the event handling code
//           if (oldI is! OnFinish && newI is! OnFinish && newI != null) {
//             // debugPrint(newI.toString());
//             logInfo(info: newI.toString());
//             _createRowActionStore(newI).then(
//                     (Pair<RowAction, StoreResult> event) =>
//                     _displayResult(event));
//           }
//         });
//     // loadData();
//   }
//
//   void _displayResult(Pair<RowAction, StoreResult> result) {
//     switch (result.second.valueStoreResult) {
//       case ValueStoreResult.VALUE_CHANGED:
//         ref.read(formModelInstanceProvider.notifier).updateValue(
//                 (current) => current.copyWith(savedValue: result.first));
//         _processCalculatedItems();
//         break;
//       case ValueStoreResult.ERROR_UPDATING_VALUE:
//         ref.read(formModelInstanceProvider.notifier).updateValue((current) =>
//             current.copyWith(showToast: 'string.update_field_error'));
//         break;
//       case ValueStoreResult.UID_IS_NOT_DE_OR_ATTR:
//         debugPrint(
//             'Timber.tag(TAG).d("${result.first
//                 .id} is not a data element or attribute")');
//         _processCalculatedItems();
//         break;
//       case ValueStoreResult.VALUE_NOT_UNIQUE:
//         ref.read(formModelInstanceProvider.notifier).updateValue((current) =>
//             current.copyWith(
//                 showInfo: const InfoUiModel(
//                     'string.error', 'string.unique_warning')));
//         _processCalculatedItems();
//         break;
//       case ValueStoreResult.VALUE_HAS_NOT_CHANGED:
//         _processCalculatedItems();
//         break;
//       case ValueStoreResult.TEXT_CHANGING:
//         debugPrint('Timber.d("${result.first.id} is changing its value")');
//         ref.read(formModelInstanceProvider.notifier).updateValue(
//                 (current) => current.copyWith(queryData: result.first));
//         break;
//       case ValueStoreResult.FINISH:
//         _processCalculatedItems();
//         runDataIntegrityCheck();
//         break;
//       default:
//     }
//   }

//   /// created
//   Future<Pair<RowAction, StoreResult>> _createRowActionStore(
//       FormIntent intent) async {
//     final RowAction rowAction = _rowActionFromIntent(intent);
//
//     if (rowAction.type == ActionType.ON_FOCUS) {
//       // focused.postValue(true);
//       ref
//           .read(formModelInstanceProvider.notifier)
//           .updateValue((current) => current.copyWith(focused: true));
//     } else if (rowAction.type == ActionType.ON_SAVE) {
//       ref
//           .read(formModelInstanceProvider.notifier)
//           .updateValue((current) => current.copyWith(loading: true));
//       // loading.postValue(true);
//     }
//
//     final StoreResult result = await _processUserAction(rowAction);
//     return Pair(rowAction, result);
//   }
//
//   /// created
//   Future<StoreResult> _processUserAction(RowAction action) async {
//     switch (action.type) {
//       case ActionType.ON_SAVE:
//         if (action.valueType == ValueType.COORDINATE) {
//           repository.setFieldRequestingCoordinates(action.id, false);
//         }
//         repository.updateErrorList(action);
//         if (action.error != null) {
//           return StoreResult(
//               uid: action.id,
//               valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//         } else {
//           final StoreResult? saveResult =
//           await repository.save(action.id, action.value, action.extraData);
//           await repository.updateValueOnList(
//               action.id, action.value, action.valueType);
//           return saveResult ??
//               StoreResult(
//                   uid: action.id,
//                   valueStoreResult: ValueStoreResult.VALUE_CHANGED);
//         }
//
//       case ActionType.ON_FOCUS:
//       case ActionType.ON_NEXT:
//         final StoreResult storeResult = await _saveLastFocusedItem(action);
//         repository.setFocusedItem(action);
//         return storeResult;
//
//       case ActionType.ON_TEXT_CHANGE:
//         await repository.updateValueOnList(
//             action.id, action.value, action.valueType);
//         return StoreResult(
//             uid: action.id, valueStoreResult: ValueStoreResult.TEXT_CHANGING);
//       case ActionType.ON_SECTION_CHANGE:
//         repository.updateSectionOpened(action);
//         return StoreResult(
//             uid: action.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//
//       case ActionType.ON_CLEAR:
//         repository.removeAllValues();
//         return StoreResult(
//             uid: action.id, valueStoreResult: ValueStoreResult.VALUE_CHANGED);
//
//       case ActionType.ON_FINISH:
//         repository.setFocusedItem(action);
//         return const StoreResult(
//             uid: '', valueStoreResult: ValueStoreResult.FINISH);
//
//       case ActionType.ON_REQUEST_COORDINATES:
//         repository.setFieldRequestingCoordinates(action.id, true);
//         return StoreResult(
//             uid: action.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//
//       case ActionType.ON_CANCELL_REQUEST_COORDINATES:
//         repository.setFieldRequestingCoordinates(action.id, false);
//         return StoreResult(
//             uid: action.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//     }
//   }
//
//   /// created
//   Future<StoreResult> _saveLastFocusedItem(RowAction rowAction) async {
//     final FieldUiModel? field = _getLastFocusedTextItem();
//     if (field != null) {
//       final Exception? error =
//       _checkFieldError(field.valueType, field.value, field.fieldMask);
//       if (error != null) {
//         final RowAction action = _rowActionFromIntent(FormIntent.onSave(
//             uid: field.uid,
//             value: field.value,
//             valueType: field.valueType,
//             fieldMask: field.fieldMask));
//         repository.updateErrorList(action);
//         return StoreResult(
//             uid: rowAction.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//       } else {
//         final FormIntent intent = _getSaveIntent(field);
//         final RowAction action = _rowActionFromIntent(intent);
//         final StoreResult? result =
//         await repository.save(field.uid, field.value, action.extraData);
//         await repository.updateValueOnList(
//             field.uid, field.value, field.valueType);
//         repository.updateErrorList(action);
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
//   /// created
//   bool valueTypeIsTextField(ValueType valueType, [UiRenderType? renderType]) {
//     return valueType.isNumeric ||
//         valueType.isText && renderType?.isPolygon != true ||
//         valueType == ValueType.URL ||
//         valueType == ValueType.EMAIL ||
//         valueType == ValueType.PHONE_NUMBER;
//   }
//
//   /// created
//   FieldUiModel? _getLastFocusedTextItem() {
//     return repository.currentFocusedItem()?.takeIf((FieldUiModel item) =>
//     item.valueType?.let((ValueType valueType) =>
//         valueTypeIsTextField(valueType, item.renderingType)) ??
//         false);
//   }
//
//   /// created
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
//   /// created
//   RowAction _rowActionFromIntent(FormIntent intent) {
//     return intent.map(
//         onClear: (OnClear intent) =>
//             _createRowAction(
//                 uid: '', value: null, actionType: ActionType.ON_CLEAR),
//         clearValue: (ClearValue intent) =>
//             _createRowAction(uid: intent.uid, value: null),
//         selectLocationFromCoordinates: (SelectLocationFromCoordinates intent) {
//           final Exception? error =
//           _checkFieldError(ValueType.COORDINATE, intent.coordinates, null);
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
//           _checkFieldError(ValueType.COORDINATE, intent.value, null);
//           return _createRowAction(
//               uid: intent.uid,
//               value: intent.value,
//               extraData: intent.featureType,
//               error: error,
//               valueType: ValueType.COORDINATE);
//         },
//         onNext: (OnNext intent) =>
//             _createRowAction(
//                 uid: intent.uid,
//                 value: intent.value,
//                 actionType: ActionType.ON_NEXT),
//         onSave: (OnSave intent) {
//           final Exception? error = _checkFieldError(
//               intent.valueType, intent.value, intent.fieldMask);
//           return _createRowAction(
//               uid: intent.uid,
//               value: intent.value,
//               error: error,
//               valueType: intent.valueType);
//         },
//         onFocus: (OnFocus intent) =>
//             _createRowAction(
//                 uid: intent.uid,
//                 value: intent.value,
//                 actionType: ActionType.ON_FOCUS),
//         onTextChange: (OnTextChange intent) =>
//             _createRowAction(
//                 uid: intent.uid,
//                 value: intent.value,
//                 actionType: ActionType.ON_TEXT_CHANGE,
//                 valueType: ValueType.TEXT),
//         onSection: (OnSection intent) =>
//             _createRowAction(
//                 uid: intent.sectionUid,
//                 value: null,
//                 actionType: ActionType.ON_SECTION_CHANGE),
//         onFinish: (OnFinish intent) =>
//             _createRowAction(
//                 uid: '', value: null, actionType: ActionType.ON_FINISH),
//         onRequestCoordinates: (OnRequestCoordinates intent) =>
//             _createRowAction(
//                 uid: intent.uid,
//                 value: null,
//                 actionType: ActionType.ON_REQUEST_COORDINATES),
//         onCancelRequestCoordinates: (OnCancelRequestCoordinates intent) =>
//             _createRowAction(
//                 uid: intent.uid,
//                 value: null,
//                 actionType: ActionType.ON_CANCELL_REQUEST_COORDINATES));
//   }
//
//   /// created
//   Exception? _checkFieldError(ValueType? valueType, String? fieldValue,
//       String? fieldMask) {
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
//               (Exception failure) => failure, (String success) => null);
//
//       fieldMask?.let((String mask) {
//         final Result<String, ThrowableException> result =
//         FieldMaskValidator(mask).validate(value);
//         error = result.fold(
//                 (Exception failure) => failure, (String success) => error);
//       });
//       return error;
//     });
//   }
//
//   /// created
//   RowAction _createRowAction({required String uid,
//     String? value,
//     String? extraData,
//     Exception? error,
//     ActionType actionType = ActionType.ON_SAVE,
//     ValueType? valueType}) =>
//       RowAction(
//           id: uid,
//           value: value,
//           extraData: extraData,
//           error: error,
//           type: actionType,
//           valueType: valueType);
//
//   /// created
//   RowAction _setCoordinateFieldValue({required String fieldUid,
//     required String featureType,
//     String? coordinates}) {
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
//     repository.composeList().then(
//             (items) =>
//             ref.read(itemsProvider.notifier).updateValue((_) => items));
//   }
//
//   /////////////////////////////////////////////////
//   /////////////////////////////////////////////////
//   /////////////////////////////////////////////////
//
//   void onItemsRendered() {
//     ref
//         .read(formModelInstanceProvider.notifier)
//         .updateValue((current) => current.copyWith(loading: false));
//   }
//
//   void submitIntent(FormIntent intent) {
//     ref
//         .read(formModelInstanceProvider.notifier)
//         .updateValue((current) => current.copyWith(pendingIntents: intent));
//   }
//
//   String? getFocusedItemUid() {
//     return ref
//         .read(itemsProvider)
//         .firstOrNullWhere((it) => it.focused)
//         ?.uid;
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
//     repository
//         .runDataIntegrityCheck(allowDiscard: backButtonPressed ?? false)
//         .then((result) =>
//         ref
//             .read(formModelInstanceProvider.notifier)
//             .updateValue(
//                 (state) => state.copyWith(dataIntegrityResult: result)))
//         .whenComplete(() =>
//         repository.composeList().then((itemsList) =>
//             ref.read(itemsProvider.notifier).updateValue((_) => itemsList)));
//   }
//
//   void calculateCompletedFields() {
//     repository.completedFieldsPercentage(ref.read(itemsProvider)).then(
//             (percentage) =>
//             ref
//                 .read(formModelInstanceProvider.notifier)
//                 .updateValue(
//                     (state) =>
//                     state.copyWith(completionPercentage: percentage)));
//     //.catchError((e) => debugPrint(e) /*Timber.e(e)*/);
//   }
//
//   void displayLoopWarningIfNeeded() {
//     repository.calculationLoopOverLimit().then((bool result) =>
//         ref
//             .read(formModelInstanceProvider.notifier)
//             .updateValue((current) =>
//             current.copyWith(
//                 calculationLoop:
//                 result))); //.catchError((e) => debugPrint(e) /*Timber.e(e)*/);
//   }
//
//   void discardChanges() {
//     repository.backupOfChangedItems().forEach((FieldUiModel item) =>
//         submitIntent(FormIntent.onSave(
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
//   Future<void> loadData() async {
//     ref
//         .read(formModelInstanceProvider.notifier)
//         .updateValue((current) => current.copyWith(loading: true));
//     try {
//       final items = await repository
//           .fetchFormItems();
//       ref.read(itemsProvider.notifier).updateValue((_) => items);
//     } catch (e) {
//       debugPrint(e.toString()) /*Timber.e(e)*/;
//
//       // ref.read(itemsProvider.notifier).updateValue((_) => IList());
//       // ref.invalidate(itemsProvider);
//     } finally {
//     ref
//         .read(formModelInstanceProvider.notifier)
//         .updateValue((current) => current.copyWith(loading: false));
//     }
//
//     // repository
//     //     .fetchFormItems()
//     //     .then((itemsList) =>
//     //         ref.read(itemsProvider.notifier).updateValue((_) => itemsList))
//     //     .catchError((e) {
//     //   debugPrint(e) /*Timber.e(e)*/;
//     //   ref.read(itemsProvider.notifier).updateValue((_) => IList());
//     // }).whenComplete(() => ref
//     //         .read(formModelInstanceProvider.notifier)
//     //         .updateValue((current) => current.copyWith(loading: false)));
//   }
//
//   void clearFocus() {
//     repository.clearFocusItem();
//   }
// }

////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////

// @riverpod
// class FormModelInstance extends _$FormModelInstance {
//   @override
//   FormModel build() {
//     return FormModel();
//   }
//
//   void updateValue(FormModel Function(FormModel current) updateCallback) {
//     state = updateCallback.call(state);
//   }
// }

// @riverpod
// Future<IList<FieldUiModel>> itemsFetch(ItemsFetchRef ref) {
//   final repository = ref.watch(formRepositoryProvider);
//   return repository.composeList();
// }

// @riverpod
// class Items extends _$Items {
//   @override
//   Future<IList<FieldUiModel>> build() async {
//     try {
//       final items = await ref.watch(itemsFetchProvider.future);
//       return items;
//     } catch (e) {
//       return IList();
//     }
//   }
//
//   // Future<void> fetchFormItems() async {
//   //   final FormRepository repository = ref.watch(formRepositoryProvider);
//   //   state = await AsyncValue.guard(repository.fetchFormItems);
//   // }
// //
// // Future<void> processCalculatedItems() async {
// //   final FormRepository repository = ref.read(formRepositoryProvider);
// //   state = await AsyncValue.guard(repository.composeList);
// // }
// //
// // Future<void> runDataIntegrityCheck({bool? allowDiscard}) async {
// //   final AsyncValue<DataIntegrityCheckResult> result =
// //       await AsyncValue.guard(() async {
// //     return ref
// //         .read(formRepositoryProvider)
// //         .runDataIntegrityCheck(allowDiscard: allowDiscard ?? false);
// //   });
// //
// //   ref
// //       .read(dataIntegrityResultValueProvider.notifier)
// //       .setValue(result.requireValue);
// //   final FormRepository repository = ref.read(formRepositoryProvider);
// //   state = await AsyncValue.guard(repository.composeList);
// // }
// }

// @riverpod
// Future<int> itemsListLength(ItemsListLengthRef ref) {
//   return ref.watch(
//       itemsProvider.selectAsync((IList<FieldUiModel> list) => list.length));
// }

// @Riverpod(dependencies: [index])
// class FieldItem extends _$FieldItem {
//   @override
//   FieldUiModel? build() {
//     final IList<FieldUiModel> items = ref.watch(itemsProvider);
//     if (items.isNotEmpty) {
//       final int index = ref.watch(indexProvider);
//       return items[index];
//     }
//     return null;
//   }
//
//   void setCallback(Callback callback) {
//     state = state?.setCallback(callback);
//   }
// }
//
// @riverpod
// FieldUiModel? fieldRow(FieldRowRef ref) {
//   throw UnimplementedError();
// }

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
