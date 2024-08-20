// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:mass_pro/commons/extensions/standard_extensions.dart';
// import 'package:mass_pro/commons/helpers/collections.dart';
// import 'package:mass_pro/commons/logging/logging.dart';
// import 'package:mass_pro/data_run/form/form_fields_repository.dart';
// import 'package:mass_pro/data_run/screens/form_screen/form_state/q_field.model.dart';
// import 'package:mass_pro/form/model/action_type.dart';
// import 'package:mass_pro/form/model/row_action.dart';
// import 'package:mass_pro/form/model/store_result.dart';
// import 'package:mass_pro/form/model/value_store_result.dart';
// import 'package:mass_pro/form/ui/intent/form_intent.dart';
// import 'package:mass_pro/form/ui/view_model/form_pending_intents.dart';
// import 'package:mass_pro/sdk/core/common/exception/validation_exception.dart';
// import 'package:mass_pro/sdk/core/common/value_type.dart';
// import 'package:mass_pro/sdk/core/mp/helpers/result.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// part 'form_fields_state_notifier.g.dart';
//
// @riverpod
// Future<QFieldModel> indexedFieldInput(IndexedFieldInputRef ref, String key) {
//   final Future<QFieldModel> indexedFieldModel = ref
//       .watch(formFieldsStateNotifierProvider.selectAsync((list) => list[key]!));
//   return indexedFieldModel;
// }
//
// @riverpod
// class FormFieldsStateNotifier extends _$FormFieldsStateNotifier {
//   @override
//   Future<IMap<String, QFieldModel>> build() async {
//     final FormFieldsRepository repository = getFormRepository();
//     ref.listen<FormIntent>(formPendingIntentsProvider, (previous, next) {
//       logInfo(info: next.toString());
//       _createRowActionStore(next)
//           .then((Pair<RowAction?, StoreResult> event) => _displayResult(event));
//     });
//
//     final IList<QFieldModel> fieldsList = await repository.fetchFieldsList();
//     final IMap<String, QFieldModel> fieldMap =
//         IMap.fromIterable<String, QFieldModel, QFieldModel>(fieldsList,
//             keyMapper: (field) => field.uid, valueMapper: (field) => field);
//     return fieldMap;
//   }
//
//   FormFieldsRepository getFormRepository() {
//     return ref.watch(formFieldsRepositoryProvider).requireValue;
//   }
//
//   /// whenever called it updates the state with the updated list of fields
//   /// usually on whole the list only some field are updated such as from
//   /// isVisible = true to isVisible = false for some field after running the
//   /// ruleEngine
//   Future<void> processCalculatedItems() async {
//     /// the repository will return the new updated list
//     final repository = getFormRepository();
//
//     /// updating the state
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(repository.composeFieldsMap);
//   }
//
//   /// This method is the entry point that does the whole thing
//   /// it decides when to save to the database based on the row action which is created
//   /// based on the passed **[FormIntent]**, now it triggers the save of the field
//   /// into the database when **RowAction.ActionType** is **[ActionType.ON_SAVE]**,
//   /// which only chosen and created when the **FormIntent** is either **[FormIntent.clearValue(uid)]**,
//   /// or **[FormIntent.onSave(uid: uid)]**
//   /// Pair<RowAction, StoreResult>
//   Future<Pair<RowAction?, StoreResult>> _createRowActionStore(
//       FormIntent intent) async {
//     final RowAction? rowAction = _rowActionFromIntent(intent);
//
//     if (rowAction?.type == ActionType.ON_FOCUS) {
//       final jj = 1;
//       // TODO Notify the form focus
//     } else if (rowAction?.type == ActionType.ON_SAVE) {
//       /// (rowAction?.type == ActionType.ON_SAVE) when
//       /// intent.onSave and intent.onClear a Field Value
//       // TODO
//     }
//
//     /// this where it triggers the save
//     final StoreResult result = await _processUserAction(rowAction);
//     return Pair(rowAction, result);
//   }
//
//   /// it saves the field only on [ActionType.ON_SAVE], [ActionType.ON_CLEAR]
//   /// [ActionType.ON_FOCUS], [ActionType.ON_NEXT].
//   ///
//   /// on [ActionType.ON_SAVE], and [ActionType.ON_CLEAR]:
//   ///
//   /// ```dart
//   /// _repository.updateErrorList(action);
//   /// _repository.save(action.id, action.value, action.extraData);
//   /// _repository.updateValueOnList(action.id, action.value, action.valueType);
//   /// ```
//   ///
//   /// [ActionType.ON_FOCUS] and [ActionType.ON_NEXT]
//   ///
//   /// During Creation of ActionType.ON_SAVE from FormIntent it runs
//   /// valueTypes validations and store the errors in The RowAction.error,
//   /// so when RowAction.type = ON_SAVE, check for errors
//   /// ```dart
//   /// _repository.updateErrorList(rowAction);
//   /// if (action.error != null) {
//   ///    return StoreResult(
//   ///      uid: action.id,
//   ///      valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   /// }
//   ///```
//   /// _repository.updateErrorList, so on runDataIntegrity we get
//   /// notified about those validation errors
//   Future<StoreResult> _processUserAction(RowAction? action) async {
//     final repository = getFormRepository();
//     switch (action?.type) {
//       /// loading, save data, validate and store result of validation on errorsMap,
//       /// so when we want to run integrity check it give us the errors, but it still
//       /// has saved the data into the database. it will only
//       ///
//       /// When change focus, if last LastFocusedTextItem is not null,
//       /// validate it for errors, when it has error in its entered item
//       /// it will repository.updateErrorList, so on runDataIntegrity we get
//       /// notified about those validation errors
//       //   case ActionType.ON_FOCUS:
//       //   case ActionType.ON_NEXT:
//       // final StoreResult storeResult = await _saveLastFocusedIfText(action!);
//       // final StoreResult storeResult = await saveFormItems(action!);
//       // repository.setFocusedItem(action);
//       //   return storeResult;
//       /// upon returning, need to processCalculatedItems() and update state
//       case ActionType.ON_SAVE:
//         // TODO
//         // if (action.valueType == ValueType.Coordinate) {
//         //   repository.setFieldRequestingCoordinates(action.id, false);
//         // }
//         repository.updateErrorList(action);
//
//         /// if field has error, do not update the finalized list for fields
//         ///
//         if (action!.hasError) {
//           /// won't update the state
//           return StoreResult(
//               uid: action.id,
//               valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//         } else {
//           // final StoreResult? saveResult =
//           //     await repository.save(action.id, action.value, action.extraData);
//           await repository.updateValueOnList(
//               action.id, action.value, action.valueType);
//           return StoreResult(
//               uid: action.id, valueStoreResult: ValueStoreResult.VALUE_CHANGED);
//         }
//
//       case ActionType.ON_TEXT_CHANGE:
//         if (action!.hasError) {
//           /// won't update the list
//           return StoreResult(
//               uid: action.id,
//               valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//         }
//         await repository.updateValueOnList(
//             action.id, action.value, action.valueType);
//         return StoreResult(
//             uid: action.id, valueStoreResult: ValueStoreResult.TEXT_CHANGING);
//
//       /// upon returning, need to processCalculatedItems() and update state
//       case ActionType.ON_SECTION_CHANGE:
//         // TODO
//         // repository.updateSectionOpened(action);
//         return StoreResult(
//             uid: action!.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//
//       case ActionType.ON_CLEAR:
//         repository.removeAllValues();
//
//         return StoreResult(
//             uid: action!.id, valueStoreResult: ValueStoreResult.VALUE_CHANGED);
//
//       /// upon returning, need to processCalculatedItems() and update state
//       case ActionType.ON_FINISH:
//         repository.batchUpdateValues(action!.formData);
//
//         return const StoreResult(
//             uid: '', valueStoreResult: ValueStoreResult.FINISH);
//
//       /// upon returning, need to processCalculatedItems() and update state
//       case ActionType.ON_REQUEST_COORDINATES:
//         // TODO repository.setFieldRequestingCoordinates(action.id, true);
//
//         return StoreResult(
//             uid: action!.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//
//       /// upon returning, need to processCalculatedItems() and update state
//       case ActionType.ON_CANCELL_REQUEST_COORDINATES:
//         // TODO repository.setFieldRequestingCoordinates(action.id, false);
//
//         return StoreResult(
//             uid: action!.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//
//       default:
//
//         /// upon returning, need to processCalculatedItems() and update state
//         return StoreResult(
//             uid: 'action!.id',
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//     }
//   }
//
//   // /// upon returning, need to processCalculatedItems() and update state
//   // /// loading, save data, validate and store result of validation on errorsMap,
//   // /// so when we want to run integrity check it give us the errors, but it still
//   // /// has saved the data into the database. it will only
//   // ///
//   // /// When change focus, if last LastFocusedTextItem is not null,
//   // /// validate it for errors, when it has error in its entered item
//   // /// it will _repository.updateErrorList, so on runDataIntegrity we get
//   // /// notified about those validation errors
//   // Future<StoreResult> _saveLastFocusedIfText(RowAction rowAction) async {
//   //   final repository = getFormRepository();
//   //   final QFieldModel? field = _getLastFocusedTextItem();
//   //   if (field != null) {
//   //     final Exception? error =
//   //         _checkFieldError(field.valueType, field.value, field.fieldMask);
//   //     if (error != null) {
//   //       final RowAction? action = _rowActionFromIntent(FormIntent.onSave(
//   //           uid: field.uid,
//   //           value: field.value,
//   //           valueType: field.valueType,
//   //           fieldMask: field.fieldMask));
//   //       repository.updateErrorList(action);
//   //
//   //       /// upon returning, need to processCalculatedItems() and update state
//   //       return StoreResult(
//   //           uid: rowAction.id,
//   //           valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   //     } else {
//   //       // _getSaveIntent
//   //       final FormIntent intent = FormIntent.onSave(
//   //           uid: field.uid,
//   //           value: field.value,
//   //           valueType: field.valueType,
//   //           fieldMask: field.fieldMask);
//   //       final RowAction? action = _rowActionFromIntent(intent);
//   //       final StoreResult? result =
//   //           await repository.save(field.uid, field.value, action?.extraData);
//   //       await repository.updateValueOnList(
//   //           field.uid, field.value, field.valueType);
//   //       repository.updateErrorList(action);
//   //       if (result != null) {
//   //         return result;
//   //       }
//   //     }
//   //   }
//   //
//   //   /// upon returning, need to processCalculatedItems() and update state
//   //   return StoreResult(
//   //       uid: rowAction.id,
//   //       valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   // }
//
//   /// This method doesn't make any save to the database
//   /// it runs value type validators and store the result in **[RowAction.error]**
//   /// and determines the action type from the passed **[FormIntent]**.
//   ///
//   /// Intents that will result in an action of Type **[ActionType.ON_SAVE]**
//   /// which will trigger a save for the field in the database are:
//   ///
//   /// **[FormIntent.clearValue(uid)]**, and **[FormIntent.onSave(uid: uid)]**,
//   /// the remaining intents will return an **ActionType** with the same name:
//   ///
//   /// **[FormIntent.onClear()]**` => will clear uid and value and set type to [ActionType.ON_CLEAR].
//   ///
//   /// **[FormIntent.clearValue(uid)]**` => will clear value and set type to [ActionType.ON_SAVE].
//   ///
//   /// **[FormIntent.onNext(uid: uid)]** => will type set to [ActionType.ON_NEXT].
//   ///
//   /// **[FormIntent.onFocus(uid, value)]** => [ActionType.ON_FOCUS].
//   ///
//   /// **[FormIntent.onTextChange(uid, value)]** => [ActionType.ON_TEXT_CHANGE].
//   ///
//   /// **[FormIntent.onFinish()]** => [ActionType.ON_FINISH].
//   ///
//   /// ...
//   ///
//   RowAction? _rowActionFromIntent(FormIntent intent) {
//     return intent.mapOrNull(
//         onClear: (OnClear intent) => _createRowAction(
//             uid: '', value: null, actionType: ActionType.ON_CLEAR),
//         // OnSave
//         clearValue: (ClearValue intent) =>
//             _createRowAction(uid: intent.uid, value: null),
//         onNext: (OnNext intent) => _createRowAction(
//             uid: intent.uid,
//             value: intent.value,
//             actionType: ActionType.ON_NEXT),
//         onSave: (OnSave intent) {
//           /// validate against valueType defined validators
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
//         onTextChange: (OnTextChange intent) {
//           /// validate against valueType defined validators
//           final Exception? error = _checkFieldError(
//               intent.valueType, intent.value, intent.fieldMask);
//           return _createRowAction(
//               uid: intent.uid,
//               value: intent.value,
//               error: error,
//               actionType: ActionType.ON_TEXT_CHANGE,
//               valueType: ValueType.Text);
//         },
//         onSection: (OnSection intent) => _createRowAction(
//             uid: intent.sectionUid,
//             value: null,
//             actionType: ActionType.ON_SECTION_CHANGE),
//         onFinish: (OnFinish intent) => _createRowAction(
//             uid: '',
//             value: null,
//             formData: intent.formData,
//             actionType: ActionType.ON_FINISH),
//         init: (Init intent) => _createRowAction(
//             uid: '', value: null, actionType: ActionType.ON_INIT));
//   }
//
//   /// _createRowAction Global to this file function
//   RowAction _createRowAction(
//           {required String uid,
//           String? value,
//           Map<String, dynamic>? formData,
//           String? extraData,
//           Exception? error,
//           ActionType actionType = ActionType.ON_SAVE,
//           ValueType? valueType}) =>
//       RowAction(
//           id: uid,
//           formData: formData,
//           value: value,
//           extraData: extraData,
//           error: error,
//           type: actionType,
//           valueType: valueType);
//
//   QFieldModel? _getLastFocusedTextItem() {
//     final repository = getFormRepository();
//     final QFieldModel? currentFocusedItem = repository
//         .currentFocusedItem()
//         ?.takeIf((QFieldModel item) =>
//             item.valueType?.let(
//                 (ValueType valueType) => valueTypeIsTextField(valueType)) ??
//             false);
//     return currentFocusedItem;
//   }
//
//   bool valueTypeIsTextField(ValueType valueType) {
//     return valueType.isNumeric ||
//         valueType == ValueType.URL ||
//         valueType == ValueType.Email ||
//         valueType == ValueType.PhoneNumber;
//   }
//
//   ValidationException? _checkFieldError(
//       ValueType? valueType, String? fieldValue, String? fieldMask) {
//     if ((fieldValue ?? '').isNotEmpty) {
//       final Result<String, ValidationException>? result =
//           valueType?.validator.validate(fieldValue!);
//
//       final errorOrNull =
//           result?.fold((failure) => failure, (String success) => null);
//
//       return errorOrNull;
//     }
//
//     return null;
//     // /// for debugging or directly return it
//     // final ValidationException? checkResult = fieldValue!.let((String value) {
//     //   ValidationException? error;
//     //
//     //   final Result<String, ValidationException>? result = valueType
//     //       ?.takeIf((ValueType item) => item != ValueType.Image)
//     //       ?.validator
//     //       .validate(value);
//     //
//     //   /// if result is failure return it or null otherwise.
//     //   if(result?.isFailure ?? false){
//     //
//     //   }
//     //   error = result?.fold((failure) => failure, (String success) => null);
//     //
//     //   return error;
//     // });
//     //
//     // return checkResult;
//   }
//
//   /// called when:
//   ///
//   /// 1- onBack btn pressed
//   ///
//   /// 2- When User presses save after finishing entry, which emits a [FormIntent]
//   /// of [OnFinish] which gets converted to [RowAction] of
//   /// [ActionType.ON_FINISH], which then converted to a [StoreResult] of
//   /// [ValueStoreResult.FINISH]
//   void runDataIntegrityCheck({bool? backButtonPressed}) {
//     // TODO
//     // final result = _repository.runDataIntegrityCheck(
//     //     allowDiscard: backButtonPressed ?? false);
//     processCalculatedItems();
//   }
//
//   /// This method decide whether to Update the FormStateNotifier
//   /// or not based on **[StoreResult.ValueStoreResult]** state, will notify
//   /// the screen with the result:
//   ///
//   /// To notify the main screen on ItemChanged when ValueStoreResult.VALUE_CHANGED
//   /// , it will **[processCalculatedItems()]** after all [ValueStoreResult]
//   /// types and will run integrity check at the end.
//   /// ValueStoreResult.TEXT_CHANGING: will update **queryData**
//   /// and [processCalculatedItems()], **queryData** is listened to from
//   /// widget to send to main widget when needToForceUpdate:
//   ///
//   /// ```dart
//   /// if (widget.needToForceUpdate) {
//   ///   widget.onItemChangeListener?.let((it) => it(rowAction));
//   /// }
//   ///```
//   /// ValueStoreResult.FINISH: will trigger [runDataIntegrityCheck();] and [processCalculatedItems()]
//   ///
//   /// ValueStoreResult.VALUE_HAS_NOT_CHANGED: will do nothing just [processCalculatedItems()]
//   ///
//   /// ValueStoreResult.VALUE_CHANGED: will update the **savedValue**,
//   /// To notify the main screen on ItemChanged
//   ///
//   /// ValueStoreResult.ERROR_UPDATING_VALUE: will show a toast
//   ///
//   ///
//   void _displayResult(Pair<RowAction?, StoreResult> result) {
//     switch (result.second.valueStoreResult) {
//       /// To notify the main screen on
//       case ValueStoreResult.VALUE_CHANGED:
//         processCalculatedItems();
//         break;
//
//       case ValueStoreResult.ERROR_UPDATING_VALUE:
//         break;
//
//       case ValueStoreResult.UID_IS_NOT_DE_OR_ATTR:
//         processCalculatedItems();
//         break;
//       case ValueStoreResult.VALUE_NOT_UNIQUE:
//         processCalculatedItems();
//         break;
//
//       case ValueStoreResult.VALUE_HAS_NOT_CHANGED:
//         processCalculatedItems();
//         break;
//       case ValueStoreResult.TEXT_CHANGING:
//         processCalculatedItems();
//         break;
//       case ValueStoreResult.FINISH:
//         processCalculatedItems();
//         runDataIntegrityCheck();
//         break;
//       default:
//     }
//   }
// }
