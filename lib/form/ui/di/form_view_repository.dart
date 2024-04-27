// import 'package:d2_remote/core/common/exception/exception.dart';
// import 'package:d2_remote/core/common/feature_type.dart';
// import 'package:d2_remote/core/common/value_type.dart';
// import 'package:d2_remote/core/mp/helpers/result.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// import '../../../commons/extensions/standard_extensions.dart';
// import '../../../commons/extensions/string_extension.dart';
// import '../../data/data_integrity_check_result.dart';
// import '../../data/form_repository.dart';
// import '../../model/Ui_render_type.dart';
// import '../../model/action_type.dart';
// import '../../model/field_ui_model.dart';
// import '../../model/row_action.dart';
// import '../../model/store_result.dart';
// import '../../model/value_store_result.dart';
// import '../intent/form_intent.dart';
// import '../validation/validators/field_mask_validator.dart';
// import 'form_view_notifier_providers.dart';
//
// class FormViewRepository {
//   FormViewRepository(this.ref, this.repository);
//
//   final AutoDisposeProviderRef<FormViewRepository> ref;
//
//   final FormRepository repository;
//
//   // Future<StoreResult> processUserAction(RowAction action) async {
//   //   switch (action.type) {
//   //     case ActionType.ON_SAVE:
//   //       if (action.valueType == ValueType.COORDINATE) {
//   //         repository.setFieldRequestingCoordinates(action.id, false);
//   //       }
//   //       repository.updateErrorList(action);
//   //       if (action.error != null) {
//   //         return StoreResult(
//   //             uid: action.id,
//   //             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   //       } else {
//   //         final StoreResult? saveResult =
//   //             await repository.save(action.id, action.value, action.extraData);
//   //         await repository.updateValueOnList(
//   //             action.id, action.value, action.valueType);
//   //         return saveResult ??
//   //             StoreResult(
//   //                 uid: action.id,
//   //                 valueStoreResult: ValueStoreResult.VALUE_CHANGED);
//   //       }
//   //
//   //     case ActionType.ON_FOCUS:
//   //     case ActionType.ON_NEXT:
//   //       final StoreResult storeResult = await _saveLastFocusedItem(action);
//   //       repository.setFocusedItem(action);
//   //       return storeResult;
//   //
//   //     case ActionType.ON_TEXT_CHANGE:
//   //       await repository.updateValueOnList(
//   //           action.id, action.value, action.valueType);
//   //       return StoreResult(
//   //           uid: action.id, valueStoreResult: ValueStoreResult.TEXT_CHANGING);
//   //     case ActionType.ON_SECTION_CHANGE:
//   //       repository.updateSectionOpened(action);
//   //       return StoreResult(
//   //           uid: action.id,
//   //           valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   //
//   //     case ActionType.ON_CLEAR:
//   //       repository.removeAllValues();
//   //       return StoreResult(
//   //           uid: action.id, valueStoreResult: ValueStoreResult.VALUE_CHANGED);
//   //
//   //     case ActionType.ON_FINISH:
//   //       repository.setFocusedItem(action);
//   //       return const StoreResult(
//   //           uid: '', valueStoreResult: ValueStoreResult.FINISH);
//   //
//   //     case ActionType.ON_REQUEST_COORDINATES:
//   //       repository.setFieldRequestingCoordinates(action.id, true);
//   //       return StoreResult(
//   //           uid: action.id,
//   //           valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   //
//   //     case ActionType.ON_CANCELL_REQUEST_COORDINATES:
//   //       repository.setFieldRequestingCoordinates(action.id, false);
//   //       return StoreResult(
//   //           uid: action.id,
//   //           valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   //     case ActionType.ON_INIT:
//   //       return StoreResult(
//   //           uid: action.id,
//   //           valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   //   }
//   // }
//
//   // Future<StoreResult> _saveLastFocusedItem(RowAction rowAction) async {
//   //   final FieldUiModel? field = _getLastFocusedTextItem();
//   //   if (field != null) {
//   //     final Exception? error =
//   //         _checkFieldError(field.valueType, field.value, field.fieldMask);
//   //     if (error != null) {
//   //       final RowAction action = rowActionFromIntent(FormIntent.onSave(
//   //           uid: field.uid,
//   //           value: field.value,
//   //           valueType: field.valueType,
//   //           fieldMask: field.fieldMask));
//   //       repository.updateErrorList(action);
//   //       return StoreResult(
//   //           uid: rowAction.id,
//   //           valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   //     } else {
//   //       final FormIntent intent = _getSaveIntent(field);
//   //       final RowAction action = rowActionFromIntent(intent);
//   //       final StoreResult? result =
//   //           await repository.save(field.uid, field.value, action.extraData);
//   //       await repository.updateValueOnList(
//   //           field.uid, field.value, field.valueType);
//   //       repository.updateErrorList(action);
//   //       if (result != null) {
//   //         return result;
//   //       }
//   //     }
//   //   }
//   //   return StoreResult(
//   //       uid: rowAction.id,
//   //       valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//   // }
//
//   // RowAction _createRowAction(
//   //         {required String uid,
//   //         String? value,
//   //         String? extraData,
//   //         Exception? error,
//   //         ActionType actionType = ActionType.ON_SAVE,
//   //         ValueType? valueType}) =>
//   //     RowAction(
//   //         id: uid,
//   //         value: value,
//   //         extraData: extraData,
//   //         error: error,
//   //         type: actionType,
//   //         valueType: valueType);
//
//   // RowAction rowActionFromIntent(FormIntent intent) {
//   //   return intent.map(
//   //     onClear: (OnClear intent) => _createRowAction(
//   //         uid: '', value: null, actionType: ActionType.ON_CLEAR),
//   //     clearValue: (ClearValue intent) =>
//   //         _createRowAction(uid: intent.uid, value: null),
//   //     selectLocationFromCoordinates: (SelectLocationFromCoordinates intent) {
//   //       final Exception? error =
//   //           _checkFieldError(ValueType.COORDINATE, intent.coordinates, null);
//   //       return _createRowAction(
//   //           uid: intent.uid,
//   //           value: intent.coordinates,
//   //           extraData: intent.extraData,
//   //           error: error,
//   //           valueType: ValueType.COORDINATE);
//   //     },
//   //     selectLocationFromMap: (SelectLocationFromMap intent) =>
//   //         _setCoordinateFieldValue(
//   //             fieldUid: intent.uid,
//   //             featureType: intent.featureType,
//   //             coordinates: intent.coordinates),
//   //     saveCurrentLocation: (SaveCurrentLocation intent) {
//   //       final Exception? error =
//   //           _checkFieldError(ValueType.COORDINATE, intent.value, null);
//   //       return _createRowAction(
//   //           uid: intent.uid,
//   //           value: intent.value,
//   //           extraData: intent.featureType,
//   //           error: error,
//   //           valueType: ValueType.COORDINATE);
//   //     },
//   //     onNext: (OnNext intent) => _createRowAction(
//   //         uid: intent.uid, value: intent.value, actionType: ActionType.ON_NEXT),
//   //     onSave: (OnSave intent) {
//   //       final Exception? error =
//   //           _checkFieldError(intent.valueType, intent.value, intent.fieldMask);
//   //       return _createRowAction(
//   //           uid: intent.uid,
//   //           value: intent.value,
//   //           error: error,
//   //           valueType: intent.valueType);
//   //     },
//   //     onFocus: (OnFocus intent) => _createRowAction(
//   //         uid: intent.uid,
//   //         value: intent.value,
//   //         actionType: ActionType.ON_FOCUS),
//   //     onTextChange: (OnTextChange intent) => _createRowAction(
//   //         uid: intent.uid,
//   //         value: intent.value,
//   //         actionType: ActionType.ON_TEXT_CHANGE,
//   //         valueType: ValueType.TEXT),
//   //     onSection: (OnSection intent) => _createRowAction(
//   //         uid: intent.sectionUid,
//   //         value: null,
//   //         actionType: ActionType.ON_SECTION_CHANGE),
//   //     onFinish: (OnFinish intent) => _createRowAction(
//   //         uid: '', value: null, actionType: ActionType.ON_FINISH),
//   //     onRequestCoordinates: (OnRequestCoordinates intent) => _createRowAction(
//   //         uid: intent.uid,
//   //         value: null,
//   //         actionType: ActionType.ON_REQUEST_COORDINATES),
//   //     onCancelRequestCoordinates: (OnCancelRequestCoordinates intent) =>
//   //         _createRowAction(
//   //             uid: intent.uid,
//   //             value: null,
//   //             actionType: ActionType.ON_CANCELL_REQUEST_COORDINATES),
//   //     init: (Init intent) => _createRowAction(
//   //         uid: '', value: null, actionType: ActionType.ON_INIT),
//   //   );
//   // }
//
//   // FieldUiModel? _getLastFocusedTextItem() {
//   //   return repository.currentFocusedItem()?.takeIf((FieldUiModel item) =>
//   //       item.valueType?.let((ValueType valueType) =>
//   //           valueTypeIsTextField(valueType, item.renderingType)) ??
//   //       false);
//   // }
//
//   // FormIntent _getSaveIntent(FieldUiModel field) {
//   //   switch (field.valueType) {
//   //     case ValueType.COORDINATE:
//   //       return FormIntent.saveCurrentLocation(
//   //           uid: field.uid,
//   //           value: field.value,
//   //           featureType: 'POINT' /*getFeatureType(field.renderingType).name*/);
//   //     default:
//   //   }
//   //   return FormIntent.onSave(
//   //       uid: field.uid,
//   //       value: field.value,
//   //       valueType: field.valueType,
//   //       fieldMask: field.fieldMask);
//   // }
//   //
//   // bool valueTypeIsTextField(ValueType valueType, [UiRenderType? renderType]) {
//   //   return valueType.isNumeric ||
//   //       valueType.isText && renderType?.isPolygon != true ||
//   //       valueType == ValueType.URL ||
//   //       valueType == ValueType.EMAIL ||
//   //       valueType == ValueType.PHONE_NUMBER;
//   // }
//
//   // RowAction _setCoordinateFieldValue(
//   //     {required String fieldUid,
//   //     required String featureType,
//   //     String? coordinates}) {
//   //   final FeatureType? type = FeatureType.valueOfFeatureType(featureType);
//   //   String? geometryCoordinates;
//   //   /*coordinates?.let {
//   // geometryController.generateLocationFromCoordinates(
//   //     type,
//   //     coordinates
//   //     )?.coordinates();*/
//   //
//   //   Exception? error;
//   //   if (type == FeatureType.POINT) {
//   //     error = _checkFieldError(ValueType.COORDINATE, geometryCoordinates, null);
//   //   } else {
//   //     error = null;
//   //   }
//   //
//   //   return _createRowAction(
//   //       uid: fieldUid,
//   //       value: geometryCoordinates,
//   //       extraData: featureType,
//   //       error: error,
//   //       valueType: ValueType.COORDINATE);
//   // }
//
//   // Exception? _checkFieldError(
//   //     ValueType? valueType, String? fieldValue, String? fieldMask) {
//   //   if (fieldValue.isNullOrEmpty) {
//   //     return null;
//   //   }
//   //
//   //   return fieldValue!.let((String value) {
//   //     Exception? error;
//   //     final Result<String, ThrowableException>? result = valueType
//   //         ?.takeIf((ValueType item) => item != ValueType.IMAGE)
//   //         ?.validator
//   //         .validate(value);
//   //     error = result?.fold(
//   //         (Exception failure) => failure, (String success) => null);
//   //
//   //     fieldMask?.let((String mask) {
//   //       final Result<String, ThrowableException> result =
//   //           FieldMaskValidator(mask).validate(value);
//   //       error = result.fold(
//   //           (Exception failure) => failure, (String success) => error);
//   //     });
//   //     return error;
//   //   });
//   // }
//
//   // void discardChanges() {
//   //   repository.backupOfChangedItems().forEach((FieldUiModel item) => ref
//   //       .read(formPendingIntentsProvider.notifier)
//   //       .submitIntent((_) => FormIntent.onSave(
//   //           uid: item.uid,
//   //           value: item.value,
//   //           valueType: item.valueType,
//   //           fieldMask: item.fieldMask)));
//   // }
//
//   // void saveDataEntry() {
//   //   _getLastFocusedTextItem()?.let((FieldUiModel it) => ref
//   //       .read(formPendingIntentsProvider.notifier)
//   //       .submitIntent((_) => _getSaveIntent(it)));
//   //
//   //   ref
//   //       .read(formPendingIntentsProvider.notifier)
//   //       .submitIntent((_) => const FormIntent.onFinish());
//   // }
//
//   // void clearFocus() {
//   //   repository.clearFocusItem();
//   // }
//   //
//   // Future<IList<FieldUiModel>> fetchFormItems() {
//   //   return repository.fetchFormItems();
//   // }
//   //
//   // bool calculationLoopOverLimit() {
//   //   return repository.calculationLoopOverLimit();
//   // }
//   //
//   // double completedFieldsPercentage(IList<FieldUiModel> value) {
//   //   return repository.completedFieldsPercentage(value);
//   // }
//
//   // Future<DataIntegrityCheckResult> runDataIntegrityCheck(
//   //     {required bool allowDiscard}) {
//   //   return repository.runDataIntegrityCheck(allowDiscard: allowDiscard);
//   // }
//
//   // Future<IList<FieldUiModel>> composeList() {
//   //   return repository.composeList();
//   // }
// }
