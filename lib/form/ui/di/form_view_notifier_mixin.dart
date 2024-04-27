// import 'package:d2_remote/core/common/value_type.dart';
// import 'package:fast_immutable_collections/fast_immutable_collections.dart';
//
// import '../../../commons/extensions/standard_extensions.dart';
// import '../../di/injector.dart';
// import '../../model/Ui_render_type.dart';
// import '../../model/action_type.dart';
// import '../../model/field_ui_model.dart';
// import '../../model/row_action.dart';
// import '../../model/store_result.dart';
// import '../../model/value_store_result.dart';
// import '../intent/form_intent.dart';
// import 'form_view_notifier.dart';
//
// extension FormViewItemsExtension on FormViewItems {
//   Future<StoreResult> processUserAction(RowAction action) async {
//     final repository = ref.read(formRepositoryProvider);
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
//       case ActionType.ON_INIT:
//         return StoreResult(
//             uid: action.id,
//             valueStoreResult: ValueStoreResult.VALUE_HAS_NOT_CHANGED);
//     }
//   }
//
//   Future<StoreResult> _saveLastFocusedItem(RowAction rowAction) async {
//     final repository = ref.read(formRepositoryProvider);
//     final FieldUiModel? field = _getLastFocusedTextItem();
//     if (field != null) {
//       final Exception? error =
//       _checkFieldError(field.valueType, field.value, field.fieldMask);
//       if (error != null) {
//         final RowAction action = _getRowActionFromIntent(FormIntent.onSave(
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
//         final RowAction action = _getRowActionFromIntent(intent);
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
//   /// called when:
//   ///
//   /// 1- onBack btn pressed
//   ///
//   /// 2- When User presses save after finishing entry, which emits a [FormIntent]
//   /// of [OnFinish] which gets converted to [RowAction] of
//   /// [ActionType.ON_FINISH], which then converted to a [StoreResult] of
//   /// [ValueStoreResult.FINISH]
//   void runDataIntegrityCheck({bool? backButtonPressed}) {
//     ref
//         .read(formRepositoryProvider)
//         .runDataIntegrityCheck(allowDiscard: backButtonPressed ?? false)
//         .then((integrityResult) {
//       ref.read(formModelNotifierProvider.notifier).updateValue(
//               (current) => current.copyWith(dataIntegrityResult: integrityResult));
//     }).then((_) => processCalculatedItems());
//   }
//
//   // TODO(NMC): move to another provider so we don't have to change another notifier
//   // from this notifier and directly call this function from widget tree
//   void saveDataEntry() {
//     _getLastFocusedTextItem()?.let((FieldUiModel it) => ref
//         .read(formPendingIntentsProvider.notifier)
//         .submitIntent((_) => _getSaveIntent(it)));
//
//     ref
//         .read(formPendingIntentsProvider.notifier)
//         .submitIntent((_) => const FormIntent.onFinish());
//   }
//
//   // TODO(NMC): move to another provider so we don't have to change another notifier
//   // from this notifier and directly call this function from widget tree
//   void discardChanges() {
//     final repository = ref.read(formRepositoryProvider);
//     repository.backupOfChangedItems().forEach((FieldUiModel item) => ref
//         .read(formPendingIntentsProvider.notifier)
//         .submitIntent((_) => FormIntent.onSave(
//         uid: item.uid,
//         value: item.value,
//         valueType: item.valueType,
//         fieldMask: item.fieldMask)));
//   }
//
//   FieldUiModel? _getLastFocusedTextItem() {
//     final repository = ref.read(formRepositoryProvider);
//     return repository.currentFocusedItem()?.takeIf((FieldUiModel item) =>
//     item.valueType?.let((ValueType valueType) =>
//         valueTypeIsTextField(valueType, item.renderingType)) ??
//         false);
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
//   void clearFocus() {
//     ref.read(formRepositoryProvider).clearFocusItem();
//   }
//
//   bool calculationLoopOverLimit() {
//     return ref.read(formRepositoryProvider).calculationLoopOverLimit();
//   }
//
//   double completedFieldsPercentage(IList<FieldUiModel> value) {
//     return ref.read(formRepositoryProvider).completedFieldsPercentage(value);
//   }
// }
